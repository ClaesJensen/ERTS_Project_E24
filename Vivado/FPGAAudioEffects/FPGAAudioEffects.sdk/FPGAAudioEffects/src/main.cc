#define HLS_NO_XIL_FPO_LIB
#include <xparameters.h>
#include <xil_io.h>
#include <xstatus.h>
#include <xiicps.h>
#include <xscutimer.h>
#include <xscugic.h>
#include "zybo_audio.hpp"
#undef str //Have to do this because of some weird bug...
#include <ap_fixed.h>
#include <xbiquadv2start.h>
#include <xbiquadv2between.h>
#include <xbiquadv2end.h>



typedef ap_fixed<27, 3, AP_RND, AP_SAT> coeff_t; //typedef ap_fixed<27, 3, AP_RND, AP_SAT> coeff_t;

#define TIMER_FREQ_HZ (XPAR_CPU_CORTEXA9_0_CPU_CLK_FREQ_HZ / 2)
#define N_BIQUAD_BETWEEN 1

XIicPs Iic;
XScuTimer TimerInstance;
XScuGic ScuGic;

XBiquadv2start biquad_start;
XBiquadv2end biquad_end;
XBiquadv2between biquad_between[N_BIQUAD_BETWEEN];
uint32_t biquad_between_ids[N_BIQUAD_BETWEEN] = {
	XPAR_XBIQUADV2BETWEEN_0_DEVICE_ID,
	//XPAR_XBIQUADV2BETWEEN_1_DEVICE_ID,
	//XPAR_XBIQUADV2BETWEEN_2_DEVICE_ID,
	//XPAR_XBIQUADV2BETWEEN_3_DEVICE_ID,
	//XPAR_XBIQUADV2BETWEEN_4_DEVICE_ID,
	//XPAR_XBIQUADV2BETWEEN_5_DEVICE_ID
};


uint8_t biquad_left_done, biquad_right_done, biquad_end_done;

unsigned char IicConfig(unsigned int DeviceIdPS) {

	XIicPs_Config *Config;
	int Status;

	//Initialize the IIC driver so that it's ready to use
	//Look up the configuration in the config table, then initialize it.
	Config = XIicPs_LookupConfig(DeviceIdPS);
	if(NULL == Config) {
		return XST_FAILURE;
	}

	Status = XIicPs_CfgInitialize(&Iic, Config, Config->BaseAddress);
	if(Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	//Set the IIC serial clock rate.
	XIicPs_SetSClk(&Iic, IIC_SCLK_RATE);

	return XST_SUCCESS;
}

void AudioWriteToReg(unsigned char u8RegAddr, short u16Data) {

	unsigned char u8TxData[2];

	u8TxData[0] = (u8RegAddr << 1 ) | ((u16Data >> 8) & 0x01); // append msb of 9-bit data to the reg addr after shifting left
	u8TxData[1] = u16Data & 0xFF;

	XIicPs_MasterSendPolled(&Iic, u8TxData, 2, IIC_SLAVE_ADDR);
	while(XIicPs_BusIsBusy(&Iic));
}

int TimerInitialize(void)
{
	int Status;
	XScuTimer *TimerInstancePtr = &TimerInstance;
	XScuTimer_Config *ConfigTmrPtr;

	/* Initialize the Scu Private Timer driver. */
	ConfigTmrPtr = XScuTimer_LookupConfig(XPAR_PS7_SCUTIMER_0_DEVICE_ID);

	/* This is where the virtual address would be used, this uses physical address. */
	Status = XScuTimer_CfgInitialize(TimerInstancePtr, ConfigTmrPtr,
			ConfigTmrPtr->BaseAddr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/* Disable Auto reload mode and set prescaler to 1 */
	XScuTimer_SetPrescaler(TimerInstancePtr, 0);

	return Status;
}

void TimerDelay(u32 uSDelay)
{
	u32 timerCnt;

	timerCnt = (TIMER_FREQ_HZ / 1000000) * uSDelay;

	XScuTimer_Stop(&TimerInstance);
	XScuTimer_DisableAutoReload(&TimerInstance);
	XScuTimer_LoadTimer(&TimerInstance, timerCnt);
	XScuTimer_Start(&TimerInstance);
	while (XScuTimer_GetCounterValue(&TimerInstance));

	return;
}

void LineinLineoutConfig() {

	// software reset
	AudioWriteToReg(R15_SOFTWARE_RESET, 0x000);
	TimerDelay(75000);
	// power mgmt: 0_00110010=>0,Power up, power up, OSC dn, out off, DAC up, ADC up, MIC off, LineIn up
	AudioWriteToReg(R6_POWER_MANAGEMENT, 0x030);
	// left ADC Input: 0_01010111=>0,mute disable, Line volume 0 dB
	AudioWriteToReg(R0_LEFT_ADC_INPUT,0x017);
	// right ADC Input: 0_00010111=>0,mute disable, Line volume 0 dB
	AudioWriteToReg(R1_RIGHT_ADC_INPUT,0x017);
	AudioWriteToReg(R2_LEFT_DAC_VOLUME,0x079);
	AudioWriteToReg(R3_RIGHT_DAC_VOLUME,0x079);
	// analog audio path: 0_00010010=>0,-6 dB side attenuation, sidetone off, DAC selected, bypass disabled, line input, mic mute disabled, 0 dB mic
	AudioWriteToReg(R4_ANALOG_AUDIO_PATH, 0x012);
	// digital audio path: 0_00000000=>0_000, clear offset, no mute, no de-emphasize, adc high-pass filter enabled
	AudioWriteToReg(R5_DIGITAL_AUDIO_PATH, 0x000);
	// digital audio interface: 0_00001110=>0, BCLK not inverted, slave mode, no l-r swap, normal LRC and PBRC, 24-bit, I2S mode
	AudioWriteToReg(R7_DIGITAL_AUDIO_INTERFACE, 0x00A);
	TimerDelay(75000);
	// Digital core:0_00000001=>0_0000000, activate core
	AudioWriteToReg(R9_ACTIVE, 0x001);
	// power mgmt: 0_00100010 0_Power up, power up, OSC dn, out ON, DAC up, ADC up, MIC off, LineIn up
	AudioWriteToReg(R6_POWER_MANAGEMENT, 0x022); // power mgmt: 001100010 turn on OUT

}


void biquad_end_interrupt_callback(void* InstancePtr) {
	XBiquadv2end *pBiquad = (XBiquadv2end*) InstancePtr;
	XBiquadv2end_InterruptClear(pBiquad, 1);
	biquad_end_done = 1;
}

int SetupInterrupt()
{
	   //This functions sets up the interrupt on the ARM
	   int result;
	   XScuGic_Config *pCfg = XScuGic_LookupConfig(XPAR_SCUGIC_0_DEVICE_ID);
	   if (pCfg == NULL){
	      print("Interrupt Configuration Lookup Failed\n\r");
	      return XST_FAILURE;
	   }

	   result = XScuGic_CfgInitialize(&ScuGic,pCfg,pCfg->CpuBaseAddress);
	   if(result != XST_SUCCESS){
	      return result;
	   }
	   // self test
	   result = XScuGic_SelfTest(&ScuGic);
	   if(result != XST_SUCCESS){
	      return result;
	   }
	   // Initialize the exception handler
	   Xil_ExceptionInit();
	   // Register the exception handler
	   Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,(Xil_ExceptionHandler)XScuGic_InterruptHandler,&ScuGic);
	   //Enable the exception handler
	   Xil_ExceptionEnable();

	   //BIQUADV2END ISR
	   result = XScuGic_Connect(&ScuGic, XPAR_FABRIC_PARAMETRICEQ_BIQUADV2END_0_INTERRUPT_INTR, (Xil_InterruptHandler)biquad_end_interrupt_callback, &biquad_end);
	   if(result != XST_SUCCESS){
	      return result;
	   }

	   // Enable the BIQUADV2END ISR
	   XScuGic_Enable(&ScuGic, XPAR_FABRIC_PARAMETRICEQ_BIQUADV2END_0_INTERRUPT_INTR);
	   return XST_SUCCESS;
}


int BiquadChainInit(XBiquadv2start* biquad_start, XBiquadv2end* biquad_end, XBiquadv2between* biquad_between, uint32_t* biquad_ids, uint32_t nbiquad_between) {
	XBiquadv2start_Config *cfg_start;
	XBiquadv2end_Config *cfg_end;
	XBiquadv2between_Config *cfg_between;
	int status;

	//START INIT
	cfg_start = XBiquadv2start_LookupConfig(XPAR_XBIQUADV2START_0_DEVICE_ID);
	if (!cfg_start) {
		xil_printf("ERROR: Biquad start config failed!\n");
		return XST_FAILURE;
	}
	status = XBiquadv2start_CfgInitialize(biquad_start, cfg_start);
	if (status != XST_SUCCESS) {
		xil_printf("ERROR: Biquad start init failed!\n");
		return XST_FAILURE;
	}

	//LEFT INIT
	cfg_end = XBiquadv2end_LookupConfig(XPAR_XBIQUADV2END_0_DEVICE_ID);
	if (!cfg_end) {
		xil_printf("ERROR: Biquad end config failed!\n");
		return XST_FAILURE;
	}
	status = XBiquadv2end_CfgInitialize(biquad_end, cfg_end);
	if (status != XST_SUCCESS) {
		xil_printf("ERROR: Biquad end init failed!\n");
		return XST_FAILURE;
	}

	//BETWEEN INIT
	for (uint32_t i = 0; i < nbiquad_between; i++) {
		cfg_between = XBiquadv2between_LookupConfig(biquad_ids[i]);
		if (!cfg_between) {
			xil_printf("ERROR: Biquad between config %i failed!\n", i);
			return XST_FAILURE;
		}
		status = XBiquadv2between_CfgInitialize(&biquad_between[i], cfg_between);
		if (status != XST_SUCCESS) {
			xil_printf("ERROR: Biquad between init %i failed!\n", i);
			return XST_FAILURE;
		}
	}

	return status;
}



int main() {
	xil_printf("Start...\r\n");

	IicConfig(XPAR_XIICPS_0_DEVICE_ID);
	TimerInitialize();
	LineinLineoutConfig();

	if (BiquadChainInit(&biquad_start, &biquad_end, biquad_between, biquad_between_ids, N_BIQUAD_BETWEEN))  {
		xil_printf("BIQUAD Chain setup failed!\n");
		return -1;
	}

	if (SetupInterrupt() != XST_SUCCESS) {
		xil_printf("Interrupt setup failed!\n");
		return -1;
	}

	//Enable interrupts
	XBiquadv2end_InterruptEnable(&biquad_end, 1);
	XBiquadv2end_InterruptGlobalEnable(&biquad_end);

	biquad_left_done = 0;
	biquad_right_done = 0;
	biquad_end_done = 0;

	xil_printf("Setup done...\r\n");

	coeff_t scale = 1.0;

	//Configure biquad with coeffs
	//Notch f0 = 40 Hz
	XBiquadv2start_Set_b0_a0_V(&biquad_start, 15364841);
	XBiquadv2start_Set_b1_a0_V(&biquad_start, -30155609);
	XBiquadv2start_Set_b2_a0_V(&biquad_start, 15050980);
	XBiquadv2start_Set_a1_a0_V(&biquad_start, -(-30155609));
	XBiquadv2start_Set_a2_a0_V(&biquad_start, -(13638606));

	for (int i = 0; i < N_BIQUAD_BETWEEN; i++) {
		//Notch f0 = 1000 Hz
		XBiquadv2between_Set_b0_a0_V(&biquad_between[i], 16622562);
		XBiquadv2between_Set_b1_a0_V(&biquad_between[i], -33207912);
		XBiquadv2between_Set_b2_a0_V(&biquad_between[i], 16588195);
		XBiquadv2between_Set_a1_a0_V(&biquad_between[i], -(-33207912));
		XBiquadv2between_Set_a2_a0_V(&biquad_between[i], -(16433542));
	}
	//Notch f0 = 8000 Hz
	XBiquadv2end_Set_b0_a0_V(&biquad_end, 7692185);
	XBiquadv2end_Set_b1_a0_V(&biquad_end, -3934265);
	XBiquadv2end_Set_b2_a0_V(&biquad_end, 7508649);
	XBiquadv2end_Set_a1_a0_V(&biquad_end, -(-3934265));
	XBiquadv2end_Set_a2_a0_V(&biquad_end, -(-1576382));


	xil_printf("Coeffs set...\r\n");

	//Enable output
	Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, 0x00000001);


	uint32_t temp = 0;
	while(1) {
		do {
			temp = Xil_In32(I2S_STATUS_REG);
			//Wait...
		} while(temp == 0);

		//Clear ready bit
		Xil_Out32(I2S_STATUS_REG, 0x00000001);

		//Read input
		uint32_t dataL = Xil_In32(I2S_DATA_RX_L_REG);
		uint32_t dataR = Xil_In32(I2S_DATA_RX_R_REG);

		XBiquadv2start_Set_inDataLeft_V(&biquad_start, dataL);
		XBiquadv2start_Set_inDataRight_V(&biquad_start, dataR);

		biquad_end_done = 0;
		XBiquadv2end_Start(&biquad_end);

		while(!biquad_end_done);
		dataL = XBiquadv2end_Get_outDataLeft_V(&biquad_end);
		dataR = XBiquadv2end_Get_outDataRight_V(&biquad_end);

		//xil_printf("%i | %i\r\n", I2S_DATA_RX_L_REG, I2S_DATA_TX_L_REG);
		//xil_printf("0x%.8X | 0x%.8X\r\n", dataL, dataR);

		//Write to output
		Xil_Out32(I2S_DATA_TX_L_REG, dataL);
		Xil_Out32(I2S_DATA_TX_R_REG, dataR);
		dataL = Xil_In32(I2S_DATA_RX_L_REG);
		dataR = Xil_In32(I2S_DATA_RX_R_REG);
	}
	return 0;
}

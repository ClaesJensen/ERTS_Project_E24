#include <xparameters.h>
#include <xil_io.h>
#include <xstatus.h>
#include <xiicps.h>
#include <xscutimer.h>
#include "drivers/advios/xadvios_hw.h"
#include "zybo_audio.h"
#include "biquad_hw.h"
#include <xscugic.h>
#include <xbiquadv2.h>

#define TIMER_FREQ_HZ (XPAR_CPU_CORTEXA9_0_CPU_CLK_FREQ_HZ / 2)

XIicPs Iic;
XScuTimer TimerInstance;
XScuGic ScuGic;
XBiquadv2 biquad_left, biquad_right;

uint8_t biquad_left_done, biquad_right_done;

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
	while (XScuTimer_GetCounterValue(&TimerInstance))
	{}

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

void biquad_left_interrupt_callback(void* InstancePtr) {
	XBiquadv2 *pBiquad = (XBiquadv2*) InstancePtr;

	XBiquadv2_InterruptClear(pBiquad, 1);
	biquad_left_done = 1;
}

void biquad_right_interrupt_callback(void* InstancePtr) {
	XBiquadv2 *pBiquad = (XBiquadv2*) InstancePtr;

	XBiquadv2_InterruptClear(pBiquad, 1);
	biquad_right_done = 1;
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
	   // Connect the Left FIR ISR to the exception table
	   result = XScuGic_Connect(&ScuGic,XPAR_FABRIC_BIQUADV2_0_INTERRUPT_INTR,(Xil_InterruptHandler)biquad_left_interrupt_callback,&biquad_left);
	   if(result != XST_SUCCESS){
	      return result;
	   }
	   // Connect the Right FIR ISR to the exception table
	   result = XScuGic_Connect(&ScuGic,XPAR_FABRIC_BIQUADV2_1_INTERRUPT_INTR,(Xil_InterruptHandler)biquad_right_interrupt_callback,&biquad_right);
	   if(result != XST_SUCCESS){
	      return result;
	   }
	   // Enable the Left FIR ISR
	   XScuGic_Enable(&ScuGic,XPAR_FABRIC_BIQUADV2_0_INTERRUPT_INTR);
	   // Enable the Right FIR ISR
	   XScuGic_Enable(&ScuGic,XPAR_FABRIC_BIQUADV2_1_INTERRUPT_INTR);
	   return XST_SUCCESS;
}

int BiquadInit(XBiquadv2* left, XBiquadv2* right) {
	XBiquadv2_Config *cfgLeftPtr, *cfgRightPtr;
	int status;

	//LEFT INIT
	cfgLeftPtr = XBiquadv2_LookupConfig(XPAR_XBIQUADV2_0_DEVICE_ID);
	if (!cfgLeftPtr) {
		xil_printf("ERROR: Biquad left config failed!\n");
		return XST_FAILURE;
	}
	status = XBiquadv2_CfgInitialize(left, cfgLeftPtr);
	if (status != XST_SUCCESS) {
		xil_printf("ERROR: Biquad left init failed!\n");
		return XST_FAILURE;
	}

	//RIGHT INIT
	cfgRightPtr = XBiquadv2_LookupConfig(XPAR_XBIQUADV2_1_DEVICE_ID);
	if (!cfgRightPtr) {
		xil_printf("ERROR: Biquad right config failed!\n");
		return XST_FAILURE;
	}
	status = XBiquadv2_CfgInitialize(right, cfgRightPtr);
	if (status != XST_SUCCESS) {
		xil_printf("ERROR: Biquad right init failed!\n");
		return XST_FAILURE;
	}

	return status;
}





int main() {
	xil_printf("Start...\r\n");

	IicConfig(XPAR_XIICPS_0_DEVICE_ID);
	TimerInitialize();
	LineinLineoutConfig();

	if (BiquadInit(&biquad_left, &biquad_right) != XST_SUCCESS) {
		xil_printf("BIQUAD Setup failed!\n");
		return -1;
	}

	if (SetupInterrupt() != XST_SUCCESS) {
		xil_printf("Interrupt setup failed!\n");
		return -1;
	}

	//Enable interrupts
	XBiquadv2_InterruptEnable(&biquad_left, 1);
	XBiquadv2_InterruptGlobalEnable(&biquad_left);
	XBiquadv2_InterruptEnable(&biquad_right, 1);
	XBiquadv2_InterruptGlobalEnable(&biquad_right);

	biquad_left_done = 0;
	biquad_right_done = 0;

	xil_printf("Setup done...\r\n");

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

		//Give to BIQUAD
		XBiquadv2_Set_inData_V(&biquad_left, dataL);
		XBiquadv2_Set_inData_V(&biquad_right, dataR);

		//Clear BIQUAD done flags
		biquad_left_done = 0;
		biquad_right_done = 0;

		//Start BIQUAD
		XBiquadv2_Start(&biquad_left);
		XBiquadv2_Start(&biquad_right);

		//xil_printf("HERE\n");

		//Get from BIQUAD
		while(!biquad_left_done);
		dataL = XBiquadv2_Get_outData_V(&biquad_left);
		while(!biquad_right_done);
		dataR = XBiquadv2_Get_outData_V(&biquad_right);

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

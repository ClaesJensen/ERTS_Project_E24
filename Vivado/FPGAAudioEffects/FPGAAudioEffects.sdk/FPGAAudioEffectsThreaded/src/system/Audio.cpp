#include "Audio.hpp"

Audio::Audio(Timer *timer, uint16_t IIC_DeviceID) {
	this->timer = timer;

	InitI2C(IIC_DeviceID);
	InitAudio();
}

void Audio::InitI2C(uint16_t IIC_DeviceID) {
	XIicPs_Config *Config;
	int Status;

	//Initialize the IIC driver so that it's ready to use
	//Look up the configuration in the config table, then initialize it.
	Config = XIicPs_LookupConfig(IIC_DeviceID);
	if(NULL == Config) {
		xil_printf("I2C Lookup Config failed!\n");
		return;
	}

	Status = XIicPs_CfgInitialize(&Iic, Config, Config->BaseAddress);
	if(Status != XST_SUCCESS) {
		xil_printf("I2C Config init failed!\n");
		return;
	}

	//Set the IIC serial clock rate.
	XIicPs_SetSClk(&Iic, IIC_SCLK_RATE);
	this->isI2CReady = true;
}

void Audio::InitAudio() {
	if (!this->isI2CReady) {
		xil_printf("Audio couldn't be initialized because of I2C wasn't ready.\n");
		return;
	}
	// software reset
	AudioWriteToReg(R15_SOFTWARE_RESET, 0x000);
	this->timer->usDelay(75000);
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
	this->timer->usDelay(75000);
	// Digital core:0_00000001=>0_0000000, activate core
	AudioWriteToReg(R9_ACTIVE, 0x001);
	// power mgmt: 0_00100010 0_Power up, power up, OSC dn, out ON, DAC up, ADC up, MIC off, LineIn up
	AudioWriteToReg(R6_POWER_MANAGEMENT, 0x022); // power mgmt: 001100010 turn on OUT
}

void Audio::AudioWriteToReg(uint8_t RegAddr, uint16_t Data) {

	uint8_t TxData[2];

	TxData[0] = (RegAddr << 1 ) | ((Data >> 8) & 0x01); // append msb of 9-bit data to the reg addr after shifting left
	TxData[1] = Data & 0xFF;

	XIicPs_MasterSendPolled(&Iic, TxData, 2, IIC_SLAVE_ADDR);
	while(XIicPs_BusIsBusy(&Iic));
}


void Audio::Write(uint32_t inDataL, uint32_t inDataR) {
	Xil_Out32(I2S_DATA_TX_L_REG, inDataL);
	Xil_Out32(I2S_DATA_TX_R_REG, inDataR);

	//For some reason we have to read the buffer again but this works. I think it's because the buffer
	// might contain garbage so we clear it by reading it.
	Xil_In32(I2S_DATA_RX_L_REG);
	Xil_In32(I2S_DATA_RX_R_REG);
}

void Audio::ReadBlocking(uint32_t *outDataL, uint32_t *outDataR) {
	//Wait on data
	while(ReadStatus() == 0);
	ClearReadyBit();

	//Read the data
	*outDataL = Xil_In32(I2S_DATA_RX_L_REG);
	*outDataR = Xil_In32(I2S_DATA_RX_R_REG);
}

void Audio::ReadNonBlocking(uint32_t *outDataL, uint32_t *outDataR) {
	//Read the data
	*outDataL = Xil_In32(I2S_DATA_RX_L_REG);
	*outDataR = Xil_In32(I2S_DATA_RX_R_REG);
}

uint32_t Audio::ReadStatus() {
	return Xil_In32(I2S_STATUS_REG);
}

void Audio::WriteStatus(uint32_t status) {
	Xil_Out32(I2S_STATUS_REG, status);
}

void Audio::ClearReadyBit() {
	Xil_Out32(I2S_STATUS_REG, 0x00000001);
}

void Audio::EnableOutput() {
	Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, 0x00000001);
}

void Audio::DisableOutput() {
	Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, 0x00000000);
}

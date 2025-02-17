#ifndef AUDIO_HPP_
#define AUDIO_HPP_
#include <xparameters.h>
#include <stdint.h>
#include <xiicps.h>
#include "Timer.hpp"
//Base addresses
#define AUDIO_BASE				XPAR_ZYBO_AUDIO_CTRL_0_BASEADDR

//Slave address for the ADAU audio controller
#define IIC_SLAVE_ADDR			0x1A

//I2C Serial Clock frequency in Hertz
#define IIC_SCLK_RATE			100000

//ADAU internal registers
enum audio_regs {
	R0_LEFT_ADC_INPUT								= 0x00,
	R1_RIGHT_ADC_INPUT								= 0x01,
	R2_LEFT_DAC_VOLUME					 			= 0x02,
	R3_RIGHT_DAC_VOLUME								= 0x03,
	R4_ANALOG_AUDIO_PATH							= 0x04,
	R5_DIGITAL_AUDIO_PATH							= 0x05,
	R6_POWER_MANAGEMENT								= 0x06,
	R7_DIGITAL_AUDIO_INTERFACE						= 0x07,
	R8_SAMPLING_RATE								= 0x08,
	R9_ACTIVE										= 0x09,
	R15_SOFTWARE_RESET								= 0x0F,
	R16_ALC_CONTROL_1								= 0x10,
	R17_ALC_CONTROL_2								= 0x11,
	R18_NOISE_GATE									= 0x12
};

//Audio controller registers
enum i2s_regs {
	I2S_DATA_RX_L_REG				= 0x00 + AUDIO_BASE,
	I2S_DATA_RX_R_REG				= 0x04 + AUDIO_BASE,
	I2S_DATA_TX_L_REG      			= 0x08 + AUDIO_BASE,
	I2S_DATA_TX_R_REG         		= 0x0c + AUDIO_BASE,
	I2S_STATUS_REG          		= 0x10 + AUDIO_BASE,
};

class Audio {
public:
	Audio(Timer *timer, uint16_t IIC_DeviceID);
	void ReadBlocking(uint32_t *outDataL, uint32_t *outDataR);
	void ReadNonBlocking(uint32_t *outDataL, uint32_t *outDataR);
	void Write(uint32_t dataL, uint32_t dataR);
	uint32_t ReadStatus();
	void WriteStatus(uint32_t status);
	void ClearReadyBit();
private:
	void InitAudio();
	void InitI2C(uint16_t IIC_DeviceID);
	void AudioWriteToReg(uint8_t RegAddr, uint16_t data);

	bool isI2CReady = false;

	Timer *timer;
	XIicPs Iic;
};
#endif

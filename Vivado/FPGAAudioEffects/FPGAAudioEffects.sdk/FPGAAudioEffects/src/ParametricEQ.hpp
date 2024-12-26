#ifndef PARAMETRICEQ_HPP_
#define PARAMETRICEQ_HPP_
#include "BiquadSegmentStart.hpp"
#include "BiquadSegmentMiddle.hpp"
#include "BiquadSegmentEnd.hpp"
#include <xscugic.h>
class ParametricEQ : protected BiquadSegmentStart, public BiquadSegmentEnd {
public:
	ParametricEQ();
	ParametricEQ(
			uint16_t StartDeviceID,
			uint16_t *MiddleDeviceID,
			uint8_t MiddleDeviceIDCount,
			uint16_t EndDeviceID,
			XScuGic *ScuGic,
			uint16_t InterruptID,
			Xil_InterruptHandler CallbackISR);
	void Input(uint32_t inDataL, uint32_t inDataR);
	void Output(uint32_t *outDataL, uint32_t *outDataR);
	void ClearInterrupt();
	void SetCoefficients(uint8_t targetFilter, int32_t b0_a0, int32_t b1_a0, int32_t b2_a0, int32_t a1_a0, int32_t a2_a0);
private:
	uint8_t middleSegments = 0;
	BiquadSegmentMiddle *middle;
};
#endif

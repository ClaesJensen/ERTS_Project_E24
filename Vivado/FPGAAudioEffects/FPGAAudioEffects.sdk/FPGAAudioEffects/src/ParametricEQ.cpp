#include "ParametricEQ.hpp"

ParametricEQ::ParametricEQ() : BiquadSegmentStart(), BiquadSegmentEnd() {

}

ParametricEQ::ParametricEQ(
	uint16_t StartDeviceID,
	uint16_t *MiddleDeviceID,
	uint8_t MiddleDeviceIDCount,
	uint16_t EndDeviceID,
	XScuGic *ScuGic,
	uint16_t InterruptID,
	Xil_InterruptHandler CallbackISR
) : BiquadSegmentStart(StartDeviceID), BiquadSegmentEnd(EndDeviceID){
	this->middleSegments = MiddleDeviceIDCount;

	//Allocate the BiquadSegmentMiddle
	this->middle = new BiquadSegmentMiddle[this->middleSegments];
	for (uint8_t i = 0; i < this->middleSegments; i++) {
		xil_printf("%i\n", i);
		this->middle[i] = BiquadSegmentMiddle(MiddleDeviceID[i]);
	}
}
void ParametricEQ::Input(uint32_t inDataL, uint32_t inDataR) {
	this->InputData(inDataL, inDataR);
	this->isDone = false;
	this->Start();
}

void ParametricEQ::Output(uint32_t *outDataL, uint32_t *outDataR) {
	this->OutputData(outDataL, outDataR);
}

void ParametricEQ::ClearInterrupt() {
	this->ClearInterruptEnd();
}

void ParametricEQ::SetCoefficients(uint8_t targetFilter, int32_t b0_a0, int32_t b1_a0, int32_t b2_a0, int32_t a1_a0, int32_t a2_a0) {
	if (targetFilter == 0) {
		this->SetCoefficientsStart(b0_a0, b1_a0, b2_a0, a1_a0, a2_a0);
	}
	else if (targetFilter - 1 - this->middleSegments == 0) {
		this->SetCoefficientsEnd(b0_a0, b1_a0, b2_a0, a1_a0, a2_a0);
	}
	else {
		this->middle[targetFilter-1].SetCoefficients(b0_a0, b1_a0, b2_a0, a1_a0, a2_a0);
	}
}

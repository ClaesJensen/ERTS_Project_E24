#include "ParametricEQ.hpp"

ParametricEQ::ParametricEQ() {}
ParametricEQ::ParametricEQ(BiquadSegmentStart *start, BiquadSegmentMiddle **middle, uint8_t NBiquadSegmentMiddle, BiquadSegmentEnd *end) {
	this->start = start;
	this->middle = middle;
	this->end = end;
	this->NBiquadSegmentMiddle = NBiquadSegmentMiddle;
	this->NFilters = this->NBiquadSegmentMiddle + 2; //Adjust for start and end
}

// IO
void ParametricEQ::Write(uint32_t dataL, uint32_t dataR) {
	SetStatus(false);
	this->start->Write(dataL, dataR);
	this->end->Start();
}

void ParametricEQ::Read(uint32_t *outDataL, uint32_t *outDataR) {
	this->end->Read(outDataL, outDataR);
}

// Coefficients
void ParametricEQ::SetCoefficients(uint8_t iFilter, uint32_t b0_a0, uint32_t b1_a0, uint32_t b2_a0, uint32_t a1_a0, uint32_t a2_a0) {
	xil_printf("Coeffs: \r\n");
	xil_printf("0x%02X\r\n", b0_a0);
	xil_printf("0x%02X\r\n", b1_a0);
	xil_printf("0x%02X\r\n", b2_a0);
	xil_printf("0x%02X\r\n", a1_a0);
	xil_printf("0x%02X\r\n", a2_a0);

	if (iFilter == 0) {
		this->start->SetCoefficients(b0_a0, b1_a0, b2_a0, a1_a0, a2_a0);
	}
	else if (iFilter > 0 && iFilter <= this->NFilters - 2) {
		this->middle[iFilter - 1]->SetCoefficients(b0_a0, b1_a0, b2_a0, a1_a0, a2_a0);
	}
	else {
		this->end->SetCoefficients(b0_a0, b1_a0, b2_a0, a1_a0, a2_a0);
	}
}

// ISR
void ParametricEQ::EnableInterrupts() {
	this->end->EnableInterrupt();
}


//Getter & Setters
bool ParametricEQ::IsDone() {
	return this->end->isDone;
}

void ParametricEQ::SetStatus(bool isDone) {
	this->end->isDone = isDone;
}

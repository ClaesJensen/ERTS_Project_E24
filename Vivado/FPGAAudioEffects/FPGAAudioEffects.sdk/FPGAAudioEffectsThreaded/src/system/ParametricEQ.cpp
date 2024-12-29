#include "ParametricEQ.hpp"

ParametricEQ::ParametricEQ() {
	this->isDone = false;
}
ParametricEQ::ParametricEQ(BiquadSegmentStart *start, BiquadSegmentMiddle **middle, uint8_t NBiquadSegmentMiddle, BiquadSegmentEnd *end) {
	this->start = start;
	this->middle = middle;
	this->end = end;
	this->NBiquadSegmentMiddle = NBiquadSegmentMiddle;

	this->NFilters = this->NBiquadSegmentMiddle + 2; //Adjust for start and end
}

void ParametricEQ::EnableInterrupts() {
	this->end->EnableInterrupt();
}

void ParametricEQ::Write(uint32_t dataL, uint32_t dataR) {
	this->isDone = false;
	this->start->Write(dataL, dataR);
	this->end->Start();
}

void ParametricEQ::Read(uint32_t *outDataL, uint32_t *outDataR) {
	this->end->Read(outDataL, outDataR);
}

void ParametricEQ::SetCoefficients(uint8_t iFilter, uint32_t b0_a0, uint32_t b1_a0, uint32_t b2_a0, uint32_t a1_a0, uint32_t a2_a0) {
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

#include "SetEQCoefficients.hpp"

SetEQCoefficients::SetEQCoefficients() : Command() {}
SetEQCoefficients::SetEQCoefficients(
		ParametricEQ *eq,
		uint8_t iFilter,
		uint32_t b0_a0,
		uint32_t b1_a0,
		uint32_t b2_a0,
		uint32_t a1_a0,
		uint32_t a2_a0
) : Command() {
	this->eq = eq;
	this->iFilter = iFilter;
	this->b0_a0 = b0_a0;
	this->b1_a0 = b1_a0;
	this->b2_a0 = b2_a0;
	this->a1_a0 = a1_a0;
	this->a2_a0 = a2_a0;
	this->isReady = true;
}

void SetEQCoefficients::Execute() {
	if (!this->isReady) return;
	this->eq->SetCoefficients(this->iFilter, this->b0_a0, this->b1_a0, this->b2_a0, this->a1_a0, this->a2_a0);
}

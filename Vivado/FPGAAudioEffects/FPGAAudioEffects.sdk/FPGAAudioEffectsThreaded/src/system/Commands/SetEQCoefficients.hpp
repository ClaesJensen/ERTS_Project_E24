#ifndef SETEQCOEFFICIENTS_HPP_
#define SETEQCOEFFICIENTS_HPP_
#include "Command.hpp"
#include "../ParametricEQ.hpp"
class SetEQCoefficients : public Command {
public:
	SetEQCoefficients();
	SetEQCoefficients(ParametricEQ *eq, uint8_t iFilter, uint32_t b0_a0, uint32_t b1_a0, uint32_t b2_a0, uint32_t a1_a0, uint32_t a2_a0);
	void Execute() override;
private:
	bool isReady = false;
	ParametricEQ *eq;
	uint8_t iFilter;
	uint32_t b0_a0;
	uint32_t b1_a0;
	uint32_t b2_a0;
	uint32_t a1_a0;
	uint32_t a2_a0;
};
#endif

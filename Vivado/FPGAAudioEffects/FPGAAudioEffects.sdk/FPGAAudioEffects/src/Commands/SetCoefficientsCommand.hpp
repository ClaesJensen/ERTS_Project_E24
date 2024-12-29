#ifndef SETCOEFFICIENTSCOMMAND_HPP_
#define SETCOEFFICIENTSCOMMAND_HPP_
#include "Command.hpp"
#include "ParametricEQ.hpp"
#include
class SetCoefficientsCommand : public Command {
public:
	SetCoefficientsCommand(ParametricEQ *eq) {
		this->eq = eq;
	}

	void execute() override {
		eq->SetCoefficients()
	}
private:
	ParametricEQ *eq;
};
#endif

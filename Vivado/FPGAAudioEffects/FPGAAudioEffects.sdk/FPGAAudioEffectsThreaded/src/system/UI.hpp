#ifndef UI_HPP_
#define UI_HPP_
#include "UART.hpp"
#include "string.h"
#include "ParametricEQ.hpp"
#include "../os/Thread.h"
#define BLOCKING_ITERATIONS 1
class UI {
public:
	UI(UART *uart, ParametricEQ *eq);
	void PollInput(AbstractOS::Thread *thread);
private:
	void Reset();
	void DetermineCommandType();
	void DetermineFilterOperation();
	bool GetFilterCoeffs();
	bool GetFilterIndex();

	ParametricEQ *eq;

	uint32_t result;
	uint8_t readCount;
	UART *uart;

	//State tracking
	uint8_t type;
	bool type_aquired;
	uint8_t operation;
	bool operation_aquired;
	uint8_t filter_index;
	bool filter_index_aquired;

	bool coeffs_aquired[5];
	uint32_t coeffs[5];
};
#endif

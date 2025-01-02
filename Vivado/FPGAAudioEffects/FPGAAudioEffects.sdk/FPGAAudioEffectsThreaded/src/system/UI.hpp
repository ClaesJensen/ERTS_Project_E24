#ifndef UI_HPP_
#define UI_HPP_
#include "UART.hpp"
#include "string.h"
#include "ParametricEQ.hpp"
#include "AudioProcessing.hpp"
#include "../os/Thread.h"
#include "Commands/CommandController.hpp"
#include "Commands/SetEQCoefficients.hpp"
#include "Commands/ActivateEffects.hpp"
#include "Commands/Mute.hpp"
#include "Commands/Passthrough.hpp"
#include "Commands/UnMute.hpp"
#define BLOCKING_ITERATIONS 1
class UI {
public:
	UI(UART *uart, ParametricEQ *eq, AudioProcessing *ap);
	void PollInput(AbstractOS::Thread *thread);
private:
	void Reset();
	void DetermineCommandType();
	void DetermineFilterOperation();
	bool GetFilterCoeffs();
	bool GetFilterIndex();

	ParametricEQ *eq;
	AudioProcessing *ap;

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

	//Commands
	CommandController cmdController;
	SetEQCoefficients cmdSetEQCoefficients;
	ActivateEffects cmdActivateEffects;
	Mute cmdMute;
	UnMute cmdUnMute;
	Passthrough cmdPassthrough;
};
#endif

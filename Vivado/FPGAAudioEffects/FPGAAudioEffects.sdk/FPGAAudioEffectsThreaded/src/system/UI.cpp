#include "UI.hpp"

UI::UI(UART *uart, ParametricEQ *eq, AudioProcessing *ap) {
	this->uart = uart;
	this->eq = eq;
	this->ap = ap;
}

void UI::Reset() {
	this->type_aquired = false;
	this->operation_aquired = false;
	this->filter_index_aquired = false;
	memset(this->coeffs_aquired, false, sizeof(this->coeffs_aquired));
}

void UI::PollInput(AbstractOS::Thread *thread) {
	DetermineCommandType();
}

void UI::DetermineCommandType() {
	//Read type if type is not aquired yet!
	if (!this->type_aquired) {
		if (!this->uart->nonBlockingRead(&this->type, BLOCKING_ITERATIONS)) {
			return;
		}

		//Got a type
		this->type_aquired = true;
	}

	switch (type) {
	case 'F': //Filter
		DetermineFilterOperation();
		break;
	case 'P': //Passthrough
		cmdPassthrough = Passthrough(this->ap);
		cmdController.Execute(&cmdPassthrough);
		Reset();
		break;
	case 'E': //Activate Effects
		cmdActivateEffects = ActivateEffects(this->ap);
		cmdController.Execute(&cmdActivateEffects);
		Reset();
		break;
	case 'M': //Mute
		cmdMute = Mute(this->ap);
		cmdController.Execute(&cmdMute);
		Reset();
		break;
	case 'U': //UnMute
		cmdUnMute = UnMute(this->ap);
		cmdController.Execute(&cmdUnMute);
		Reset();
		break;
	default:
		Reset();
		break;
	}
}

void UI::DetermineFilterOperation() {
	//Read operation if operation is not aquired yet!
	if (!this->operation_aquired) {
		if (!this->uart->nonBlockingRead(&this->operation, BLOCKING_ITERATIONS)) {
			return;
		}

		//Got a type
		this->operation_aquired = true;
	}

	switch (this->operation) {
	case 'S': //Set
		if (!GetFilterIndex()) {
			return;
		}
		if (GetFilterCoeffs()) {
			//Set coeffs (Note the negative signs on coeff a1_a0 and a2_a0 is very important!)
			cmdSetEQCoefficients = SetEQCoefficients(this->eq, this->filter_index, this->coeffs[0], this->coeffs[1], this->coeffs[2], -this->coeffs[3], -this->coeffs[4]);
			this->cmdController.Execute(&cmdSetEQCoefficients);
			Reset();
		}
		break;
	default:
		Reset();
		break;
	}
}

bool UI::GetFilterIndex() {
	if (!this->filter_index_aquired) {
		if (!this->uart->nonBlockingRead(&this->filter_index, BLOCKING_ITERATIONS)) {
			return false;
		}

		this->filter_index_aquired = true;
	}
	return true;
}

bool UI::GetFilterCoeffs() {
	if (!this->coeffs_aquired[0]) {
		if (!this->uart->nonBlockingRead4Bytes(&this->coeffs[0], BLOCKING_ITERATIONS)) {
			return false;
		}

		//Got a Coeff
		this->coeffs_aquired[0] = true;
		xil_printf("0x%02X\r\n", this->coeffs[0]);
	}

	if (!this->coeffs_aquired[1]) {
		if (!this->uart->nonBlockingRead4Bytes(&this->coeffs[1], BLOCKING_ITERATIONS)) {
			return false;
		}

		//Got a Coeff
		this->coeffs_aquired[1] = true;
		xil_printf("0x%02X\r\n", this->coeffs[1]);
	}

	if (!this->coeffs_aquired[2]) {
		if (!this->uart->nonBlockingRead4Bytes(&this->coeffs[2], BLOCKING_ITERATIONS)) {
			return false;
		}

		//Got a Coeff
		this->coeffs_aquired[2] = true;
		xil_printf("0x%02X\r\n", this->coeffs[2]);
	}

	if (!this->coeffs_aquired[3]) {
		if (!this->uart->nonBlockingRead4Bytes(&this->coeffs[3], BLOCKING_ITERATIONS)) {
			return false;
		}

		//Got a Coeff
		this->coeffs_aquired[3] = true;
		xil_printf("0x%02X\r\n", this->coeffs[3]);
	}

	if (!this->coeffs_aquired[4]) {
		if (!this->uart->nonBlockingRead4Bytes(&this->coeffs[4], BLOCKING_ITERATIONS)) {
			return false;
		}

		//Got a Coeff
		this->coeffs_aquired[4] = true;
		xil_printf("0x%02X\r\n", this->coeffs[4]);
	}

	return true;
}




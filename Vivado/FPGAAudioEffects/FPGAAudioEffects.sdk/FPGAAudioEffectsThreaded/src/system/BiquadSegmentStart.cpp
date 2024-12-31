#include "BiquadSegmentStart.hpp"

BiquadSegmentStart::BiquadSegmentStart() {
	this->isReady = false;
}

BiquadSegmentStart::BiquadSegmentStart(uint16_t DeviceID) {
	if (this->InitBiquad(DeviceID) == XST_FAILURE) {
		this->isReady = false;
	}
	else {
		this->isReady = true;
	}
}

int BiquadSegmentStart::InitBiquad(uint16_t DeviceID) {
	XBiquadv2start_Config *cfg;
	int status;
	cfg = XBiquadv2start_LookupConfig(DeviceID);
	if (!cfg) {
		xil_printf("ERROR: Biquad segment start config failed!\n");
		return XST_FAILURE;
	}
	status = XBiquadv2start_CfgInitialize(&this->biquad, cfg);
	if (status != XST_SUCCESS) {
		xil_printf("ERROR: Biquad segment start init failed!\n");
		return XST_FAILURE;
	}

	return status;
}


// IO
void BiquadSegmentStart::Write(uint32_t inDataL, uint32_t inDataR) {
	XBiquadv2start_Set_inDataLeft_V(&this->biquad, inDataL);
	XBiquadv2start_Set_inDataRight_V(&this->biquad, inDataR);
}

// Coeffs
void BiquadSegmentStart::SetCoefficients(int32_t b0_a0, int32_t b1_a0, int32_t b2_a0, int32_t a1_a0, int32_t a2_a0) {
	if (!this->isReady) {
		xil_printf("BiquadSegmentMiddle is not ready!\n");
		return;
	}
	XBiquadv2start_Set_b0_a0_V(&this->biquad, b0_a0);
	XBiquadv2start_Set_b1_a0_V(&this->biquad, b1_a0);
	XBiquadv2start_Set_b2_a0_V(&this->biquad, b2_a0);
	XBiquadv2start_Set_a1_a0_V(&this->biquad, a1_a0);
	XBiquadv2start_Set_a2_a0_V(&this->biquad, a2_a0);
}

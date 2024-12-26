#include "BiquadSegmentMiddle.hpp"

BiquadSegmentMiddle::BiquadSegmentMiddle() {
	this->isReady = false;
}

BiquadSegmentMiddle::BiquadSegmentMiddle(uint16_t DeviceID) {
	xil_printf("%i\n", DeviceID);
	if (this->InitBiquad(DeviceID) == XST_FAILURE) {
		this->isReady = false;
	}
	else {
		this->isReady = true;
	}
}

int BiquadSegmentMiddle::InitBiquad(uint16_t DeviceID) {
	XBiquadv2between_Config *cfg;
	int status;
	cfg = XBiquadv2between_LookupConfig(DeviceID);
	if (!cfg) {
		xil_printf("ERROR: Biquad segment middle config failed!\n");
		return XST_FAILURE;
	}
	status = XBiquadv2between_CfgInitialize(&this->biquad, cfg);
	if (status != XST_SUCCESS) {
		xil_printf("ERROR: Biquad segment middle init failed!\n");
		return XST_FAILURE;
	}

	return status;
}

void BiquadSegmentMiddle::SetCoefficients(int32_t b0_a0, int32_t b1_a0, int32_t b2_a0, int32_t a1_a0, int32_t a2_a0) {
	if (!this->isReady) {
		xil_printf("BiquadSegmentMiddle is not ready!\n");
		return;
	}
	XBiquadv2between_Set_b0_a0_V(&this->biquad, b0_a0);
	XBiquadv2between_Set_b1_a0_V(&this->biquad, b1_a0);
	XBiquadv2between_Set_b2_a0_V(&this->biquad, b2_a0);
	XBiquadv2between_Set_a1_a0_V(&this->biquad, a1_a0);
	XBiquadv2between_Set_a2_a0_V(&this->biquad, a2_a0);
}

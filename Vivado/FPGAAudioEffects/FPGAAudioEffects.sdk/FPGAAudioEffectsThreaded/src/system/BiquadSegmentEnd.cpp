#include "BiquadSegmentEnd.hpp"

void BiquadSegmentEnd::ProcessingDone(void *ptr) {
	BiquadSegmentEnd* self = (BiquadSegmentEnd*)ptr;
	self->ClearInterruptEnd();
}

BiquadSegmentEnd::BiquadSegmentEnd() {
	this->isReady = false;
}

BiquadSegmentEnd::BiquadSegmentEnd(ISR *isr, uint16_t DeviceID) {
	xil_printf("Init end\n");
	this->isr = isr;
	int resultInit = this->InitBiquad(DeviceID);

	if (resultInit == XST_FAILURE) {
		this->isReady = false;
	}
	else {
		this->isReady = true;
	}
}

void BiquadSegmentEnd::Read(uint32_t *outDataL, uint32_t *outDataR) {
	*outDataL = XBiquadv2end_Get_outDataLeft_V(&this->biquad_end);
	*outDataR = XBiquadv2end_Get_outDataRight_V(&this->biquad_end);
}

int BiquadSegmentEnd::InitBiquad(uint16_t DeviceID) {
	XBiquadv2end_Config *cfg;
	int status;
	cfg = XBiquadv2end_LookupConfig(DeviceID);
	if (!cfg) {
		xil_printf("ERROR: Biquad segment end config failed!\n");
		return XST_FAILURE;
	}
	status = XBiquadv2end_CfgInitialize(&this->biquad_end, cfg);
	if (status != XST_SUCCESS) {
		xil_printf("ERROR: Biquad segment end init failed!\n");
		return XST_FAILURE;
	}

	xil_printf("After end config\n");

	return status;
}

void BiquadSegmentEnd::EnableInterrupt() {
	this->isr->ConnectISRHandler(XPAR_FABRIC_PARAMETRICEQ_BIQUADV2END_0_INTERRUPT_INTR, (Xil_InterruptHandler) BiquadSegmentEnd::ProcessingDone, this);
	XBiquadv2end_InterruptEnable(&biquad_end, 1);
	XBiquadv2end_InterruptGlobalEnable(&biquad_end);
}

void BiquadSegmentEnd::ClearInterruptEnd() {
	XBiquadv2end_InterruptClear(&this->biquad_end, 1);
	this->isDone = true;
}

void BiquadSegmentEnd::Start() {
	XBiquadv2end_Start(&this->biquad_end);
}

void BiquadSegmentEnd::SetCoefficients(int32_t b0_a0, int32_t b1_a0, int32_t b2_a0, int32_t a1_a0, int32_t a2_a0) {
	if (!this->isReady) {
		xil_printf("BiquadSegmentEnd is not ready!\n");
		return;
	}
	XBiquadv2end_Set_b0_a0_V(&this->biquad_end, b0_a0);
	XBiquadv2end_Set_b1_a0_V(&this->biquad_end, b1_a0);
	XBiquadv2end_Set_b2_a0_V(&this->biquad_end, b2_a0);
	XBiquadv2end_Set_a1_a0_V(&this->biquad_end, a1_a0);
	XBiquadv2end_Set_a2_a0_V(&this->biquad_end, a2_a0);
}

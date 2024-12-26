#ifndef BIQUADSEGMENTEND_H_
#define BIQUADSEGMENTEND_H_
#include <xparameters.h>
#include <xbiquadv2end.h>
#include <xscugic.h>

class BiquadSegmentEnd {
public:
	BiquadSegmentEnd();
	BiquadSegmentEnd(uint16_t DeviceID);
	void OutputData(uint32_t *outDataL, uint32_t *outDataR);
	void SetCoefficientsEnd(int32_t b0_a0, int32_t b1_a0, int32_t b2_a0, int32_t a1_a0, int32_t a2_a0);
	void Start();
	void ClearInterruptEnd();
	bool isDone;
	XBiquadv2end biquad_end;
private:

	int InitBiquad(uint16_t DeviceID);
	int InitBiquadIRQ(XScuGic *ScuGic, uint16_t InterruptID, Xil_InterruptHandler CallbackISR);

	bool isReady;
};
#endif

#ifndef BIQUADSEGMENTEND_H_
#define BIQUADSEGMENTEND_H_
#include <xparameters.h>
#include <xbiquadv2end.h>
#include <xscugic.h>
#include "ISR.hpp"

class BiquadSegmentEnd {
public:
	BiquadSegmentEnd();
	BiquadSegmentEnd(ISR *isr, uint16_t DeviceID);
	void Read(uint32_t *outDataL, uint32_t *outDataR);
	void SetCoefficients(int32_t b0_a0, int32_t b1_a0, int32_t b2_a0, int32_t a1_a0, int32_t a2_a0);
	void Start();
	void ClearInterruptEnd();
	void EnableInterrupt();
	static void ProcessingDone(void *ptr);
	bool isDone;
private:
	int InitBiquad(uint16_t DeviceID);
	bool isReady;
	ISR *isr;
	XBiquadv2end biquad_end;
};
#endif

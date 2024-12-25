#ifndef BIQUADSEGMENTMIDDLE_H_
#define BIQUADSEGMENTMIDDLE_H_
#include <xparameters.h>
#include <xbiquadv2between.h>
#include <xscugic.h>

class BiquadSegmentMiddle {
public:
	BiquadSegmentMiddle(uint32_t DeviceID);
	void SetCoefficients(int32_t b0_a0, int32_t b1_a0, int32_t b2_a0, int32_t a1_a0, int32_t a2_a0);
private:
	int InitBiquad(uint32_t DeviceID);

	bool isReady;

	XBiquadv2between biquad;
};
#endif

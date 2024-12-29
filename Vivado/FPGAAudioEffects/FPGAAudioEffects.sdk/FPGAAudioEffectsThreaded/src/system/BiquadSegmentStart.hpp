#ifndef BIQUADSEGMENTSTART_H_
#define BIQUADSEGMENTSTART_H_
#include <xparameters.h>
#include <xbiquadv2start.h>
#include <xscugic.h>

class BiquadSegmentStart {
public:
	BiquadSegmentStart();
	BiquadSegmentStart(uint16_t DeviceID);
	void Write(uint32_t inDataL, uint32_t outDataR);
	void SetCoefficients(int32_t b0_a0, int32_t b1_a0, int32_t b2_a0, int32_t a1_a0, int32_t a2_a0);
private:
	int InitBiquad(uint16_t DeviceID);

	bool isReady;

	XBiquadv2start biquad;
};
#endif

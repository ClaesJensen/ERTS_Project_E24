#ifndef PARAMETRICEQ_HPP_
#define PARAMETRICEQ_HPP_
#include "BiquadSegmentStart.hpp"
#include "BiquadSegmentMiddle.hpp"
#include "BiquadSegmentEnd.hpp"
class ParametricEQ {
public:
	//Constructors
	ParametricEQ();
	ParametricEQ(BiquadSegmentStart *start, BiquadSegmentMiddle **middle, uint8_t NBiquadSegmentMiddle, BiquadSegmentEnd *end);

	// IO
	void Write(uint32_t dataL, uint32_t dataR);
	void Read(uint32_t *dataL, uint32_t *dataR);
	void SetCoefficients(uint8_t iFilter, uint32_t b0_a0, uint32_t b1_a0, uint32_t b2_a0, uint32_t a1_a0, uint32_t a2_a0);

	// ISR
	void EnableInterrupts();

	// Status
	bool IsDone();
	void SetStatus(bool isDone);
private:
	BiquadSegmentStart *start;
	BiquadSegmentMiddle **middle;
	BiquadSegmentEnd *end;
	uint8_t NBiquadSegmentMiddle;
	uint8_t NFilters;
};
#endif

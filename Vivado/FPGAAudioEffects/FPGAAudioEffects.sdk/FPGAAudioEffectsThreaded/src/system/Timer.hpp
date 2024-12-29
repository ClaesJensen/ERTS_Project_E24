#ifndef TIMER_HPP_
#define TIMER_HPP_
#include <xscutimer.h>
#define TIMER_FREQ_HZ (XPAR_CPU_CORTEXA9_0_CPU_CLK_FREQ_HZ / 2)
class Timer {
public:
	Timer();
	void usDelay(uint32_t usDelay);
private:
	XScuTimer timer;
};
#endif

#ifndef AUDIOTHREAD_HPP_
#define AUDIOTHREAD_HPP_
#include "os/Thread.h"
#include <xil_io.h>
#include "system/ParametricEQ.hpp"
#include "system/Audio.hpp"
using namespace AbstractOS;
class AudioThread : public Thread {
public:
	AudioThread(ThreadPriority priority, string name, ParametricEQ *eq, Audio *audio); // : Thread(priority, name);
	void Setup();
	virtual void run();
private:
	bool isRunning;

	ParametricEQ *eq;
	Audio *audio;
};
#endif

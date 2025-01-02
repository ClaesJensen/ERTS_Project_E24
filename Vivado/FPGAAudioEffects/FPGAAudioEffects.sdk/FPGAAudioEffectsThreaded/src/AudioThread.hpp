#ifndef AUDIOTHREAD_HPP_
#define AUDIOTHREAD_HPP_
#include "os/Thread.h"
#include <xil_io.h>
#include "system/AudioProcessing.hpp"
using namespace AbstractOS;
class AudioThread : public Thread {
public:
	AudioThread(ThreadPriority priority, string name, AudioProcessing *ap); // : Thread(priority, name);
	void Setup();
	virtual void run();
private:
	bool isRunning;

	AudioProcessing *ap;
};
#endif

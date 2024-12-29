#ifndef UITHREAD_HPP_
#define UITHREAD_HPP_
#include "os/Thread.h"
#include <xil_io.h>
using namespace AbstractOS;
class UIThread : public Thread {
public:
	UIThread(ThreadPriority priority, string name); // : Thread(priority, name);
	virtual void run();
private:
	bool isRunning;
};
#endif

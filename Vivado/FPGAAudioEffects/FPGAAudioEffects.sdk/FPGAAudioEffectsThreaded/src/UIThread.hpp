#ifndef UITHREAD_HPP_
#define UITHREAD_HPP_
#include "os/Thread.h"
#include <xil_io.h>
#include "system/UI.hpp"
using namespace AbstractOS;
class UIThread : public Thread {
public:
	UIThread(ThreadPriority priority, string name, UI *ui); // : Thread(priority, name);
	virtual void run();
private:
	bool isRunning;
	UI *ui;
};
#endif

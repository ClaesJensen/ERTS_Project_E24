#include "UIThread.hpp"

UIThread::UIThread(ThreadPriority priority, string name) : Thread(priority, name) {
	this->isRunning = true;
}

void UIThread::run() {
	while(this->isRunning) {
		//Do stuff
	}
}

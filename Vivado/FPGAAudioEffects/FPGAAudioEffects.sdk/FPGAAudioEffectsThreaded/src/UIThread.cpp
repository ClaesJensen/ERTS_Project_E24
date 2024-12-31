#include "UIThread.hpp"

UIThread::UIThread(ThreadPriority priority, string name, UI *ui) : Thread(priority, name) {
	this->isRunning = true;
	this->ui = ui;
}

void UIThread::run() {
	while(this->isRunning) {
		this->ui->PollInput(this);
		yield();
		Sleep(10);
	}
}
/*
void UIThread::run() {
	while(this->isRunning) {
		xil_printf("UI\r\n");
		this->ui->PollInput(this);

		//Do stuff
		yield();
	}
}*/

#include "AudioThread.hpp"

AudioThread::AudioThread(ThreadPriority priority, string name, AudioProcessing *ap) : Thread(priority, name) {
	this->isRunning = true;
	this->ap = ap;

}

void AudioThread::Setup() {
	this->ap->Init();
	this->ap->SetParametricEQState(true);
	this->ap->SetAudioOutputState(true);
}



void AudioThread::run() {
	//Run setup
	xil_printf("Audio setup\r\n");
	Setup();

	//Run audio handling loop
	while(this->isRunning) {
		//Read input with custom blocking behaviour to yeild the thread and use the nonblocking read function.
		this->ap->Process(this);
	}
}


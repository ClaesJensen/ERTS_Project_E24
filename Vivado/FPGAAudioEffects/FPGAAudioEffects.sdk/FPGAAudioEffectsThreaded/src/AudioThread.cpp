#include "AudioThread.hpp"

AudioThread::AudioThread(ThreadPriority priority, string name, ParametricEQ *eq, Audio *audio) : Thread(priority, name) {
	this->isRunning = true;
	this->eq = eq;
	this->audio = audio;
}

void AudioThread::Setup() {
	this->eq->EnableInterrupts();

	// -- Do initial setup
	// - Set initial coefficients
	this->eq->SetCoefficients(0, 15364841, -30155609, 15050980, -(-30155609), -(13638606));
	this->eq->SetCoefficients(1, 16622562, -33207912, 16588195, -(-33207912), -(16433542));
	this->eq->SetCoefficients(2, 7692185, -3934265, 7508649, -(-3934265), -(-1576382));
	this->eq->SetCoefficients(3, 1 << 24, 0, 0, 0, 0);
	this->eq->SetCoefficients(4, 1 << 24, 0, 0, 0, 0);
	this->eq->SetCoefficients(5, 1 << 24, 0, 0, 0, 0);
	this->eq->SetCoefficients(6, 1 << 24, 0, 0, 0, 0);
	this->eq->SetCoefficients(7 , 1 << 24, 0, 0, 0, 0);

	// - Enable audio output
	this->audio->EnableOutput();
}

void AudioThread::run() {
	//Run setup
	Setup();

	//Declare data storage for audio samples
	uint32_t dataL;
	uint32_t dataR;

	//Run audio handling loop
	while(this->isRunning) {
		xil_printf("HERE\n");

		//Read input
		this->audio->ReadBlocking(&dataL, &dataR);

		//Using the EQ
		this->eq->Write(dataL, dataR);
		while(!this->eq->isDone) {
			yield();
		}
		this->eq->Read(&dataL, &dataR);

		//Write to output
		this->audio->Write(dataL, dataR);
	}
}


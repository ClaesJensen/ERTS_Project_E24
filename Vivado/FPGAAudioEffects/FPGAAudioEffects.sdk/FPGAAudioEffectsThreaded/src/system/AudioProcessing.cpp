#include "AudioProcessing.hpp"

AudioProcessing::AudioProcessing(Audio *audio, ParametricEQ *eq) {
	this->audio = audio;
	this->eq = eq;
}

void AudioProcessing::Init() {
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

// Enable/Disables
void AudioProcessing::SetParametricEQState(bool isEnabled) {
	this->eqProcessingEnabled = isEnabled;
}
void AudioProcessing::SetAudioOutputState(bool isEnabled) {
	if (isEnabled){
		this->audio->EnableOutput();
	}
	else {
		this->audio->DisableOutput();
	}
	this->outputEnabled = isEnabled;
}

void AudioProcessing::Process(AbstractOS::Thread *thread) {
	uint32_t dataL, dataR;

	//Read input with custom blocking behaviour to yeild the thread and use the nonblocking read function.
	while(this->audio->ReadStatus() == 0) {
		thread->yield();
	}
	this->audio->ClearReadyBit();
	this->audio->ReadNonBlocking(&dataL, &dataR);

	// Process EQ if enabled
	if (this->eqProcessingEnabled) {
		ProcessEQ(&dataL, &dataR, thread);
	}

	//Write to output
	this->audio->Write(dataL, dataR);
}

void AudioProcessing::ProcessEQ(uint32_t *dataL, uint32_t *dataR, AbstractOS::Thread *thread) {
	//Using the EQ
	this->eq->Write(*dataL, *dataR);
	while(!this->eq->IsDone()) {
		thread->yield();
	}
	this->eq->Read(dataL, dataR);
}

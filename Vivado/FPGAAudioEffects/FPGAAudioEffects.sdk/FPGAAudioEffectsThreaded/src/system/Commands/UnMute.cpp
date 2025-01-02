#include "UnMute.hpp"

UnMute::UnMute() : Command() {}
UnMute::UnMute(AudioProcessing *ap) : Command() {
	this->ap = ap;
	this->isReady = true;
}

void UnMute::Execute() {
	if (!this->isReady) return;
	this->ap->SetAudioOutputState(true);
}

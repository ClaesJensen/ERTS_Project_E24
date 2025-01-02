#include "Mute.hpp"

Mute::Mute() : Command() {}
Mute::Mute(AudioProcessing *ap) : Command() {
	this->ap = ap;
	this->isReady = true;
}

void Mute::Execute() {
	if (!this->isReady) return;
	this->ap->SetAudioOutputState(false);
}

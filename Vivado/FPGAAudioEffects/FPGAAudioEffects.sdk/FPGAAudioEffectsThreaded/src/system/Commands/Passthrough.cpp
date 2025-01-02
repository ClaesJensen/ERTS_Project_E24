#include "Passthrough.hpp"
Passthrough::Passthrough() : Command() {}
Passthrough::Passthrough(AudioProcessing *ap) : Command() {
	this->ap = ap;
	this->isReady = true;
}

void Passthrough::Execute() {
	if (!this->isReady) return;
	this->ap->SetParametricEQState(false);
}

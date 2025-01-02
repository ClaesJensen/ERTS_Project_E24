#include "ActivateEffects.hpp"
ActivateEffects::ActivateEffects() : Command() {}
ActivateEffects::ActivateEffects(AudioProcessing *ap) : Command() {
	this->isReady = true;
	this->ap = ap;
}

void ActivateEffects::Execute() {
	if (!this->isReady) return;
	this->ap->SetParametricEQState(true);
}

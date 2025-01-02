#ifndef ACTIVATEEFFECTS_HPP_
#define ACTIVATEEFFECTS_HPP_
#include "Command.hpp"
#include "../AudioProcessing.hpp"
class ActivateEffects : public Command {
public:
	ActivateEffects();
	ActivateEffects(AudioProcessing *ap);
	void Execute() override;
private:
	bool isReady = false;
	AudioProcessing *ap;
};
#endif

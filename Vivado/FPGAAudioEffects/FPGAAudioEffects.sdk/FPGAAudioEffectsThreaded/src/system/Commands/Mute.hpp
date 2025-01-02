#ifndef MUTE_HPP_
#define MUTE_HPP_
#include "Command.hpp"
#include "../AudioProcessing.hpp"
class Mute : public Command {
public:
	Mute();
	Mute(AudioProcessing *ap);
	void Execute() override;
private:
	bool isReady = false;
	AudioProcessing *ap;
};
#endif

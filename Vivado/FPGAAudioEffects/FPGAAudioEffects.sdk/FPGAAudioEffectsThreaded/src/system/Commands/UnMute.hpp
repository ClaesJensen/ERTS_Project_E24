#ifndef UNMUTE_HPP_
#define UNMUTE_HPP_
#include "Command.hpp"
#include "../AudioProcessing.hpp"
class UnMute : public Command {
public:
	UnMute();
	UnMute(AudioProcessing *ap);
	void Execute() override;
private:
	bool isReady = false;
	AudioProcessing *ap;
};
#endif

#ifndef PASSTHROUGH_HPP_
#define PASSTHROUGH_HPP_
#include "Command.hpp"
#include "../AudioProcessing.hpp"
class Passthrough : public Command {
public:
	Passthrough();
	Passthrough(AudioProcessing *ap);
	void Execute() override;
private:
	bool isReady = false;
	AudioProcessing *ap;
};
#endif

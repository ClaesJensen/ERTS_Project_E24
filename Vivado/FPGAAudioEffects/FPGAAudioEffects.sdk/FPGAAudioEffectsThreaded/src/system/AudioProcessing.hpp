#ifndef AUDIOPROCESSING_HPP_
#define AUDIOPROCESSING_HPP_
#include "Audio.hpp"
#include "ParametricEQ.hpp"
#include "../os/Thread.h"
class AudioProcessing {
public:
	AudioProcessing(Audio *audio, ParametricEQ *eq);
	void Init();
	void Process(AbstractOS::Thread *thread);

	// Enable/Disables
	void SetParametricEQState(bool isEnabled);
	void SetAudioOutputState(bool isEnabled);
private:
	void ProcessEQ(uint32_t *dataL, uint32_t *dataR, AbstractOS::Thread *thread);

	bool eqProcessingEnabled;
	bool outputEnabled;

	Audio *audio;
	ParametricEQ *eq;
};
#endif

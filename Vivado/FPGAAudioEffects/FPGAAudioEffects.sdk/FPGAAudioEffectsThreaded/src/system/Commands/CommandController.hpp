#ifndef COMMANDCONTROLLER_HPP_
#define COMMANDCONTROLLER_HPP_
#include "Command.hpp"
class CommandController {
public:
	CommandController();
	void Execute(Command *command);
private:
};
#endif

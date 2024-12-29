#ifndef COMMAND_HPP_
#define COMMAND_HPP_
class Command {
public:
	virtual ~Command() = default;
	virtual void Execute() = 0;
};
#endif

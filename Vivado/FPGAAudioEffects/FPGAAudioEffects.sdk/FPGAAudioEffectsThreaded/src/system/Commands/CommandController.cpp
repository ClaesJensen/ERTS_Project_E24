#include "CommandController.hpp"
CommandController::CommandController() {

}

void CommandController::Execute(Command *command) {
	command->Execute();
}

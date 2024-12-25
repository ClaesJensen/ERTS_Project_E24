#include "lpmk3.hpp"
#include "control.hpp"

static volatile bool isRunning = true;

Control *c = NULL;

bool signalInterruptHandler(int signal) {
    isRunning = false;
    return true;
}

void CALLBACK midiInCallback(HMIDIIN hMidiIn, UINT wMsg, DWORD dwInstance, DWORD dwParam1, DWORD dwParam2) {
    if (c == NULL) {
        return;
    }

    if (wMsg == MIM_DATA) {
        DWORD midiMessage = dwParam1;
        BYTE statusByte = (BYTE)(midiMessage & 0xFF);
        BYTE dataByte1 = (BYTE)((midiMessage >> 8) & 0xFF);
        BYTE dataByte2 = (BYTE)((midiMessage >> 16) & 0xFF);

        printf("Msg: 0x%02X 0x%02X 0x%02X\n", statusByte, dataByte1, dataByte2);

        c->Input(dataByte1, dataByte2 & 0x7F);
    }
}

int main() {
    //Assign handler for ctrl+c.
    SetConsoleCtrlHandler((PHANDLER_ROUTINE) signalInterruptHandler, true);

    //Create Launchpad instance.
    LPMK3 lp = LPMK3(1, 1, midiInCallback);
    UART uart = UART("\\\\.\\COM12", 115200);
    c = new Control(&lp, &uart);

    while(isRunning) {
        Sleep(8);
    }

    return 0;
}
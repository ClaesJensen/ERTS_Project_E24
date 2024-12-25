#include "lpmk3.hpp"

static volatile bool isRunning = true;

bool signalInterruptHandler(int signal) {
    isRunning = false;
    return true;
}

void CALLBACK midiInCallback(HMIDIIN hMidiIn, UINT wMsg, DWORD dwInstance, DWORD dwParam1, DWORD dwParam2) {
    if (wMsg == MIM_DATA) {
        DWORD midiMessage = dwParam1;
        BYTE statusByte = (BYTE)(midiMessage & 0xFF);
        BYTE dataByte1 = (BYTE)((midiMessage >> 8) & 0xFF);
        BYTE dataByte2 = (BYTE)((midiMessage >> 16) & 0xFF);

        printf("Msg: 0x%02X 0x%02X 0x%02X\n", statusByte, dataByte1, dataByte2);
    }
}




int main() {
    //Assign handler for ctrl+c.
    SetConsoleCtrlHandler((PHANDLER_ROUTINE) signalInterruptHandler, true);

    //Create Launchpad instance.
    LPMK3 lp = LPMK3(1, 1, midiInCallback);
    uint64_t leds[8] = {0x030B70000F, 0x030C007F00, 0x030D7F0000, 0x030E007F7F, 0x030F7F7F00, 0x03107F007F, 0x03117F7F7F, 0x03127F7F7F};
    lp.WriteLED(leds, 8);

    while(isRunning) {
        Sleep(8);
    }

    return 0;
}
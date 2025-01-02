#include "lpmk3.hpp"
#include "control.hpp"
#include "biquadCoefficients.hpp"

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

    int64_t s = (1 << 24);
    printf("0x%02X\n", s);

    //Create Launchpad instance.
    LPMK3 lp = LPMK3(1, 1, midiInCallback);
    UART uart = UART("\\\\.\\COM12", 115200);
    BiquadCoefficients biquad = BiquadCoefficients(48000);

    double Q[MAX_COL] = {5, 5, 5, 5, 5, 5, 5, 5};//{2, 2, 2, 2, 2, 2, 2, 2};
    double f0[MAX_COL] = {40, 80, 160, 320, 640, 1280, 2560, 5120}; //20, 10240, 20480
    double dbGain[MAX_ROW] = {-12, -9, -6, -3, 0, 3, 6, 9}; // {9, 6, 3, 0, -3, -6, -9, -12};

    c = new Control(&lp, &uart, &biquad, Q, f0, dbGain);

    while(isRunning) {
        Sleep(8);
    }

    return 0;
}
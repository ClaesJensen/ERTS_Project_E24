#ifndef LPMK3_H
#define LPMK3_H
#include <stdint.h>
#include <windows.h>
#include <mmsystem.h>
#include <stdio.h>
#include <math.h>

#define LP_LED_INITIAL_OFFSET 7
#define LP_LED_PER_BTN_OFFSET 1
#define LP_LED_TOTAL_BTNS 81
#define LP_LED_BYTES_PER_LED 5

typedef struct {
    uint8_t btnNumber;
    uint8_t r;
    uint8_t g;
    uint8_t b;
} LP_LED __attribute__((packed));

class LPMK3 {
public:
    LPMK3(uint8_t inDeviceID, uint8_t outDeviceID, void(*inputCallback)(HMIDIIN, UINT, DWORD, DWORD, DWORD));
    ~LPMK3();

    void WriteLED(uint64_t* leds, uint8_t Nleds);
private:
    //Functions
    void ProgrammerMode();
    void LiveMode();

    //Light msg buffer (max size 412 bytes.)
    uint8_t light_msg[LP_LED_INITIAL_OFFSET + (LP_LED_BYTES_PER_LED * LP_LED_TOTAL_BTNS)];

    //Flags
    bool isReady;

    //MIDI device input and output.
    HMIDIIN hMidiIn;
    HMIDIOUT hMidiOut;

    //MIDI message buffer
    MIDIHDR midiHdr;

    //Callback
    void(*inputCallback)(HMIDIIN, UINT, DWORD, DWORD, DWORD);
};
#endif
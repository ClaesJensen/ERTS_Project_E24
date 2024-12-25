#include "lpmk3.hpp"

LPMK3::LPMK3(uint8_t inDeviceID, uint8_t outDeviceID, void(*inputCallback)(HMIDIIN, UINT, DWORD, DWORD, DWORD)) {
    this->inputCallback = inputCallback;

    MMRESULT result = midiInOpen(&hMidiIn, inDeviceID, (DWORD_PTR)this->inputCallback, 0, CALLBACK_FUNCTION);
    if (result != MMSYSERR_NOERROR) {
        printf("Error opening MIDI input device!\n");
        isReady = false;
        return;
    }

    result = midiOutOpen(&hMidiOut, outDeviceID, 0, 0, CALLBACK_NULL);
    if (result != MMSYSERR_NOERROR) {
        printf("Error opening MIDI output device!\n");
        isReady = false;
        return;
    }

    midiInStart(hMidiIn);

    //Zero buffer
    ZeroMemory(&midiHdr, sizeof(MIDIHDR));
    memset(this->light_msg, 0, sizeof(this->light_msg));
    //{0xF0, 0x00, 0x20, 0x29, 0x02, 0x0D, 0x03}
    this->light_msg[0] = 0xF0;
    this->light_msg[1] = 0x00;
    this->light_msg[2] = 0x20;
    this->light_msg[3] = 0x29;
    this->light_msg[4] = 0x02;
    this->light_msg[5] = 0x0D;
    this->light_msg[6] = 0x03;

    //Switch to programmer mode
    this->ProgrammerMode();
}

LPMK3::~LPMK3() {
    midiInClose(hMidiIn);
    midiOutClose(hMidiOut);
}

void LPMK3::ProgrammerMode() {
    //Ready message
    BYTE programmer_msg[] = {0xF0, 0x00, 0x20, 0x29, 0x02, 0x0D, 0x0E, 0x01, 0xF7};
    midiHdr.lpData = (LPSTR) programmer_msg;
    midiHdr.dwBufferLength = sizeof(programmer_msg);
    midiHdr.dwBytesRecorded = sizeof(programmer_msg);
    midiOutPrepareHeader(hMidiOut, &midiHdr, sizeof(MIDIHDR));

    //Send message
    midiOutLongMsg(hMidiOut, &midiHdr, sizeof(MIDIHDR));
}

void LPMK3::LiveMode() {
    //Ready message
    BYTE livemode_msg[] = {0xF0, 0x00, 0x20, 0x29, 0x02, 0x0D, 0x0E, 0x00, 0xF7};
    midiHdr.lpData = (LPSTR) livemode_msg;
    midiHdr.dwBufferLength = sizeof(livemode_msg);
    midiHdr.dwBytesRecorded = sizeof(livemode_msg);
    midiOutPrepareHeader(hMidiOut, &midiHdr, sizeof(MIDIHDR));

    //Send message
    midiOutLongMsg(hMidiOut, &midiHdr, sizeof(MIDIHDR));
}

void LPMK3::WriteLED(uint64_t *leds, uint8_t Nleds) {
    int mi = 0;
    for (uint8_t i = 0; i < Nleds; i++) {
        mi = LP_LED_INITIAL_OFFSET + i * LP_LED_BYTES_PER_LED;
        light_msg[mi] =   (uint8_t) ((leds[i] & 0xFF00000000) >> 32);
        light_msg[mi+1] = (uint8_t) ((leds[i] & 0x00FF000000) >> 24);
        light_msg[mi+2] = (uint8_t) ((leds[i] & 0x0000FF0000) >> 16);
        light_msg[mi+3] = (uint8_t) ((leds[i] & 0x000000FF00) >> 8);
        light_msg[mi+4] = (uint8_t) (leds[i] & 0x00000000FF); 
    }
    //Correct size
    mi = mi + 4 + 1;

    //Insert end
    light_msg[mi] = 0xF7;

    //Prepare data
    midiHdr.lpData = (LPSTR) light_msg;
    midiHdr.dwBufferLength = mi + 1;
    midiHdr.dwBytesRecorded = mi + 1;
    midiOutPrepareHeader(hMidiOut, &midiHdr, sizeof(MIDIHDR));

    //Write data
    midiOutLongMsg(this->hMidiOut, &this->midiHdr, sizeof(MIDIHDR));
}
#include <stdio.h>
#include <Windows.h>
#include <mmsystem.h>
#include <signal.h>
#include <stdint.h>
#include <iostream>

static volatile bool isRunning = true;

void EnumerateMidiInputDevices()
{
    int numInputDevices = midiInGetNumDevs(); // Get number of MIDI input devices
    std::cout << "Number of MIDI Input Devices: " << numInputDevices << std::endl;

    for (int i = 0; i < numInputDevices; ++i)
    {
        MIDIINCAPS midiInCaps;
        MMRESULT result = midiInGetDevCaps(i, &midiInCaps, sizeof(midiInCaps));

        if (result == MMSYSERR_NOERROR)
        {
            std::cout << "MIDI Input Device " << i + 1 << ":" << std::endl;
            std::cout << "  Device name: " << midiInCaps.szPname << std::endl;
            std::cout << "  Manufacturer ID: " << midiInCaps.wMid << std::endl;
            std::cout << "  Product ID: " << midiInCaps.wPid << std::endl;
        }
        else
        {
            std::cout << "Error retrieving MIDI input device " << i + 1 << " information." << std::endl;
        }
    }
}

void EnumerateMidiOutputDevices()
{
    int numOutputDevices = midiOutGetNumDevs(); // Get number of MIDI output devices
    std::cout << "Number of MIDI Output Devices: " << numOutputDevices << std::endl;

    for (int i = 0; i < numOutputDevices; ++i)
    {
        MIDIOUTCAPS midiOutCaps;
        MMRESULT result = midiOutGetDevCaps(i, &midiOutCaps, sizeof(midiOutCaps));

        if (result == MMSYSERR_NOERROR)
        {
            std::cout << "MIDI Output Device " << i + 1 << ":" << std::endl;
            std::cout << "  Device name: " << midiOutCaps.szPname << std::endl;
            std::cout << "  Manufacturer ID: " << midiOutCaps.wMid << std::endl;
            std::cout << "  Product ID: " << midiOutCaps.wPid << std::endl;
        }
        else
        {
            std::cout << "Error retrieving MIDI output device " << i + 1 << " information." << std::endl;
        }
    }
}

bool sigInterruptHandler(int signal) {
    isRunning = false;
    return true;
}

void CALLBACK callback(HMIDIIN hMidiIn, UINT wMsg, DWORD dwInstance, DWORD dwParam1, DWORD dwParam2) {
    if (wMsg == MIM_DATA) {
        DWORD midiMessage = dwParam1;
        BYTE statusByte = (BYTE)(midiMessage & 0xFF);
        BYTE dataByte1 = (BYTE)((midiMessage >> 8) & 0xFF);
        BYTE dataByte2 = (BYTE)((midiMessage >> 16) & 0xFF);

        printf("Msg: 0x%02X 0x%02X 0x%02X\n", statusByte, dataByte1, dataByte2);
    }
}

int mainold() {
    SetConsoleCtrlHandler((PHANDLER_ROUTINE) sigInterruptHandler, true);

    EnumerateMidiInputDevices();
    EnumerateMidiOutputDevices();

    HMIDIIN hMidiIn;
    HMIDIOUT hMidiOut;

    MIDIHDR midiHdr;

    // Open MIDI devices

    MMRESULT result = midiInOpen(&hMidiIn, 1, (DWORD_PTR)callback, 0, CALLBACK_FUNCTION);
    if (result != MMSYSERR_NOERROR) {
        printf("Error opening MIDI input device!\n");
        return -1;
    }

    result = midiOutOpen(&hMidiOut, 2, 0, 0, CALLBACK_NULL);
    if (result != MMSYSERR_NOERROR) {
        printf("Error opening MIDI output device!\n");
    }

    midiInStart(hMidiIn);

    //Set to programmer mode

    //Do stuff
    printf("Midi setup done.\n");
    printf("Listening...\n");

    ZeroMemory(&midiHdr, sizeof(MIDIHDR));
    BYTE programmer_msg[] = {0xF0, 0x00, 0x20, 0x29, 0x02, 0x0D, 0x0E, 0x01, 0xF7};
    midiHdr.lpData = (LPSTR) programmer_msg;
    midiHdr.dwBufferLength = sizeof(programmer_msg);
    midiHdr.dwBytesRecorded = sizeof(programmer_msg);
    midiOutPrepareHeader(hMidiOut, &midiHdr, sizeof(MIDIHDR));
    midiOutLongMsg(hMidiOut, &midiHdr, sizeof(MIDIHDR));

    while(isRunning) {
        BYTE light_msg[] = {0xF0, 0x00, 0x20, 0x29, 0x02, 0x0D, 0x03, 0x03, 0x0B, 0x7F, 0x7F, 0x7F, 0xF7};
        midiHdr.lpData = (LPSTR) light_msg;
        midiHdr.dwBufferLength = sizeof(light_msg);
        midiHdr.dwBytesRecorded = sizeof(light_msg);
        midiOutPrepareHeader(hMidiOut, &midiHdr, sizeof(MIDIHDR));
        midiOutLongMsg(hMidiOut, &midiHdr, sizeof(MIDIHDR));

        midiOutShortMsg(hMidiOut, 0x00901105);
        Sleep(10);
    }

    midiInClose(hMidiIn);
    midiOutClose(hMidiOut);
    printf("Midi closed.\n");
    return 0;
}
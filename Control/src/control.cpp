#include "control.hpp"

Control::Control(LPMK3 *device, UART *uart) {
    this->device = device;
    this->uart = uart;
}

void Control::Input(uint8_t btn, bool isPressed) {
    uint8_t current_col = btn % 10;
    uint8_t current_row = floor(btn / 10);

    //Clamp column to max 8
    if (current_col > 8) {
        current_col = 8;
    }

    //Do something
    if (isPressed) {
        LEDFader(current_col, current_row, 0x7F, 0x7F, 0x7F);
        std::string data = "";
        data += std::to_string(current_col) + " | " + std::to_string(current_row) + "\n";
        this->uart->Write(data);
    }
}

void Control::LEDFader(uint8_t col, uint8_t current_row, uint8_t r, uint8_t g, uint8_t b) {

    uint64_t faderColor = (r << 16) ^ (g << 8) ^ b;
    uint64_t mode = 0x0300000000;

    uint64_t ledData[MAX_ROW];
    memset(ledData, 0, sizeof(ledData));
    for (int r = MAX_ROW; r >= current_row; r--) {
        uint8_t target_btn = (r + 1) * 10 + col;
        ledData[r] = mode + ((uint64_t)target_btn << 24);
        //printf("ledData: 0x%016llX\n", ledData[r]);
    }

    for (r = 0; r < current_row; r++) {
        uint8_t target_btn = (r + 1) * 10 + col;
        ledData[r] = mode + ((uint64_t)target_btn << 24) + (uint64_t)faderColor;
    }

    this->device->WriteLED(ledData, MAX_ROW);
}
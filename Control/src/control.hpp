#ifndef CONTROL_H
#define CONTROL_H
#include "lpmk3.hpp"
#include "uart.hpp"

#define MAX_ROW 8

class Control {
public:
    Control(LPMK3 *device, UART *uart);
    void Input(uint8_t btn, bool isPressed);
private:
    void LEDFader(uint8_t col, uint8_t btn, uint8_t r, uint8_t g, uint8_t b);
    LPMK3 *device;
    UART *uart;
};
#endif
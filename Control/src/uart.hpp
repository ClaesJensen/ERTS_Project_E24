#ifndef UART_H
#define UART_H
#include <windows.h>
#include <string>
#include <iostream>
#include <comdef.h>
#include <stdint.h>
class UART {
public:
    UART(LPCSTR port_name, DWORD baud_rate);
    ~UART();
    void Write(uint8_t *data, uint16_t len);
private:
    HANDLE hSerial;
};
#endif
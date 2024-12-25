#ifndef UART_H
#define UART_H
#include <windows.h>
#include <string>
#include <iostream>
#include <comdef.h>
class UART {
public:
    UART(LPCSTR port_name, DWORD baud_rate);
    ~UART();
    void Write(std::string data);
private:
    HANDLE hSerial;
};
#endif
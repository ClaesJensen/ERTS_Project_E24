#include "uart.hpp"

UART::UART(LPCSTR port_name, DWORD baud_rate) {
    this->hSerial = CreateFile(
        port_name,
        GENERIC_READ | GENERIC_WRITE,
        0,
        NULL,
        OPEN_EXISTING,
        0,
        NULL
    );

    if (this->hSerial  == INVALID_HANDLE_VALUE) {
        std::cerr << "Error opening serial port: " << GetLastError() << std::endl;
        return;
    }

    DCB dcbSerialParams = {0};
    dcbSerialParams.DCBlength = sizeof(dcbSerialParams);


    if (!GetCommState(this->hSerial , &dcbSerialParams)) {
        std::cerr << "Error getting serial port state: " << GetLastError() << std::endl;
        CloseHandle(this->hSerial );
        return;
    }

    dcbSerialParams.BaudRate = baud_rate;
    dcbSerialParams.ByteSize = 8;    // 8 data bits
    dcbSerialParams.StopBits = ONESTOPBIT;   // 1 stop bit
    dcbSerialParams.Parity = NOPARITY; // No parity
    dcbSerialParams.fDtrControl = DTR_CONTROL_ENABLE; // Enable DTR

    if (!SetCommState(this->hSerial , &dcbSerialParams)) {
        std::cerr << "Error setting serial port state: " << GetLastError() << std::endl;
        CloseHandle(this->hSerial );
        return;
    }

    // Set timeouts (optional)
    COMMTIMEOUTS timeouts = {0};
    timeouts.ReadIntervalTimeout = 50;
    timeouts.ReadTotalTimeoutConstant = 50;
    timeouts.ReadTotalTimeoutMultiplier = 10;
    timeouts.WriteTotalTimeoutConstant = 50;
    timeouts.WriteTotalTimeoutMultiplier = 10;

    if (!SetCommTimeouts(this->hSerial , &timeouts)) {
        std::cerr << "Error setting timeouts: " << GetLastError() << std::endl;
        CloseHandle(this->hSerial );
        return;
    }
}

UART::~UART() {
    CloseHandle(this->hSerial );
}

void UART::Write(std::string data) {
    DWORD bytes_written;
    if (!WriteFile(hSerial, data.c_str(), data.size(), &bytes_written, NULL)) {
        std::cerr << "Error writing to serial port: " << GetLastError() << std::endl;
    } else {
        std::cout << "Sent: " << data << std::endl;
    }
}
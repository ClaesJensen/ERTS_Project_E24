#include "UART.hpp"

UART::UART(uint32_t uart_base_addr, uint32_t uart_fifo_offset) {
	this->uart_base_addr = uart_base_addr;
	this->uart_fifo_offest = uart_fifo_offset;
}

bool UART::nonBlockingRead(uint8_t *out, uint64_t blockingIterations) {
	bool isValid = false;
	for (uint64_t i = 0; i < blockingIterations; i++) {
		if (XUartPs_IsReceiveData(this->uart_base_addr)) {
			isValid = true;
			break;
		}
	}

	uint32_t recv_byte = XUartPs_ReadReg(this->uart_base_addr, this->uart_fifo_offest);
	*out = (uint8_t)recv_byte;
	return isValid;
}

bool UART::nonBlockingRead4Bytes(uint32_t* result, uint64_t blockingIterations) {
	if (this->readCount == 0) {
		this->result = 0;
	}

	uint8_t temp_result;
	if (!nonBlockingRead(&temp_result, blockingIterations)) {
		return false;
	}

	// Bit shift temp_result and add it to the final result.
	this->result ^= (temp_result << (24 - (8 * this->readCount)));
	xil_printf("0x%02X\r\n", this->result);

	this->readCount++;
	if (this->readCount >= 4) {
		*result = this->result;
		this->readCount = 0;
		return true;
	}
	else {
		return false;
	}
}

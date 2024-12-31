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

#ifdef ECHO_DATA
	if (isValid) {
		//xil_printf("ECHO: 0x%02X\r\n", recv_byte);
		xil_printf("ECHO: %c\r\n", recv_byte);
	}
#endif


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

void UART::BlockingRead(uint8_t *out, AbstractOS::Thread* thread) {
	while (!XUartPs_IsReceiveData(this->uart_base_addr)) {
		thread->Sleep(10);
	}
	*out = XUartPs_ReadReg(this->uart_base_addr, this->uart_fifo_offest);
}

void UART::BlockingRead4Bytes(uint32_t* result, AbstractOS::Thread* thread) {
	uint32_t temp_result = 0;
	uint8_t byte;
	for (uint8_t i = 0; i < 4; i++) {
		BlockingRead(&byte, thread);
		xil_printf("0x%02X\n", byte);
		temp_result ^= byte << (24 - 8 * i);
	}
	*result = temp_result;
}

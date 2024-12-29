#ifndef UART_HPP_
#define UART_HPP_
#include <stdint.h>
#include <xuartps_hw.h>
class UART {
public:
	UART(uint32_t uart_base_addr, uint32_t uart_fifo_offest);
	bool nonBlockingRead(uint8_t *out, uint64_t blockingIterations);
	bool nonBlockingRead4Bytes(uint32_t* result, uint64_t blockingIterations);
private:
	uint32_t uart_base_addr;
	uint32_t uart_fifo_offest;

	uint32_t result;
	uint8_t readCount = 0;
};
#endif

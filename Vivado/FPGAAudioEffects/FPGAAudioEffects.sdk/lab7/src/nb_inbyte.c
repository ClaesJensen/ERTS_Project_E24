#include "nb_inbyte.h"

u8 XUartPs_NonBlockingRecvByte(u32 BaseAddress, u64 BlockingIterations)
{
	u32 RecievedByte;
	/* Wait until there is data or we run out of blocking iterations */
	for (u64 i = 0; i < BlockingIterations; i++) {
		if (XUartPs_IsReceiveData(BaseAddress)) {
			break;
		}
	}

	RecievedByte = XUartPs_ReadReg(BaseAddress, XUARTPS_FIFO_OFFSET);

	/* Return the byte received */
	return (u8)RecievedByte;
}


char nb_inbyte(u64 BlockingIterations) {
	return XUartPs_NonBlockingRecvByte(STDIN_BASEADDRESS, BlockingIterations);
}

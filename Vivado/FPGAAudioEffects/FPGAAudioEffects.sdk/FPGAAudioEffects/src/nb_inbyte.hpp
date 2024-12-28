#ifndef NB_INBYTE_H
#define NB_INBYTE_H

#include "xparameters.h"
#include "xuartps_hw.h"

u8 XUartPs_NonBlockingRecvByte(u32 BaseAddress, u64 BlockingIterations);
char nb_inbyte(u64 BlockingIterations);

#endif

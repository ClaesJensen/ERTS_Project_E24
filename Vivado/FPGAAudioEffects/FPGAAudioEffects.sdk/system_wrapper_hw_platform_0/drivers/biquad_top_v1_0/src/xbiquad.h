// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.2
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

#ifndef XBIQUAD_H
#define XBIQUAD_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xbiquad_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 Biquad_io_BaseAddress;
} XBiquad_Config;
#endif

typedef struct {
    u32 Biquad_io_BaseAddress;
    u32 IsReady;
} XBiquad;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XBiquad_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XBiquad_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XBiquad_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XBiquad_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XBiquad_Initialize(XBiquad *InstancePtr, u16 DeviceId);
XBiquad_Config* XBiquad_LookupConfig(u16 DeviceId);
int XBiquad_CfgInitialize(XBiquad *InstancePtr, XBiquad_Config *ConfigPtr);
#else
int XBiquad_Initialize(XBiquad *InstancePtr, const char* InstanceName);
int XBiquad_Release(XBiquad *InstancePtr);
#endif


void XBiquad_SetIndata(XBiquad *InstancePtr, u32 Data);
u32 XBiquad_GetIndata(XBiquad *InstancePtr);
u32 XBiquad_GetOutdata(XBiquad *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif

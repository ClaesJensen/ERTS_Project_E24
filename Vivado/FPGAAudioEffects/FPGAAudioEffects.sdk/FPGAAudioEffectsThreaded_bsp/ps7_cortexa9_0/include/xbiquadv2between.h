// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.2
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

#ifndef XBIQUADV2BETWEEN_H
#define XBIQUADV2BETWEEN_H

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
#include "xbiquadv2between_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 Biquadv2_BaseAddress;
} XBiquadv2between_Config;
#endif

typedef struct {
    u32 Biquadv2_BaseAddress;
    u32 IsReady;
} XBiquadv2between;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XBiquadv2between_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XBiquadv2between_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XBiquadv2between_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XBiquadv2between_ReadReg(BaseAddress, RegOffset) \
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
int XBiquadv2between_Initialize(XBiquadv2between *InstancePtr, u16 DeviceId);
XBiquadv2between_Config* XBiquadv2between_LookupConfig(u16 DeviceId);
int XBiquadv2between_CfgInitialize(XBiquadv2between *InstancePtr, XBiquadv2between_Config *ConfigPtr);
#else
int XBiquadv2between_Initialize(XBiquadv2between *InstancePtr, const char* InstanceName);
int XBiquadv2between_Release(XBiquadv2between *InstancePtr);
#endif


void XBiquadv2between_Set_b0_a0_V(XBiquadv2between *InstancePtr, u32 Data);
u32 XBiquadv2between_Get_b0_a0_V(XBiquadv2between *InstancePtr);
void XBiquadv2between_Set_b1_a0_V(XBiquadv2between *InstancePtr, u32 Data);
u32 XBiquadv2between_Get_b1_a0_V(XBiquadv2between *InstancePtr);
void XBiquadv2between_Set_b2_a0_V(XBiquadv2between *InstancePtr, u32 Data);
u32 XBiquadv2between_Get_b2_a0_V(XBiquadv2between *InstancePtr);
void XBiquadv2between_Set_a1_a0_V(XBiquadv2between *InstancePtr, u32 Data);
u32 XBiquadv2between_Get_a1_a0_V(XBiquadv2between *InstancePtr);
void XBiquadv2between_Set_a2_a0_V(XBiquadv2between *InstancePtr, u32 Data);
u32 XBiquadv2between_Get_a2_a0_V(XBiquadv2between *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif

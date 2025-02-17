// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.2
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xbiquadv2coeffs.h"

extern XBiquadv2coeffs_Config XBiquadv2coeffs_ConfigTable[];

XBiquadv2coeffs_Config *XBiquadv2coeffs_LookupConfig(u16 DeviceId) {
	XBiquadv2coeffs_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XBIQUADV2COEFFS_NUM_INSTANCES; Index++) {
		if (XBiquadv2coeffs_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XBiquadv2coeffs_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XBiquadv2coeffs_Initialize(XBiquadv2coeffs *InstancePtr, u16 DeviceId) {
	XBiquadv2coeffs_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XBiquadv2coeffs_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XBiquadv2coeffs_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif


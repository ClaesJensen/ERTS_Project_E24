#include "ISR.hpp"

ISR::ISR() {
	this->isReady = false;
}

ISR::ISR(XScuGic *ScuGic) {
	this->ScuGic = ScuGic;
}

void ISR::Init() {
	//This functions sets up the interrupt on the ARM
	int result;
	XScuGic_Config *pCfg = XScuGic_LookupConfig(XPAR_SCUGIC_0_DEVICE_ID);
	if (pCfg == NULL){
		print("Interrupt Configuration Lookup Failed\n\r");
	    return;
	}

	result = XScuGic_CfgInitialize(this->ScuGic,pCfg,pCfg->CpuBaseAddress);
	if(result != XST_SUCCESS){
		print("Interrupt Init Failed\n\r");
		return;
	}
	// self test
	result = XScuGic_SelfTest(ScuGic);
	if(result != XST_SUCCESS){
		print("Interrupt self test Failed\n\r");
		return;
	}
	// Initialize the exception handler
	Xil_ExceptionInit();
	// Register the exception handler
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,(Xil_ExceptionHandler)XScuGic_InterruptHandler, this->ScuGic);
	//Enable the exception handler
	Xil_ExceptionEnable();

	this->isReady = true;
}

void ISR::ConnectISRHandler(uint32_t InterruptID, Xil_InterruptHandler Handler, void *CallbackReference) {
	if (!this->isReady) {
		xil_printf("ISR is not ready!\n");
		return;
	}

	//Connect ISR
	int result = XScuGic_Connect(this->ScuGic, InterruptID, Handler, CallbackReference);
	if(result != XST_SUCCESS){
		return;
	}

	// Enable ISR
	XScuGic_Enable(this->ScuGic, InterruptID);
}

#include "Timer.hpp"

Timer::Timer() {
	int Status;
	XScuTimer_Config *ConfigTmrPtr;

	/* Initialize the Scu Private Timer driver. */
	ConfigTmrPtr = XScuTimer_LookupConfig(XPAR_PS7_SCUTIMER_0_DEVICE_ID);

	/* This is where the virtual address would be used, this uses physical address. */
	Status = XScuTimer_CfgInitialize(&this->timer, ConfigTmrPtr, ConfigTmrPtr->BaseAddr);
	if (Status != XST_SUCCESS) {
		xil_printf("Timer Config Init failed!\n");
		return;
	}

	/* Disable Auto reload mode and set prescaler to 1 */
	XScuTimer_SetPrescaler(&this->timer, 0);
}

void Timer::usDelay(uint32_t usDelay) {
	u32 timerCnt;

	timerCnt = (TIMER_FREQ_HZ / 1000000) * usDelay;

	XScuTimer_Stop(&this->timer);
	XScuTimer_DisableAutoReload(&this->timer);
	XScuTimer_LoadTimer(&this->timer, timerCnt);
	XScuTimer_Start(&this->timer);
	while (XScuTimer_GetCounterValue(&this->timer));
}

// Standard includes
#include <xparameters.h>
#include <xil_io.h>
#include <xstatus.h>
#include <xiicps.h>
#include <xscugic.h>
#include <xbiquadv2start.h>
#include <xbiquadv2between.h>
#include <xbiquadv2end.h>

// Custom classes
#include "system/BiquadSegmentStart.hpp"
#include "system/BiquadSegmentMiddle.hpp"
#include "system/BiquadSegmentEnd.hpp"
#include "system/ParametricEQ.hpp"
#include "system/ISR.hpp"
#include "system/Timer.hpp"
#include "system/Audio.hpp"
#include "system/UART.hpp"
#include "system/UI.hpp"
#include "system/AudioProcessing.hpp"

// Threads
#include "AudioThread.hpp"
#include "UIThread.hpp"

#define ECHO_DATA

#define N_BIQUAD_BETWEEN 6

// -- HW Instances --
//Create instances of Iic and ScuGic(I2C and Interrupt stuff).
XIicPs Iic;
XScuGic ScuGic;

//Setup Timer, ISR and Audio
Timer timer;
ISR isr(&ScuGic);
Audio audio = Audio(&timer, XPAR_XIICPS_0_DEVICE_ID);

//Setup Biquad Segments
BiquadSegmentStart bq_start = BiquadSegmentStart(XPAR_XBIQUADV2START_0_DEVICE_ID);
BiquadSegmentMiddle bq_middle0 = BiquadSegmentMiddle(XPAR_XBIQUADV2BETWEEN_0_DEVICE_ID);
BiquadSegmentMiddle bq_middle1 = BiquadSegmentMiddle(XPAR_XBIQUADV2BETWEEN_1_DEVICE_ID);
BiquadSegmentMiddle bq_middle2 = BiquadSegmentMiddle(XPAR_XBIQUADV2BETWEEN_2_DEVICE_ID);
BiquadSegmentMiddle bq_middle3 = BiquadSegmentMiddle(XPAR_XBIQUADV2BETWEEN_3_DEVICE_ID);
BiquadSegmentMiddle bq_middle4 = BiquadSegmentMiddle(XPAR_XBIQUADV2BETWEEN_4_DEVICE_ID);
BiquadSegmentMiddle bq_middle5 = BiquadSegmentMiddle(XPAR_XBIQUADV2BETWEEN_5_DEVICE_ID);
BiquadSegmentEnd bq_end = BiquadSegmentEnd(&isr, XPAR_XBIQUADV2END_0_DEVICE_ID);

//Gather middle biquad segments into a collection.
BiquadSegmentMiddle *bq_middleCollection[N_BIQUAD_BETWEEN] = {&bq_middle0, &bq_middle1, &bq_middle2, &bq_middle3, &bq_middle4, &bq_middle5};

//Create EQ with the created biquad segments
ParametricEQ eq = ParametricEQ(&bq_start, bq_middleCollection, N_BIQUAD_BETWEEN, &bq_end);

//Audio processing
AudioProcessing ap = AudioProcessing(&audio, &eq);

//Init uart and ui
UART uart(STDIN_BASEADDRESS, XUARTPS_FIFO_OFFSET);
UI ui(&uart, &eq, &ap);

int main()
{
	xil_printf("Starting setup...\r\n");
	isr.Init();

	//Create threads
	AudioThread tAudioThread(Thread::PRIORITY_NORMAL, "AudioThread", &ap);
	UIThread tUIThread(Thread::PRIORITY_HIGH, "UIThread", &ui);

	//Start RTOS task scheduling
	vTaskStartScheduler();

	for( ;; );
}

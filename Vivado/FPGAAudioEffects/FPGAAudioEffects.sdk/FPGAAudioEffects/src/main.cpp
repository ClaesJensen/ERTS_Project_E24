#include <xparameters.h>
#include <xil_io.h>
#include <xstatus.h>
#include <xiicps.h>
#include <xscutimer.h>
#include <xscugic.h>
#include <xbiquadv2start.h>
#include <xbiquadv2between.h>
#include <xbiquadv2end.h>

#include "BiquadSegmentStart.hpp"
#include "BiquadSegmentMiddle.hpp"
#include "BiquadSegmentEnd.hpp"
#include "ParametricEQ.hpp"
#include "ISR.hpp"
#include "Timer.hpp"
#include "Audio.hpp"
#include "UART.hpp"
#include "UI.hpp"

//#define TIMER_FREQ_HZ (XPAR_CPU_CORTEXA9_0_CPU_CLK_FREQ_HZ / 2)
#define N_BIQUAD_BETWEEN 6

//Create instances of Iic and ScuGic(I2C and Interrupt stuff).
XIicPs Iic;
XScuGic ScuGic;

//Setup Timer, ISR and Audio
Timer timer;
ISR isr(&ScuGic);
Audio audio = Audio(&timer, XPAR_XIICPS_0_DEVICE_ID);
UART uart(STDIN_BASEADDRESS, XUARTPS_FIFO_OFFSET);
UI ui(&uart);

//Setup Biquad Segments
BiquadSegmentStart start = BiquadSegmentStart(XPAR_XBIQUADV2START_0_DEVICE_ID);
BiquadSegmentMiddle middle0 = BiquadSegmentMiddle(XPAR_XBIQUADV2BETWEEN_0_DEVICE_ID);
BiquadSegmentMiddle middle1 = BiquadSegmentMiddle(XPAR_XBIQUADV2BETWEEN_1_DEVICE_ID);
BiquadSegmentMiddle middle2 = BiquadSegmentMiddle(XPAR_XBIQUADV2BETWEEN_2_DEVICE_ID);
BiquadSegmentMiddle middle3 = BiquadSegmentMiddle(XPAR_XBIQUADV2BETWEEN_3_DEVICE_ID);
BiquadSegmentMiddle middle4 = BiquadSegmentMiddle(XPAR_XBIQUADV2BETWEEN_4_DEVICE_ID);
BiquadSegmentMiddle middle5 = BiquadSegmentMiddle(XPAR_XBIQUADV2BETWEEN_5_DEVICE_ID);
BiquadSegmentEnd end = BiquadSegmentEnd(XPAR_XBIQUADV2END_0_DEVICE_ID);

//Gather middle biquad segments into a collection.
BiquadSegmentMiddle *middleCollection[N_BIQUAD_BETWEEN] = {&middle0, &middle1, &middle2, &middle3, &middle4, &middle5};

//Create EQ with the created biquad segments
ParametricEQ eq = ParametricEQ(&start, middleCollection, N_BIQUAD_BETWEEN, &end);

void EQProcessingDoneCallback(void* InstancePtr) {
	XBiquadv2end *pBiquad = (XBiquadv2end*) InstancePtr;
	XBiquadv2end_InterruptClear(pBiquad, 1);
	eq.isDone = true;
}

int main() {
	xil_printf("Start...\r\n");

	//Connect the EQ to the ISR Handler & Enable the interrupt
	isr.ConnectISRHandler(XPAR_FABRIC_PARAMETRICEQ_BIQUADV2END_0_INTERRUPT_INTR, (Xil_InterruptHandler) EQProcessingDoneCallback, &end.biquad_end);
	eq.EnableInterrupts();

	//Set initial coefficients
	eq.SetCoefficients(0, 15364841, -30155609, 15050980, -(-30155609), -(13638606));
	eq.SetCoefficients(1, 16622562, -33207912, 16588195, -(-33207912), -(16433542));
	eq.SetCoefficients(2, 7692185, -3934265, 7508649, -(-3934265), -(-1576382));
	eq.SetCoefficients(3, 1 << 24, 0, 0, 0, 0);
	eq.SetCoefficients(4, 1 << 24, 0, 0, 0, 0);
	eq.SetCoefficients(5, 1 << 24, 0, 0, 0, 0);
	eq.SetCoefficients(6, 1 << 24, 0, 0, 0, 0);
	eq.SetCoefficients(7 , 1 << 24, 0, 0, 0, 0);
	xil_printf("Coeffs set...\r\n");

	//Enable output
	Xil_Out32(XPAR_AXI_GPIO_0_BASEADDR, 0x00000001);

	uint32_t dataL;
	uint32_t dataR;

	while(1) {
		ui.PollInput();


		//Read input
		audio.ReadBlocking(&dataL, &dataR);

		//Using the EQ
		eq.Write(dataL, dataR);
		while(!eq.isDone);
		eq.Read(&dataL, &dataR);

		//Write to output
		audio.Write(dataL, dataR);
	}
	return 0;
}

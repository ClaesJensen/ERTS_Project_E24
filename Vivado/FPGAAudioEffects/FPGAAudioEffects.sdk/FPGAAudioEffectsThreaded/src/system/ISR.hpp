#ifndef ISR_HPP_
#define ISR_HPP_
#include <xscugic.h>
class ISR {
public:
	ISR();
	ISR(XScuGic *ScuGic);
	void Init();
	void ConnectISRHandler(uint32_t InterruptID, Xil_InterruptHandler Handler, void *CallbackReference);
private:
	bool isReady = false;
	XScuGic *ScuGic;
};
#endif

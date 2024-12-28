#include "sysc/communication/sc_fifo.h"
#include "sysc/kernel/sc_module.h"
#include <systemc.h>

SC_MODULE(MOCK_AUDIO) {
  // IO 
  //
  sc_in<bool > in_clk;
  sc_in<bool > in_reset;
  sc_fifo<sc_uint<32> > audio_out; 
  sc_fifo<sc_uint<32> > audio_in; 
  sc_in<bool> audio_in_valid;
  sc_out<bool> audio_out_valid;


  SC_CTOR(MOCK_AUDIO) {
    SC_CTHREAD(audio_in_process, in_clk.pos());
    
  }

  void audio_in_process();
  void audio_out_process();
};

#include "biquad_test.hpp"

void BiquadTestbench::monitor() {
    printf("In monitor\n");
    //memset(result, 0, sizeof(result));
    printf("HERE\n");
    inReset.write(true);
    wait();
    inReset.write(false);
    wait();
    printf("HERE\n");

    sc_uint<8> i;
    for (i = 0; i < 32; i++) {
        outData.write(signalTest[i]);
        wait();
        result[i] = inData.read();
        wait();
    }

    sc_uint<1> areWeGood = 0;
    i = 0;
    for (i = 0; i < 32; i++) {
        if (signalExpected[i] == result[i]) {
            areWeGood = 1;
            printf("%i | %i | %i\n", signalExpected[i].to_int(), result[i].to_int(), 1);
        }
        else {
            areWeGood = 0;
            printf("%i | %i | %i\n", signalExpected[i].to_int(), result[i].to_int(), 0);
        }
    }

    printf("Done\n");
}

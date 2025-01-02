#include "control.hpp"

Control::Control(LPMK3 *device, UART *uart, BiquadCoefficients *biquad, double Q[MAX_COL], double f0[MAX_COL], double dbGain[MAX_ROW]) {
    this->device = device;
    this->uart = uart;
    this->biquad = biquad;

    this->Q = Q;
    this->f0 = f0;
    this->dbGain = dbGain;

    PopulateFilterMessages();
}

void Control::Input(uint8_t btn, bool isPressed) {
    uint8_t current_col = btn % 10;
    uint8_t current_row = floor(btn / 10);

    //Clamp column to max 8
    if (current_col > 8) {
        current_col = 8;
    }

    //Do something
    if (isPressed) {
        switch (btn)
        {
        case 0x13: {//Mute
            uint64_t ledsMute[1] = {0x03137F0000};
            this->device->WriteLED(ledsMute, 1);
            uint8_t msgMute[1] = {'M'};
            this->uart->Write(msgMute, 1);
            break;
        }

        case 0x1D: {//UnMute 
            uint64_t ledsUnMute[1] = {0x031D007F00};
            this->device->WriteLED(ledsUnMute, 1);
            uint8_t msgUnMute[1] = {'U'};
            this->uart->Write(msgUnMute, 1);
            break;
        }
        
        case 0x27: {//Passthrough
            uint64_t ledsPassthrough[1] = {0x03277F007F};
            this->device->WriteLED(ledsPassthrough, 1);
            uint8_t msgPassthrough[1] = {'P'};
            this->uart->Write(msgPassthrough, 1);
            break;
        }

        case 0x31: {//Activate filters
            uint64_t ledsActivateFilters[1] = {0x0331007F7F};
            this->device->WriteLED(ledsActivateFilters, 1);
            uint8_t msgActivateFilters[1] = {'E'};
            this->uart->Write(msgActivateFilters, 1);
            break;
        }
        
        case 0x3B:
            break;
        case 0x45:
            break;
        case 0x4F:
            break;
        case 0x59:
            break;
        
        //Top ctrl
        case 0x5B:
            break;
        case 0x5C:
            break;
        case 0x5D:
            break;
        case 0x5E:
            break;
        case 0x5F:
            break;
        case 0x60:
            break;
        case 0x61:
            break;
        case 0x62:
            break;

        default:
            LEDFader(current_col, current_row, 0x7F, 0x7F, 0x7F);
            break;
        }
    }
}

void Control::LEDFader(uint8_t current_col, uint8_t current_row, uint8_t r, uint8_t g, uint8_t b) {

    uint64_t faderColor = (r << 16) ^ (g << 8) ^ b;
    uint64_t mode = 0x0300000000;

    uint64_t ledData[MAX_ROW];
    memset(ledData, 0, sizeof(ledData));
    for (int r = MAX_ROW; r >= current_row; r--) {
        uint8_t target_btn = (r + 1) * 10 + current_col;
        ledData[r] = mode + ((uint64_t)target_btn << 24);
        //printf("ledData: 0x%016llX\n", ledData[r]);
    }

    uint64_t CustomFaderColor[MAX_ROW] = {
        0x00007F,
        0x003F7F,
        0x006F7F,
        0x7F7F7F,
        0x7F4F00,
        0x7F2F00,
        0x7F1F00,
        0x7F0000,
    };

    for (r = 0; r < current_row; r++) {
        uint8_t target_btn = (r + 1) * 10 + current_col;
        ledData[r] = mode + ((uint64_t)target_btn << 24) + (uint64_t) CustomFaderColor[MAX_ROW - 1 - r];//faderColor;
    }

    this->device->WriteLED(ledData, MAX_ROW);

    this->biquad->PeakingEQ_Q(2, 1000, -10);
    uint32_t b0_a0;
    uint32_t b1_a0;
    uint32_t b2_a0;
    uint32_t a1_a0;
    uint32_t a2_a0;

    this->biquad->GetLatestCoefficients(&b0_a0, &b1_a0, &b2_a0, &a1_a0, &a2_a0);

    uint8_t i = (current_col - 1) * MAX_ROW + ((current_row - 1) + 1) - 1;
    printf("c: %i | r: %i | i: %i\r\n", current_col, current_row, i);


    this->uart->Write(this->filterMsg[i], 23);
    /*if (col == 1) {
        
    switch(current_row) {

        case 8:
            this->uart->Write(this->filterMsg[], 23);
            break;
        case 7:
            this->uart->Write(this->PeakingEQMsgPos20, 23);
            break;
        case 6:
            this->uart->Write(this->PeakingEQMsgPos10, 23);
            break;
        case 5:
            this->uart->Write(this->Passthrough, 23);
            break;
        case 4:
            this->uart->Write(this->TEST, 23);
            //this->uart->Write(this->PeakingEQMsgNeg10, 23);
            break;
        case 3:
            this->uart->Write(this->PeakingEQMsgNeg20, 23);
            break;
        case 2:
            this->uart->Write(this->PeakingEQMsgNeg30, 23);
            break;
        case 1:
            this->uart->Write(this->PeakingEQMsgNeg40, 23);
            break;
        }

    }*/
}


void Control::PopulateFilterMessages() {
    uint8_t i = 0;
    for (uint8_t c = 0; c < MAX_COL; c++) {
        for (uint8_t r = 0; r < MAX_ROW; r++) {
            i = c * MAX_ROW + (r + 1) - 1;
            printf("c: %i | r: %i | i: %i\r\n", c, r, i);

            this->biquad->PeakingEQ_Q(this->Q[c], this->f0[c], this->dbGain[r]);
            uint32_t b0_a0;
            uint32_t b1_a0;
            uint32_t b2_a0;
            uint32_t a1_a0;
            uint32_t a2_a0;
            this->biquad->GetLatestCoefficients(&b0_a0, &b1_a0, &b2_a0, &a1_a0, &a2_a0);

            this->filterMsg[i][0] = 'F';
            this->filterMsg[i][1] = 'S';
            this->filterMsg[i][2] = c; //Target index
            //Filter coeff b0_a0
            this->filterMsg[i][3] = ((b0_a0 & 0xFF000000) >> 24);
            this->filterMsg[i][4] = ((b0_a0 & 0x00FF0000) >> 16);
            this->filterMsg[i][5] = ((b0_a0 & 0x0000FF00) >> 8);
            this->filterMsg[i][6] = ((b0_a0 & 0x000000FF));
            //Filter coeff b1_a0
            this->filterMsg[i][7] = ((b1_a0 & 0xFF000000) >> 24);
            this->filterMsg[i][8] = ((b1_a0 & 0x00FF0000) >> 16);
            this->filterMsg[i][9] = ((b1_a0 & 0x0000FF00) >> 8);
            this->filterMsg[i][10] = ((b1_a0 & 0x000000FF));
            //Filter coeff b2_a0
            this->filterMsg[i][11] = ((b2_a0 & 0xFF000000) >> 24);
            this->filterMsg[i][12] = ((b2_a0 & 0x00FF0000) >> 16);
            this->filterMsg[i][13] = ((b2_a0 & 0x0000FF00) >> 8);
            this->filterMsg[i][14] = ((b2_a0 & 0x000000FF));
            //Filter coeff a1_a0
            this->filterMsg[i][15] = ((a1_a0 & 0xFF000000) >> 24);
            this->filterMsg[i][16] = ((a1_a0 & 0x00FF0000) >> 16);
            this->filterMsg[i][17] = ((a1_a0 & 0x0000FF00) >> 8);
            this->filterMsg[i][18] = ((a1_a0 & 0x000000FF));
            //Filter coeff a2_a0
            this->filterMsg[i][19] = ((a2_a0 & 0xFF000000) >> 24);
            this->filterMsg[i][20] = ((a2_a0 & 0x00FF0000) >> 16);
            this->filterMsg[i][21] = ((a2_a0 & 0x0000FF00) >> 8);
            this->filterMsg[i][22] = ((a2_a0 & 0x000000FF));

        }
    }
}
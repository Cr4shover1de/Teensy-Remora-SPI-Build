#include "mbed.h"
#include "remora.h"

// Assume SPI remora transport is initialized in remora.cpp

int main() {
    remora_init();

    while (true) {
        remora_poll();
        ThisThread::sleep_for(1ms);
    }
}

#include "mbed.h"
#include "remora.h"

int main() {
    // Initialize Remora
    remoraInit();

    while (true) {
        remoraMain();
    }
}

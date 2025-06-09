#include "remora.h"
#include "configuration.h"

int main() {
    RemoraApp app;
    app.setup();
    while (true) {
        app.loop();
    }
}

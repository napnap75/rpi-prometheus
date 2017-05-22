This is a clone of [the official Prometheus images](https://hub.docker.com/u/prom/) for the raspberry pi.

The changes from the original images are :
- built from armhf/busybox instead of busybox
- added QEmu in the image to allow it to be build on x86 systems (Travis CI)

The source code is available [here](https://github.com/napnap75/rpi-prometheus) and the image [here](https://hub.docker.com/r/napnap75/rpi-prometheus/).

This image is build every week thanks to Travis CI.

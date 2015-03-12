example how to run eLua with chibios
====================================

Example how to run eLua with chibios on STM32F4_DISCOVERY.

eLua use its own memory management so, my solution is split memory, one part for chibios and second for eLua (refer to STM32F407xG.ld)
This demo is based on original ChibiOS/demos/ARMCM4-STM32F407-DISCOVERY-MEMS


Quick start
----------------
```
mkdir -p ~/src/elua_chibios/
cd  -p ~/src/elua_chibios/
git clone https://github.com/ChibiOS/ChibiOS.git
git clone https://github.com/linvinus/chibios_with_elua.git
cd ~/src/elua_chibios/chibios_with_elua/ext/
git clone https://github.com/elua/elua.git
cd ~/src/elua_chibios/chibios_with_elua
make
```

upload to STM32F4_DISCOVERY

by default elua available on USB serial (ttyACM0 in linux).

you may switch to serial driver in halconf.h

License
-------
Note, ChibiOS licensed under different licenses (Pure GPL3,GPL3 with Exception,Commercial).

While eLua licensed under MIT.

For more info refer to original sources.

http://www.chibios.org/dokuwiki/doku.php?id=chibios:license

http://www.eluaproject.net/overview/license

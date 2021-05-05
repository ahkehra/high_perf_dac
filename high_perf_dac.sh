#!/bin/bash
PATH=/data/high_perf_dac
DIR1=$(find /sys/module -name high_perf_mode)
DIR2=$(find /sys/module -name cpe_debug_mode)
DIR3=$(find /sys/module -name impedance_detect_en)
#By AkiraSuper (akira-vishal@GitHub)
if [ -d $DIR1 ]; then
     busybox echo "1" > $DIR1
     echo "Enabled High Perf Mode Excecuted on $(date +"%d-%m-%Y %r" )" >> $PATH/high_perf_mode.log
else
     echo "Disabled High Perf Mode Excecuted on $(date +"%d-%m-%Y %r" )" >> $PATH/high_perf_mode.log
fi
if [ -d $DIR2 ]; then
     busybox echo "1" > $DIR2
     echo "Enabled CPE Debug Mode Excecuted on $(date +"%d-%m-%Y %r" )" >> $PATH/cpe_debug_mode.log
else
     echo "Disabled CPE Debug Mode Excecuted on $(date +"%d-%m-%Y %r" )" >> $PATH/cpe_debug_mode.log
fi
if [ -d $DIR3 ]; then
     busybox echo "1" > $DIR3
     echo "Enabled Impedance Detect EN Excecuted on $(date +"%d-%m-%Y %r" )" >> $PATH/impedance_detect_en.log
else
     echo "Disabled Impedance Detect EN Excecuted on $(date +"%d-%m-%Y %r" )" >> $PATH/impedance_detect_en.log
fi

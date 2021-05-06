#!/system/bin/sh
PATH=/data/high_perf_dac
DIR1=$(find /sys/module -name high_perf_mode)
DIR2=$(find /sys/module -name cpe_debug_mode)
DIR3=$(find /sys/module -name impedance_detect_en)
chmod 0777 $MODDIR/post-fs-data.sh
if $DIR1; then
   echo "Disabled High Perf Mode Excecuted on $(date +"%d-%m-%Y %r" )" >> $PATH/high_perf_mode.log
else
   su busybox echo "1" > $DIR1
   echo "Enabled High Perf Mode Excecuted on $(date +"%d-%m-%Y %r" )" >> $PATH/high_perf_mode.log
fi
if $DIR2; then
   echo "Disabled CPE Debug Mode Excecuted on $(date +"%d-%m-%Y %r" )" >> $PATH/cpe_debug_mode.log
else
   su busybox echo "1" > $DIR2
   echo "Enabled CPE Debug Mode Excecuted on $(date +"%d-%m-%Y %r" )" >> $PATH/cpe_debug_mode.log
fi
if $DIR3; then
   echo "Disabled Impedance Detect EN Excecuted on $(date +"%d-%m-%Y %r" )" >> $PATH/impedance_detect_en.log
else
   su busybox echo "1" > $DIR3
   echo "Enabled Impedance Detect EN Excecuted on $(date +"%d-%m-%Y %r" )" >> $PATH/impedance_detect_en.log
fi

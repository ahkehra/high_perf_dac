#!/system/bin/sh
# Do not remove credit if you're using a part of this mod to your module.
# by akirasupr@github
MODDIR=${0%/*}
MODLOG=/data/high_perf_dac
# Check if folder exist else create new one
[ ! -d $MODLOG ] && mkdir -p $MODLOG
# Check if file exist
FILE1=$(find /sys/module -name high_perf_mode) 
FILE2=$(find /sys/module -name cpe_debug_mode)
FILE3=$(find /sys/module -name impedance_detect_en)
# High Perf Mode
if $FILE1; then
  echo "! Cannot find high_perf_mode Excecuted on $(date +"%d-%m-%Y %r" )" >> $MODLOG/akirasupr.log
else
  echo 1 > $FILE1
  echo "✓ Enabled high_perf_mode Excecuted on $(date +"%d-%m-%Y %r" )" >> $MODLOG/akirasupr.log
fi
# CPE Debug Mode
if $FILE2; then
  echo "! Cannot find cpe_debug_mode Excecuted on $(date +"%d-%m-%Y %r" )" >> $MODLOG/akirasupr.log
else
  echo 1 > $FILE2
  echo "✓ Enabled cpe_debug_mode Excecuted on $(date +"%d-%m-%Y %r" )" >> $MODLOG/akirasupr.log
fi
# Impedance Detect EN
if $FILE3; then
  echo "! Cannot find impedance_detect_en Excecuted on $(date +"%d-%m-%Y %r" )" >> $MODLOG/akirasupr.log
else
  echo 1 > $FILE3
  echo "✓ Enabled impedance_detect_en Excecuted on $(date +"%d-%m-%Y %r" )" >> $MODLOG/akirasupr.log
fi

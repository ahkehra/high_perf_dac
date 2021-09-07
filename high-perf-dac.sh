#!/system/bin/sh
# Do not remove credit if you're using a part of this mod to your module.
# by akirasupr@github
MOUNT=/data
MODDIR=${0%/*}
LOG=$MOUNT/high_perf_dac
# Check if file exist
FILE1=$(find /sys/module -name high_perf_mode)
FILE2=$(find /sys/module -name cpe_debug_mode)
FILE3=$(find /sys/module -name impedance_detect_en)
# High Perf Mode
if $FILE1; then
  echo "Disabled High Perf Mode Excecuted on $(date +"%d-%m-%Y %r" )" >> $LOG/akirasupr.log
else
  echo "Enabled High Perf Mode Excecuted on $(date +"%d-%m-%Y %r" )" >> $LOG/akirasupr.log
  echo 1 > $FILE1
fi
# CPE Debug Mode
if $FILE2; then
  echo "Disabled CPE Debug Mode Excecuted on $(date +"%d-%m-%Y %r" )" >> $LOG/akirasupr.log
else
  echo "Enabled CPE Debug Mode Excecuted on $(date +"%d-%m-%Y %r" )" >> $LOG/akirasupr.log
  echo 1 > $FILE2
fi
# Impedance Detect EN
if $FILE3; then
  echo "Disabled Impedance Detect EN Excecuted on $(date +"%d-%m-%Y %r" )" >> $LOG/akirasupr.log
else
  echo "Enabled Impedance Detect EN Excecuted on $(date +"%d-%m-%Y %r" )" >> $LOG/akirasupr.log
  echo 1 > $FILE3
fi

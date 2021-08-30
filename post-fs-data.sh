#!/system/bin/sh
# Do not remove credit if you're using a part of this mod to your module.
# by akirasupr@github
MOUNT=/data
if [ ! -d $MOUNT/high_perf_dac ]; then
     mkdir -p $MOUNT/high_perf_dac
fi
LOG=$MOUNT/high_perf_dac
# Check if sync enabled
if ! sync; then
  rm -rf $MODPATH
  echo "Disabled Module Excecuted on $(date +"%d-%m-%Y %r" )" >> $LOG/akirasupr.log
else
  su && chmod 777 $MODPATH/post-fs-data.sh
  echo "Enabled Module Excecuted on $(date +"%d-%m-%Y %r" )" >> $LOG/akirasupr.log
fi
# Check if file exist
FILE1=$(find /sys/module -name high_perf_mode)
FILE2=$(find /sys/module -name cpe_debug_mode)
FILE3=$(find /sys/module -name impedance_detect_en)
# High Perf Mode
if $FILE1; then
  echo "Disabled High Perf Mode Excecuted on $(date +"%d-%m-%Y %r" )" >> $LOG/akirasupr.log
else
  echo 1 > $FILE1
  echo "Enabled High Perf Mode Excecuted on $(date +"%d-%m-%Y %r" )" >> $LOG/akirasupr.log
fi
# CPE Debug Mode
if $FILE2; then
  echo "Disabled CPE Debug Mode Excecuted on $(date +"%d-%m-%Y %r" )" >> $LOG/akirasupr.log
else
  echo 1 > $FILE2
  echo "Enabled CPE Debug Mode Excecuted on $(date +"%d-%m-%Y %r" )" >> $LOG/akirasupr.log
fi
# Impedance Detect EN
if $FILE3; then
  echo "Disabled Impedance Detect EN Excecuted on $(date +"%d-%m-%Y %r" )" >> $LOG/akirasupr.log
else
  echo 1 > $FILE3
  echo "Enabled Impedance Detect EN Excecuted on $(date +"%d-%m-%Y %r" )" >> $LOG/akirasupr.log
fi
# Sound Boost
$MODDIR/high_perf_dac

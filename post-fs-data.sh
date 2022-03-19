#!/system/bin/sh
# Do not remove credit if you're using a part of this mod to your>
# by akirasupr@github
MODDIR=${0%/*}
MODLOG="/storage/emulated/0/high_perf_mode.log"
# Check if file exist
FILE1=$(find /sys/module -name high_perf_mode)
FILE2=$(find /sys/module -name cpe_debug_mode)
FILE3=$(find /sys/module -name impedance_detect_en)
# High Perf Mode
if $FILE1; then
  echo "! Cannot find high_perf_mode" >> $MODLOG
else
  echo 1 > $FILE1
  echo "✓ Enabled high_perf_mode Excecuted on $(date +"%d-%m-%Y %>
fi
# CPE Debug Mode
if $FILE2; then
  echo "! Cannot find cpe_debug_mode" >> $MODLOG
else
  echo 1 > $FILE2
  echo "✓ Enabled cpe_debug_mode Excecuted on $(date +"%d-%m-%Y %>
fi
# Impedance Detect EN
if $FILE3; then
  echo "! Cannot find impedance_detect_en" >> $MODLOG
else
  echo 1 > $FILE3
  echo "✓ Enabled impedance_detect_en Excecuted on $(date +"%d-%m>
fi

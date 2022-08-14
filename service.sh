#!/system/bin/sh
# Do not remove credit if you're using a part of this mod to your>
# by akirasup3r@github
MODDIR=${0%/*}

MODDATE=$(date +"%d-%m-%Y %r")
MODLOG="/storage/emulated/0/high_perf_dac.log"

# Check if file exist
FILE1=$(find /sys/module -name high_perf_mode)
FILE2=$(find /sys/module -name cpe_debug_mode)
FILE3=$(find /sys/module -name impedance_detect_en)

# High Perf Mode
if $FILE1; then
  echo "! Cannot find high_perf_mode file | ${MODDATE}" >> $MODLOG
else
  echo 1 > $FILE1
  echo "✓ Enabled high_perf_mode | ${MODDATE}" >> $MODLOG
fi

# CPE Debug Mode
if $FILE2; then
  echo "! Cannot find cpe_debug_mode file | ${MODDATE}" >> $MODLOG
else
  echo 1 > $FILE2
  echo "✓ Enabled cpe_debug_mode | ${MODDATE}" >> $MODLOG
fi

# Impedance Detect EN
if $FILE3; then
  echo "! Cannot find impedance_detect_en file | ${MODDATE}" >> $MODLOG
else
  echo 1 > $FILE3
  echo "✓ Enabled impedance_detect_en | ${MODDATE}" >> $MODLOG
fi

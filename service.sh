#!/system/bin/sh
# Do not remove credit if you're using a part of this mod to your!
# by reallyakera
# Function to write values to files
write() {
    local file="$1"
    local value="$2"

    # Check if the file exists
    if [ ! -f "$file" ]; then
        log-error "Error: File $file does not exist."
        return 1
    fi

    # Make file writable
    chmod +w "$file" 2>/dev/null

    # Write new value, bail out if it fails
    if ! echo "$value" >"$file" 2>/dev/null; then
        echo "Error: Failed to write to $file."
        return 1
    else
        return 0
    fi
}

# Vars
MODDIR=${0%/*}
MODLOG="/data/akera/high_perf_dac.txt"
MODDATE=$(date +"%d-%m-%Y %r")
CODENAME=$(grep_prop Codename $MODPATH/module.prop 2>/dev/null)
MODEL=$(getprop ro.product.system.model 2>/dev/null)
RELEASE=$(getprop ro.system.build.version.release 2>/dev/null)
HARDWARE=$(getprop ro.hardware 2>/dev/null)

# Check if file exist
FILE1=$(find /sys/module -name high_perf_mode)
FILE2=$(find /sys/module -name cpe_debug_mode)
FILE3=$(find /sys/module -name impedance_detect_en)

# O⁠_⁠o
touch $MODLOG
echo "# Device : $MODEL" > $MODLOG
echo "# Android : $RELEASE" >> $MODLOG
echo "# Hardware : $HARDWARE" >> $MODLOG
echo "# Codename : $CODENAME" >> $MODLOG
echo "×---------------------------------------------------×" >> $MODLOG

# DAC Mode
if $FILE1; then
  echo "! Cannot find high_perf_mode file | ${MODDATE}" >> $MODLOG
else
  write $FILE1 1
  echo "✓ Enabled high_perf_mode | ${MODDATE}" >> $MODLOG
fi

# CPE Debug Mode
if $FILE2; then
  echo "! Cannot find cpe_debug_mode file | ${MODDATE}" >> $MODLOG
else
  write $FILE2 1
  echo "✓ Enabled cpe_debug_mode | ${MODDATE}" >> $MODLOG
fi

# Impedance Detect EN
if $FILE3; then
  echo "! Cannot find impedance_detect_en file | ${MODDATE}" >> $MODLOG
else
  write $FILE2 3
  echo "✓ Enabled impedance_detect_en | ${MODDATE}" >> $MODLOG
fi

#End

#!/system/bin/sh
MODDIR=${0%/*}
su
DIR1=$(find /sys/module -name high_perf_mode);
DIR2=$(find /sys/module -name cpe_debug_mode);
DIR3=$(find /sys/module -name impedance_detect_en);
chmod 0777 $MODDIR/post-fs-data.sh
busybox echo "1" > $DIR1;
busybox echo "1" > $DIR2;
busybox echo "1" > $DIR3;
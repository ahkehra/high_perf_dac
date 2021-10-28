#!/system/bin/sh
# Do not remove credit if you're using a part of this mod to your module.
# by akirasupr@github
MOUNT=/data
MODDIR=${0%/*}
# Check if Log folder exist
LOG=$MOUNT/high_perf_dac
if ! $LOG; then
  rm -rf $MODPATH
else
  $MODDIR/high-perf-dac.sh
  echo "Excecuted on $(date +"%d-%m-%Y %r" )" >> $LOG/akirasupr.log
fi

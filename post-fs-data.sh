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
  # Sound Boost
  $MODDIR/high-perf-dac.sh
  $MODDIR/sound-boost.sh
  echo "Enabled Module Excecuted on $(date +"%d-%m-%Y %r" )" >> $LOG/akirasupr.log
fi

#!/system/bin/sh
# Do not remove credit if you're using a part of this mod to your module.
# by akirasupr@github
MOUNT=/data
MODDIR=${0%/*}
LOG=$MOUNT/high_perf_dac
if [ ! -d /sys/kernel/sound_control ]; then
    echo "Disabled Sound Boost Excecuted on $(date +"%d-%m-%Y %r" )" >> $LOG/akirasupr.log
else
    echo "10 10" > /sys/kernel/sound_control/headphone_gain
    echo 5 > /sys/kernel/sound_control/mic_gain
    echo 5 > /sys/kernel/sound_control/earpiece_gain
    echo 5 > /sys/kernel/sound_control/speaker_gain
    echo "Enabled Sound Boost Excecuted on $(date +"%d-%m-%Y %r" )" >> $LOG/akirasupr.log
fi

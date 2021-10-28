set -x
cleanup() {
  rm -rf $MOUNT/high_perf_dac 2>/dev/null
  rm -rf $MODPATH/changelog.txt 2>/dev/null
  rm -rf $MODPATH/LICENSE 2>/dev/null
  rm -rf $MODPATH/README.md 2>/dev/null
}
MOUNT=/data
permissions() {
  set_perm $MODPATH/post-fs-data.sh 0 0 0777 0777
  set_perm $MODPATH/high-perf-dac.sh 0 0 0777 0777
}
model=$(getprop ro.product.system.model 2>/dev/null)
release=$(getprop ro.system.build.version.release 2>/dev/null)
hardware=$(getprop ro.hardware 2>/dev/null)
high_perf_dac() {
cleanup
ui_print ""
ui_print "    ╭━━┳╮╭╮╱╱╱╱╭━━╮ "
ui_print "    ┃╭╮┃┣╋╋┳┳━╮┃━━╋┳┳━┳━┳┳╮ "
ui_print "    ┃┣┫┃━┫┃╭┫╋╰╋━━┃┃┃╋┃┻┫╭╯ "
ui_print "    ╰╯╰┻┻┻┻╯╰━━┻━━┻━┫╭┻━┻╯ "
ui_print "    ╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╰╯ "
ui_print ""
ui_print "× Device: ${model}"
ui_print "× Android: ${release}"
ui_print "× Hardware: ${hardware}"
ui_print ""
permissions
if [ "${hardware}" == "qcom" ]; then
  ui_print "• Installing High Performance DAC, ✓ Qualcomm Detected"
  ui_print ""
else
  ui_print "• Installation High Performance DAC, ! Failed Kernel Not Supported"
  ui_print ""
  abort
fi
}
high_perf_dac
if [ ! -d $MOUNT/high_perf_dac ]; then
     mkdir -p $MOUNT/high_perf_dac
fi

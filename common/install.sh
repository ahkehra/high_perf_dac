ui_print ""
ui_print "    ╭━━┳╮╭╮╱╱╱╱╭━━╮ "
ui_print "    ┃╭╮┃┣╋╋┳┳━╮┃━━╋┳┳━┳━┳┳╮ "
ui_print "    ┃┣┫┃━┫┃╭┫╋╰╋━━┃┃┃╋┃┻┫╭╯ "
ui_print "    ╰╯╰┻┻┻┻╯╰━━┻━━┻━┫╭┻━┻╯ "
ui_print "    ╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╰╯ "
ui_print ""
ui_print "- Device: $(getprop ro.product.system.model)"
ui_print "- Android: $(getprop ro.system.build.version.release)"
ui_print "- Hardware: $(getprop ro.hardware)"
ui_print ""
if [ "$(getprop ro.hardware 2>/dev/null)" == "qcom" ]; then
  ui_print "- Installing High Performance DAC, Qualcomm Detected"
  sed -i '/description=null/s/.*/description=Enable High Performance DAC of Qualcomms WCD9xx DAC to maximize its power and get the best audio quality possible./' $MODPATH/module.prop
  ui_print ""
else
  if [ ! -d /sys/kernel/sound_control ]; then
  ui_print "- Installation Sound Boost, Failed Kernel Not Supported"
  ui_print ""
  abort
  else
  ui_print "- Installing Sound Boost, Kernel Supported"
  sed -i '/$MODDIR/high-perf-dac.sh/s/.*/#$MODDIR/high-perf-dac.sh/' $MODPATH/post-fs-data.sh
  sed -i '/description=null/s/.*/description=Enable Sound Boost of Kernel./' $MODPATH/module.prop
  rm -rf $MODPATH/high-perf-dac.sh
  ui_print ""
  fi
fi

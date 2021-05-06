HW=$(getprop ro.hardware 2>/dev/null)
persona=qcom
ui_print ""
ui_print "    ╭━━┳╮╭╮╱╱╱╱╭━━╮ "
ui_print "    ┃╭╮┃┣╋╋┳┳━╮┃━━╋┳┳━┳━┳┳╮ "
ui_print "    ┃┣┫┃━┫┃╭┫╋╰╋━━┃┃┃╋┃┻┫╭╯ "
ui_print "    ╰╯╰┻┻┻┻╯╰━━┻━━┻━┫╭┻━┻╯ "
ui_print "    ╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╰╯ "
ui_print ""
case "$persona" in
 "$HW")
  sound=mode
 ;; 
esac
ui_print "- Device: $(getprop ro.product.system.model)"
ui_print "- Android: $(getprop ro.system.build.version.release)"
ui_print "- Hardware: $(getprop ro.hardware)"
ui_print ""
if [ "$sound" == "mode" ]; then
  ui_print "- Installing High Performance DAC, Qualcomm Detected ✓"
  ui_print ""
  ui_print "- NOTE:"
  ui_print "• High Performance DAC Still Bug For Other Devices."
  ui_print "• Let Me Know If You Face Any Issues."
  ui_print ""
  rm -rf /data/high_perf_dac && mkdir -p /data/high_perf_dac
else
  ui_print "- Installation High Performance DAC, Failed Wrong Hardware Detected !"
  ui_print ""
  abort
fi

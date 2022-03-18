SKIPUNZIP=1
MODLOG=/storage/emulated/0/high_perf_mode.log
MODEL=$(getprop ro.product.system.model 2>/dev/null)
RELEASE=$(getprop ro.system.build.version.release 2>/dev/null)
HARDWARE=$(getprop ro.hardware 2>/dev/null)
RM_RF() {
rm -rf $MODLOG 2>/dev/null
rm -rf $MODPATH/changelog.txt 2>/dev/null
rm -rf $MODPATH/LICENSE 2>/dev/null
rm -rf $MODPATH/README.md 2>/dev/null
}
SET_PERMISSION() {
set_perm_recursive $MODPATH 0 0 0755 0644
set_perm $MODPATH/service.sh 0 0 0777 0777
}
MOD_EXTRACT() {
ui_print "- Extracting module files"
unzip -o "$ZIPFILE" module.prop -d $MODPATH >&2
unzip -o "$ZIPFILE" service.sh -d $MODPATH >&2
}
MOD_FUNCTION() {
if [ "$HARDWARE" == "qcom" ]; then
  ui_print ""
  ui_print "• Installing High Performance DAC, ✓ Qualcomm Detected"
  ui_print ""
  RM_RF
  SET_PERMISSION
else
  ui_print ""
  ui_print "• Installation High Performance DAC, ! Failed Kernel Not Supported"
  ui_print ""
  abort
fi
}
MOD_PRINT() {
ui_print ""
ui_print " ╭━━┳╮╭╮╱╱╱╱╭━━╮ "
ui_print " ┃╭╮┃┣╋╋┳┳━╮┃━━╋┳┳━┳━┳┳╮ "
ui_print " ┃┣┫┃━┫┃╭┫╋╰╋━━┃┃┃╋┃┻┫╭╯ "
ui_print " ╰╯╰┻┻┻┻╯╰━━┻━━┻━┫╭┻━┻╯ "
ui_print " ╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╰╯ "
ui_print ""
ui_print "• Device : $MODEL"
ui_print "• Android : $RELEASE"
ui_print "• Hardware : $HARDWARE"
ui_print ""
MOD_EXTRACT
MOD_FUNCTION
}
set -x
MOD_PRINT


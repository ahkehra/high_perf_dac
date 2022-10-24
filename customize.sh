SKIPUNZIP=1
MODLOG="/storage/emulated/0/high_perf_dac.log"
CODENAME=$(grep_prop Codename $MODPATH/module.prop 2>/dev/null)
MODEL=$(getprop ro.product.system.model 2>/dev/null)
RELEASE=$(getprop ro.system.build.version.release 2>/dev/null)
HARDWARE=$(getprop ro.hardware 2>/dev/null)
REMOVE() {
rm -rf $MODLOG 2>/dev/null
rm -rf $MODPATH/changelog.txt 2>/dev/null
rm -rf $MODPATH/LICENSE 2>/dev/null
rm -rf $MODPATH/README.md 2>/dev/null
}
PERMISSION() {
set_perm_recursive $MODPATH 0 0 0755 0644
set_perm $MODPATH/post-fs-data.sh 0 0 0777 0777
}
EXTRACT() {
ui_print "- Extracting module files"
unzip -o "$ZIPFILE" module.prop -d $MODPATH >&2
unzip -o "$ZIPFILE" post-fs-data.sh -d $MODPATH >&2
}
FUNCTION() {
if [ "$HARDWARE" == "qcom" ]; then
  ui_print ""
  ui_print "• Installing High Performance DAC, ✓ Qualcomm Detected"
  ui_print ""
  REMOVE
  PERMISSION
else
  ui_print ""
  ui_print "• Installation High Performance DAC, ! Failed because your Kernel is Not Supported"
  ui_print ""
  abort
fi
}
PRINT() {
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
EXTRACT
ui_print "• Codename : $CODENAME"
FUNCTION
}
set -x
PRINT

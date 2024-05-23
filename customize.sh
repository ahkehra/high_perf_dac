remove() {
rm -rf $MODLOG 2>/dev/null
rm -rf $MODPATH/changelog.txt 2>/dev/null
rm -rf $MODPATH/LICENSE 2>/dev/null
rm -rf $MODPATH/README.md 2>/dev/null
}
permission() {
set_perm_recursive $MODPATH 0 0 0755 0644
set_perm $MODPATH/service.sh 0 0 0777 0777
}
extract() {
ui_print "- Extracting module files"
unzip -o "$ZIPFILE" module.prop -d $MODPATH >&2
unzip -o "$ZIPFILE" service.sh -d $MODPATH >&2
}
detect() {
! [ "$HARDWARE" == "*Qualcomm*" ] && abort "- ! Shit MTK Detected, Failed"
! [ "$FILE1" && "$FILE2" && "$FILE3" ] && abort "- ! Failed because your Kernel is Not Supported"
}
print() {
ui_print ""
ui_print "• Device : $MODEL"
ui_print "• Android : $RELEASE"
ui_print "• Hardware : $HARDWARE"
ui_print ""
extract
ui_print "• Codename : $CODENAME"
detect
}

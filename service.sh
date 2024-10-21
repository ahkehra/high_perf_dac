#!/system/bin/sh
# Do not remove credit if you're using a part of this mod to your!
# writing, logging, and mode enabling
process_modes() {
    # Variables
    local l1="$1" l2="$2" l3="$3" l4="$4" mlog="/data/akera/high_perf_dac.txt" d=$(date +"%d-%m-%Y %r") \
    cn=$(grep_prop Codename "$l1/module.prop" 2>/dev/null) m=$(getprop ro.product.system.model 2>/dev/null) \
    r=$(getprop ro.system.build.version.release 2>/dev/null) hw=$(grep 'Hardware' /proc/cpuinfo 2>/dev/null)

    # Logging helper function
    _l() { echo "$1" >> "$mlog"; }

    # Write helper
    _w() { [ -w "$1" ] && echo "$2" > "$1" 2>/dev/null || return 1; }

    # Init log
    { 
        _l "# Device: $m"; _l "# Android: $r"; _l "# Hardware: $hw"; _l "# Codename: $cn"
        _l "×---------------------------------------------------×"
    } > "$mlog"

    # Paths and Checks
    for p in high_perf_mode cpe_debug_mode impedance_detect_en; do
        f=$(find /sys/module -name "$p") || f=""
        [ -n "$f" ] && _w "$f" 1 && _l "✓ $p enabled | $d" || _l "! $p file not found | $d"
    done
}

# Ensure root permissions, and execute function
[ "$(id -u)" = "0" ] && process_modes "$MODDIR" "$MODLOG" "$MODDATE" "$CODENAME" || { echo "Root required."; exit 1; }

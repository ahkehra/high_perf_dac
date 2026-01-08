### Overview

High Performance DAC is a kernel-level tuning module for Qualcomm-based Android devices that attempts to enable available high-performance operating paths of WCD9xx family audio codecs. These codecs support multiple power and performance states, but OEM kernels often prioritize battery efficiency over audio stability and consistency.

This module does **not** add new features, digital signal processing, or software amplification. It only interacts with **existing kernel-exposed parameters** when they are present and writable.

---

### Background

Most Qualcomm smartphones use audio codecs from the WCD9xx series (for example WCD9335, WCD9340, WCD9370). These codecs are designed with configurable operating paths that balance:

* Power consumption
* Latency
* Output stability
* Thermal limits

To meet battery life and thermal targets, OEM kernels typically enable aggressive audio power management. While effective for efficiency, this can introduce:

* Rapid DAC power gating
* Inconsistent gain behavior
* Increased latency under load
* Transient distortion in specific scenarios

Qualcomm kernel sources include support for higher-performance or diagnostic audio modes intended primarily for development, testing, or specialized use cases. Whether these modes are exposed or functional depends entirely on the kernel implementation.

---

### What This Module Does

When supported by the kernel, the module attempts to:

* Enable available high-performance or non-low-power audio paths
* Reduce overly aggressive audio power saving behavior
* Stabilize DAC operating states during playback

All changes are performed through simple sysfs writes to **existing kernel parameters**.

No parameters are created, forced, or injected into the kernel.

---

### What This Module Does NOT Do

* No equalization or sound tuning
* No artificial volume amplification
* No DSP modification
* No guarantee of audible improvement
* No effect on devices without kernel support

Any audible difference is the result of altered hardware operating behavior, not software enhancement.

---

### Kernel Support Requirement

This module **requires explicit kernel support**.

Typical parameters, when available, may include:

* High-performance or performance-mode audio flags
* Audio power management toggles
* Codec diagnostic or development switches

If a parameter does not exist or is ignored by the kernel, the module will have **no effect**.

You can verify kernel support manually by inspecting:

```
/sys/module/*/parameters/
```

---

### Why These Controls May Be Missing or Removed

Not all kernels expose high-performance audio controls, and in many cases their absence is intentional.

High-performance audio modes often reduce or disable power gating, keep clocks active longer, and prioritize latency and stability over efficiency. While this can benefit certain use cases, it also results in:

* Higher power consumption
* Reduced standby battery life
* Increased thermal load
* Potential long-term hardware stress

For this reason, many such controls are intended for development or diagnostic use rather than daily consumer operation.

Depending on kernel design decisions, these controls may be:

* Never exposed to userspace
* Compiled out of production builds
* Present but disconnected from runtime logic
* Explicitly removed during kernel optimization

As Android versions evolve and efficiency requirements tighten, kernel developers frequently remove or lock these controls to ensure predictable power usage and consistent behavior across devices.

The absence of these parameters does **not** indicate missing hardware capability. It reflects a deliberate trade-off favoring battery life, thermal safety, and long-term reliability.

This module respects those decisions. If a kernel does not expose a given control, the module will not attempt to recreate or bypass it.

---

### Regarding Stock Kernels

Stock kernels **may or may not** expose high-performance audio controls.

Some OEM stock kernels leave certain diagnostic or performance-oriented audio parameters accessible, either intentionally or as a byproduct of vendor development builds. In other cases, the same parameters are locked, ignored, or removed entirely in release kernels to meet battery life, thermal, and certification requirements.

Because of this:

* A stock kernel can sometimes support this module
* Another stock kernel on a similar device may not
* Custom kernels are not guaranteed to support it either

Kernel behavior varies across:

* OEMs
* SoC revisions
* Android versions
* Kernel branches

This variability is normal and expected. Module effectiveness should be evaluated on a per-kernel basis rather than by device model or ROM name.

---

### Device Compatibility

* Qualcomm SoC devices only
* WCD9xx family audio codecs
* Stock and custom kernels may behave differently
* Same device model does not guarantee identical behavior

Compatibility is **kernel-specific**, not device-name-specific.

---

### Installation

1. Flash the module using any compatible module manager
2. Reboot

During boot, the module checks for supported parameters and applies changes only when possible.

---

### Verification

Advanced users may verify changes by checking sysfs values before and after boot:

```
cat /sys/module/*/parameters/<parameter_name>
```

If no parameters are found or values remain unchanged, the kernel does not support the feature.

---

### Side Effects

* Increased battery consumption
* Possible thermal impact under extended playback
* Potential instability on poorly implemented kernels

If issues occur, disable or remove the module.

---

### Disclaimer

This module modifies low-level kernel parameters that affect audio hardware behavior.
Use at your own risk.

The author (Akera) is not responsible for device damage, instability, data loss, or reduced battery life resulting from its use.

---

### Final Notes

This project prioritizes accuracy over exaggeration.

If your kernel exposes meaningful audio performance controls, this module may improve stability or consistency. If it does not, the module will do nothing.

That behavior is expected.

---

### Support

If you find this project useful, consider supporting its development.
Contributions through bug reports, testing, or pull requests are always appreciated and help improve the module over time.
Optional financial support can be provided via:

* UPI: `ahkehra@oksbi`
* PayPal: `paypal.me/ahkehra`

Thank you for your support.

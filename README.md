# lineageos-bullhead-build
Unofficial LineageOS 15.1 builds for Google Nexus 5X "bullhead" devices.

Build was created following the official generic auto-generated
LineageOS wiki instructions specific to the bullhead device:

https://wiki.lineageos.org/devices/bullhead/build

Source code is the official
[lineage-15.1 branch of the LineageOS repo](https://github.com/LineageOS/android/tree/lineage-15.1).

**Use at your own risk!**

> WARNING: Upgrading your device from the official LineageOS builds
> to the unofficial builds requires **wiping the data partition** because
> of the different (test) signing key. There is an alternate migrating
> method, take a note on [signing builds](https://wiki.lineageos.org/signing_builds.html).

Installing the latest radio and bootloader img is recommended.
It is available in the latest official
[bullhead factory image zip](https://developers.google.com/android/images#bullhead).

Flashing by fastboot:

```
fastboot flash bootloader bootloader-bullhead-bhz32c.img
fastboot reboot-bootloader
fastboot flash radio radio-bullhead-m8994f-2.6.42.5.03.img
fastboot reboot-bootloader
```

Installation method of the release zip package is recommended
by adb sideloading (as described in the
[original LineageOS bullhead install instructions](https://wiki.lineageos.org/devices/bullhead/install)).

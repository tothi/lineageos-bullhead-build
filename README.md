# lineageos-bullhead-build
Unofficial automated LineageOS 15.1 builds (and releases) for Google Nexus 5X "bullhead" devices.

Builds and upcoming releases are **scheduled weekly**.

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

Once the system is in the unofficial branch,
upgrades could be performed easily by simply downloading the release
zip package, rebooting in [TWRP recovery](https://twrp.me/lg/lgnexus5x.html)
and simply installing (tested with TWRP 3.2.3-0).

$(call inherit-product, build/target/product/full_base.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/thunderg/overlay

TARGET_PREBUILT_KERNEL := device/lge/thunderg/kernel

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/lge/thunderg/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_PACKAGES += \
    librs_jni \
    libmm-omxcore \
    libOmxCore \
    gps.thunderg \
    lights.thunderg \
    copybit.thunderg \
    bdaddr_read \
    bash

PRODUCT_PACKAGES += \
    flash_image \
    dump_image \
    erase_image \
    e2fsck \
    SpareParts

DISABLE_DEXPREOPT := false

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Keylayouts
PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/thunder_keypad.kl:system/usr/keylayout/thunder_keypad.kl \
    device/lge/thunderg/files/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    device/lge/thunderg/files/thunder_keypad.kcm.bin:system/usr/keychars/thunder_keypad.kcm.bin \

# Board-specific init (does not support charging in "power off" state yet)
PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/init.thunderg.rc:root/init.thunderg.rc \
    device/lge/thunderg/files/initlogo.rle:root/initlogo.rle \
    device/lge/thunderg/files/ueventd.thunderg.rc:root/ueventd.thunderg.rc \
    device/lge/thunderg/files/etc/init.local.rc:/system/etc/init.local.rc

# Wifi
PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/lib/modules/wireless.ko:system/lib/modules/wireless.ko \
    device/lge/thunderg/files/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/lge/thunderg/files/etc/dhcpd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \

PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/lib/modules/tun.ko:system/lib/modules/tun.ko \
    device/lge/thunderg/files/lib/modules/cifs.ko:system/lib/modules/cifs.ko \

# SD Card
PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/etc/vold.fstab:system/etc/vold.fstab \
    device/lge/thunderg/files/bin/make-storage.sh:system/bin/make-storage.sh \
    device/lge/thunderg/files/bin/make-adb.sh:system/bin/make-adb.sh \

# Audio
PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/lge/thunderg/files/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \

# Device permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \

PRODUCT_PROPERTY_OVERRIDES += \
    ro.lge.vibrator_amp=125 \
    ro.sf.lcd_density=160 \

# Move dalvik-cache to /data
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-data-only=1 \

PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/etc/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_LOCALES += mdpi

$(call inherit-product, device/common/gps/gps_eu_supl.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_thunderg
PRODUCT_BRAND := LGE
PRODUCT_DEVICE := thunderg
PRODUCT_MODEL := LG-P500
PRODUCT_MANUFACTURER := LGE
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=thunderg

$(call inherit-product, build/target/product/full_base.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/thunderg/overlay

TARGET_PREBUILT_KERNEL := device/lge/thunderg/kernel_test
#TARGET_PREBUILT_KERNEL := device/lge/thunderg/kernel_xionia

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
    gadget_id \
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
    device/lge/thunderg/files/init.rc:root/init.rc \
    device/lge/thunderg/files/initlogo.rle:root/initlogo.rle \
    device/lge/thunderg/files/ueventd.thunderg.rc:root/ueventd.thunderg.rc \
    device/lge/thunderg/files/etc/init.local.rc:/system/etc/init.local.rc

# 2D (using proprietary because of poor perfomance of open source libs)
PRODUCT_COPY_FILES += \
    vendor/lge/thunderg/proprietary/lib/hw/gralloc.default.so:system/lib/hw/gralloc.default.so \
    vendor/lge/thunderg/proprietary/lib/hw/gralloc.thunderg.so:system/lib/hw/gralloc.thunderg.so \

# Sensors
PRODUCT_COPY_FILES += \
    vendor/lge/thunderg/proprietary/lib/hw/sensors.thunderg.so:system/lib/hw/sensors.thunderg.so \
    vendor/lge/thunderg/proprietary/bin/ami304d:system/bin/ami304d \

# 3D
PRODUCT_COPY_FILES += \
    vendor/lge/thunderg/proprietary/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    vendor/lge/thunderg/proprietary/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    vendor/lge/thunderg/proprietary/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    vendor/lge/thunderg/proprietary/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    vendor/lge/thunderg/proprietary/lib/libgsl.so:system/lib/libgsl.so \
    vendor/lge/thunderg/proprietary/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    vendor/lge/thunderg/proprietary/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \

# Camera
PRODUCT_COPY_FILES += \
    vendor/lge/thunderg/proprietary/lib/liboemcamera.so:system/lib/liboemcamera.so \
    vendor/lge/thunderg/proprietary/lib/libmmipl.so:system/lib/libmmipl.so \
    vendor/lge/thunderg/proprietary/lib/libmmjpeg.so:system/lib/libmmjpeg.so \


# Wifi
PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/lib/modules/wireless.ko:system/lib/modules/wireless.ko \
    device/lge/thunderg/files/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    vendor/lge/thunderg/proprietary/etc/wl/nvram.txt:system/etc/wl/nvram.txt \
    device/lge/thunderg/files/etc/dhcpd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    vendor/lge/thunderg/proprietary/etc/wl/rtecdc.bin:system/etc/wl/rtecdc.bin \
    vendor/lge/thunderg/proprietary/etc/wl/rtecdc-apsta.bin:system/etc/wl/rtecdc-apsta.bin \
    vendor/lge/thunderg/proprietary/etc/wl/rtecdc-mfgtest.bin:system/etc/wl/rtecdc-mfgtest.bin

# SD Card
PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/etc/vold.fstab:system/etc/vold.fstab \

# Audio
PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    vendor/lge/thunderg/proprietary/lib/liba2dp.so:system/lib/liba2dp.so \
    vendor/lge/thunderg/proprietary/lib/libaudioeq.so:system/lib/libaudioeq.so \
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

# LGE services
PRODUCT_COPY_FILES += \
    vendor/lge/thunderg/proprietary/bin/qmuxd:system/bin/qmuxd \

# rmt_storage (What is this?)
PRODUCT_COPY_FILES += \
    vendor/lge/thunderg/proprietary/bin/rmt_storage:system/bin/rmt_storage \

# port-bridge (What is this?)
PRODUCT_COPY_FILES += \
    vendor/lge/thunderg/proprietary/bin/port-bridge:system/bin/port-bridge \

# wipeirface (What is this?)
PRODUCT_COPY_FILES += \
    vendor/lge/thunderg/proprietary/bin/wiperiface:system/bin/wiperiface \

# Touchscreen firmware updater
PRODUCT_COPY_FILES += \
    vendor/lge/thunderg/proprietary/bin/tsdown:system/bin/tsdown \
    vendor/lge/thunderg/proprietary/etc/MELFAS_FIRM.bin:system/etc/MELFAS_FIRM.bin \

# netmgr (What is this?)
PRODUCT_COPY_FILES += \
    vendor/lge/thunderg/proprietary/bin/netmgrd:system/bin/netmgrd \
    vendor/lge/thunderg/proprietary/lib/libdsutils.so:system/lib/libdsutils.so \
    vendor/lge/thunderg/proprietary/lib/libnetmgr.so:system/lib/libnetmgr.so


PRODUCT_PROPERTY_OVERRIDES += \
    ro.lge.vibrator_amp=125 \
    ro.sf.lcd_density=160 \

# Move dalvik-cache to /data
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-data-only=1 \

# RIL
PRODUCT_COPY_FILES += \
    vendor/lge/thunderg/proprietary/lib/libril-qc-1.so:system/lib/libril-qc-1.so \
    vendor/lge/thunderg/proprietary/lib/liboncrpc.so:system/lib/liboncrpc.so \
    vendor/lge/thunderg/proprietary/lib/libdsm.so:system/lib/libdsm.so \
    vendor/lge/thunderg/proprietary/lib/libqueue.so:system/lib/libqueue.so \
    vendor/lge/thunderg/proprietary/lib/libdiag.so:system/lib/libdiag.so \
    vendor/lge/thunderg/proprietary/lib/libauth.so:system/lib/libauth.so \
    vendor/lge/thunderg/proprietary/lib/libcm.so:system/lib/libcm.so \
    vendor/lge/thunderg/proprietary/lib/libnv.so:system/lib/libnv.so \
    vendor/lge/thunderg/proprietary/lib/libpbmlib.so:system/lib/libpbmlib.so \
    vendor/lge/thunderg/proprietary/lib/libwms.so:system/lib/libwms.so \
    vendor/lge/thunderg/proprietary/lib/libwmsts.so:system/lib/libwmsts.so \
    vendor/lge/thunderg/proprietary/lib/libmmgsdilib.so:system/lib/libmmgsdilib.so \
    vendor/lge/thunderg/proprietary/lib/libgsdi_exp.so:system/lib/libgsdi_exp.so \
    vendor/lge/thunderg/proprietary/lib/libgstk_exp.so:system/lib/libgstk_exp.so \
    vendor/lge/thunderg/proprietary/lib/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so \
    vendor/lge/thunderg/proprietary/lib/liboem_rapi.so:system/lib/liboem_rapi.so \
    vendor/lge/thunderg/proprietary/lib/libsnd.so:system/lib/libsnd.so \
    vendor/lge/thunderg/proprietary/lib/libqmi.so:system/lib/libqmi.so \
    vendor/lge/thunderg/proprietary/lib/libdll.so:system/lib/libdll.so \
    vendor/lge/thunderg/proprietary/lib/liblgeat.so:system/lib/liblgeat.so \
    vendor/lge/thunderg/proprietary/lib/liblgdrm.so:system/lib/liblgdrm.so \
    vendor/lge/thunderg/proprietary/lib/liblgdrmwbxml.so:system/lib/liblgdrmwbxml.so \
    vendor/lge/thunderg/proprietary/lib/liblgerft.so:system/lib/liblgerft.so \
    vendor/lge/thunderg/proprietary/lib/libbcmwl.so:system/lib/libbcmwl.so \
    vendor/lge/thunderg/proprietary/lib/libdss.so:system/lib/libdss.so \
    vendor/lge/thunderg/proprietary/bin/rild:system/bin/rild \

# propietary libril
PRODUCT_COPY_FILES += \
    vendor/lge/thunderg/proprietary/lib/libril.so:system/lib/libril.so \

# OMX
PRODUCT_COPY_FILES += \
    vendor/lge/thunderg/proprietary/lib/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    vendor/lge/thunderg/proprietary/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so \
    vendor/lge/thunderg/proprietary/lib/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \
    vendor/lge/thunderg/proprietary/lib/libOmxAdpcmDec.so:system/lib/libOmxAdpcmDec.so \
    vendor/lge/thunderg/proprietary/lib/libOmxAmrDec.so:system/lib/libOmxAmrDec.so \
    vendor/lge/thunderg/proprietary/lib/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \
    vendor/lge/thunderg/proprietary/lib/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so \
    vendor/lge/thunderg/proprietary/lib/libOmxAmrwbDec.so:system/lib/libOmxAmrwbDec.so \
    vendor/lge/thunderg/proprietary/lib/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so \
    vendor/lge/thunderg/proprietary/lib/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \
    vendor/lge/thunderg/proprietary/lib/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    vendor/lge/thunderg/proprietary/lib/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \
    vendor/lge/thunderg/proprietary/lib/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
    vendor/lge/thunderg/proprietary/lib/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \
    vendor/lge/thunderg/proprietary/lib/libOmxQcelpDec.so:system/lib/libOmxQcelpDec.so \
    vendor/lge/thunderg/proprietary/lib/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \
    vendor/lge/thunderg/proprietary/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
    vendor/lge/thunderg/proprietary/lib/libOmxWmvDec.so:system/lib/libOmxWmvDec.so \
#    vendor/lge/thunderg/proprietary/lib/libomx_aacdec_sharedlibrary.so:system/lib/libomx_aacdec_sharedlibrary.so \
#    vendor/lge/thunderg/proprietary/lib/libomx_amrdec_sharedlibrary.so:system/lib/libomx_amrdec_sharedlibrary.so \
#    vendor/lge/thunderg/proprietary/lib/libomx_amrenc_sharedlibrary.so:system/lib/libomx_amrenc_sharedlibrary.so \
#    vendor/lge/thunderg/proprietary/lib/libomx_avcdec_sharedlibrary.so:system/lib/libomx_avcdec_sharedlibrary.so \
#    vendor/lge/thunderg/proprietary/lib/libomx_m4vdec_sharedlibrary.so:system/lib/libomx_m4vdec_sharedlibrary.so \
#    vendor/lge/thunderg/proprietary/lib/libomx_mp3dec_sharedlibrary.so:system/lib/libomx_mp3dec_sharedlibrary.so \
#    vendor/lge/thunderg/proprietary/lib/libomx_nextreaming_divxdec_sharedlibrary.so:system/lib/libomx_nextreaming_divxdec_sharedlibrary.so \
#    vendor/lge/thunderg/proprietary/lib/libomx_nextreaming_wmadec_sharedlibrary.so:system/lib/libomx_nextreaming_wmadec_sharedlibrary.so \
#    vendor/lge/thunderg/proprietary/lib/libomx_nextreaming_wmvdec_sharedlibrary.so:system/lib/libomx_nextreaming_wmvdec_sharedlibrary.so \
#    vendor/lge/thunderg/proprietary/lib/libomx_sharedlibrary.so:system/lib/libomx_sharedlibrary.so \
#    vendor/lge/thunderg/proprietary/lib/libopencore_author.so:system/lib/libopencore_author.so \
#    vendor/lge/thunderg/proprietary/lib/libopencore_player.so:system/lib/libopencore_player.so \
#    vendor/lge/thunderg/proprietary/lib/libopencore_mp4local.so:system/lib/libopencore_mp4local.so \
#    vendor/lge/thunderg/proprietary/lib/libopencore_mp4localreg.so:system/lib/libopencore_mp4localreg.so \
#    vendor/lge/thunderg/proprietary/lib/libopencorehw.so:system/lib/libopencorehw.so \

# Bluetooth
PRODUCT_COPY_FILES += \
    vendor/lge/thunderg/proprietary/bin/BCM4325D1_004.002.004.0218.0248.hcd:system/bin/BCM4325D1_004.002.004.0218.0248.hcd \

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

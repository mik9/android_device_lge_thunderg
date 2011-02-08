#$(call inherit-product, build/target/product/full.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/thunderg/overlay

TARGET_PREBUILT_KERNEL := device/lge/thunderg/kernel_test

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
    brcm_patchram_plus \
    libaudio.thunderg \
    gps.thunderg


# GPS
PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/etc/loc_parameter.ini:system/etc/loc_parameter.ini \
    device/lge/thunderg/files/lib/librpc.so:system/lib/librpc.so \
    device/lge/thunderg/files/lib/libloc_api.so:system/lib/libloc_api.so \
    device/lge/thunderg/files/lib/libgps.so:system/lib/libgps.so \
    device/lge/thunderg/files/lib/libloc.so:system/lib/libloc.so \
    device/lge/thunderg/files/lib/libloc.so:obj/lib/libloc.so \
    device/lge/thunderg/files/lib/libcommondefs.so:system/lib/libcommondefs.so \
    device/lge/thunderg/files/lib/libloc-rpc.so:system/lib/libloc-rpc.so \

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
    device/lge/thunderg/files/init.qcom.post_boot.sh:root/init.qcom.post_boot.sh \
#    device/lge/thunderg/files/fota.rc:root/fota.rc \
#    device/lge/thunderg/files/init.lge.hidden_reset.sh:root/init.lge.hidden_reset.sh \
#    device/lge/thunderg/files/chargerlogo:root/sbin/chargerlogo \
#    device/lge/thunderg/files/ftm_power:root/sbin/ftm_power \
#    device/lge/thunderg/files/bootlogo:root/sbin/bootlogo \
#    device/lge/thunderg/files/chargerimages/battery_ani_01.rle:root/chargerimages/battery_ani_01.rle \
#    device/lge/thunderg/files/chargerimages/battery_ani_02.rle:root/chargerimages/battery_ani_02.rle \
#    device/lge/thunderg/files/chargerimages/battery_ani_03.rle:root/chargerimages/battery_ani_03.rle \
#    device/lge/thunderg/files/chargerimages/battery_ani_04.rle:root/chargerimages/battery_ani_04.rle \
#    device/lge/thunderg/files/chargerimages/battery_ani_05.rle:root/chargerimages/battery_ani_05.rle \
#    device/lge/thunderg/files/chargerimages/battery_bg.rle:root/chargerimages/battery_bg.rle \
#    device/lge/thunderg/files/chargerimages/battery_charging_01.rle:root/chargerimages/battery_charging_01.rle \
#    device/lge/thunderg/files/chargerimages/battery_charging_02.rle:root/chargerimages/battery_charging_02.rle \
#    device/lge/thunderg/files/chargerimages/battery_charging_03.rle:root/chargerimages/battery_charging_03.rle \
#    device/lge/thunderg/files/chargerimages/battery_charging_04.rle:root/chargerimages/battery_charging_04.rle \
#    device/lge/thunderg/files/chargerimages/battery_charging_05.rle:root/chargerimages/battery_charging_05.rle \
#    device/lge/thunderg/files/chargerimages/battery_charging_06.rle:root/chargerimages/battery_charging_06.rle \
#    device/lge/thunderg/files/chargerimages/battery_wait_ani_01.rle:root/chargerimages/battery_wait_ani_01.rle \
#    device/lge/thunderg/files/chargerimages/battery_wait_ani_02.rle:root/chargerimages/battery_wait_ani_02.rle \
#    device/lge/thunderg/files/chargerimages/black_bg.rle:root/chargerimages/black_bg.rle \
#    device/lge/thunderg/files/bootimages/opening_01.rle:root/bootimages/opening_01.rle \
#    device/lge/thunderg/files/bootimages/opening_02.rle:root/bootimages/opening_02.rle \
#    device/lge/thunderg/files/bootimages/opening_03.rle:root/bootimages/opening_03.rle \
#    device/lge/thunderg/files/bootimages/opening_04.rle:root/bootimages/opening_04.rle \
#    device/lge/thunderg/files/bootimages/opening_05.rle:root/bootimages/opening_05.rle \
#    device/lge/thunderg/files/bootimages/opening_06.rle:root/bootimages/opening_06.rle \
#    device/lge/thunderg/files/init.rc:root/init.rc \

# Backlight
PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/lib/hw/lights.thunderg.so:system/lib/hw/lights.thunderg.so \

# 2D (using proprietary because of poor perfomance of open source libs)
PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/lib/hw/gralloc.default.so:system/lib/hw/gralloc.default.so \
    device/lge/thunderg/files/lib/hw/gralloc.thunderg.so:system/lib/hw/gralloc.thunderg.so \
    device/lge/thunderg/files/lib/hw/copybit.thunderg.so:system/lib/hw/copybit.thunderg.so \

# Sensors
PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/lib/hw/sensors.thunderg.so:system/lib/hw/sensors.thunderg.so \
    device/lge/thunderg/files/bin/ami304d:system/bin/ami304d \

# 3D
PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    device/lge/thunderg/files/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    device/lge/thunderg/files/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    device/lge/thunderg/files/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    device/lge/thunderg/files/lib/libgsl.so:system/lib/libgsl.so \
    device/lge/thunderg/files/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    device/lge/thunderg/files/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \

# Camera
PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/lib/liboemcamera.so:system/lib/liboemcamera.so \
    device/lge/thunderg/files/lib/libmmipl.so:system/lib/libmmipl.so \
    device/lge/thunderg/files/lib/libmmjpeg.so:system/lib/libmmjpeg.so \

# Wifi
PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/lib/modules/wireless.ko:system/lib/modules/wireless.ko \
    device/lge/thunderg/files/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/lge/thunderg/files/etc/wl/nvram.txt:system/etc/wl/nvram.txt \
    device/lge/thunderg/files/etc/dhcpd/dhcpcd.conf:system/etc/dhcpd/dhcpcd.conf \
    device/lge/thunderg/files/etc/wl/rtecdc.bin:system/etc/wl/rtecdc.bin \
    device/lge/thunderg/files/etc/wl/rtecdc-apsta.bin:system/etc/wl/rtecdc-apsta.bin \
    device/lge/thunderg/files/etc/wl/rtecdc-mfgtest.bin:system/etc/wl/rtecdc-mfgtest.bin

# SD Card
PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/etc/vold.fstab:system/etc/vold.fstab

# Audio
PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/lge/thunderg/files/lib/liba2dp.so:system/lib/liba2dp.so \
    device/lge/thunderg/files/lib/libaudioeq.so:system/lib/libaudioeq.so \
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
    device/lge/thunderg/files/bin/port-bridge:system/bin/port-bridge \
    device/lge/thunderg/files/bin/qmuxd:system/bin/qmuxd \
    device/lge/thunderg/files/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
    device/lge/thunderg/files/bin/rmt_storage:system/bin/rmt_storage \

# wipeirface (What is this?)
PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/bin/wiperiface:system/bin/wiperiface \
# Touchscreen firmware updater
PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/bin/tsdown:system/bin/tsdown \
    device/lge/thunderg/files/etc/MELFAS_FIRM.bin:system/etc/MELFAS_FIRM.bin \

# netmgr (What is this?)
PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/bin/netmgrd:system/bin/netmgrd \
    device/lge/thunderg/files/lib/libdsutils.so:system/lib/libdsutils.so \
    device/lge/thunderg/files/lib/libnetmgr.so:system/lib/libnetmgr.so


PRODUCT_PROPERTY_OVERRIDES += \
    ro.lge.vibrator_amp=125 \

# Move dalvik-cache to /data
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-data-only=1 \

# RIL
PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/lib/libril-qc-1.so:system/lib/libril-qc-1.so \
    device/lge/thunderg/files/lib/liboncrpc.so:system/lib/liboncrpc.so \
    device/lge/thunderg/files/lib/libdsm.so:system/lib/libdsm.so \
    device/lge/thunderg/files/lib/libqueue.so:system/lib/libqueue.so \
    device/lge/thunderg/files/lib/libdiag.so:system/lib/libdiag.so \
    device/lge/thunderg/files/lib/libauth.so:system/lib/libauth.so \
    device/lge/thunderg/files/lib/libcm.so:system/lib/libcm.so \
    device/lge/thunderg/files/lib/libnv.so:system/lib/libnv.so \
    device/lge/thunderg/files/lib/libpbmlib.so:system/lib/libpbmlib.so \
    device/lge/thunderg/files/lib/libwms.so:system/lib/libwms.so \
    device/lge/thunderg/files/lib/libwmsts.so:system/lib/libwmsts.so \
    device/lge/thunderg/files/lib/libmmgsdilib.so:system/lib/libmmgsdilib.so \
    device/lge/thunderg/files/lib/libgsdi_exp.so:system/lib/libgsdi_exp.so \
    device/lge/thunderg/files/lib/libgstk_exp.so:system/lib/libgstk_exp.so \
    device/lge/thunderg/files/lib/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so \
    device/lge/thunderg/files/lib/liboem_rapi.so:system/lib/liboem_rapi.so \
    device/lge/thunderg/files/lib/libsnd.so:system/lib/libsnd.so \
    device/lge/thunderg/files/lib/libqmi.so:system/lib/libqmi.so \
    device/lge/thunderg/files/lib/libdll.so:system/lib/libdll.so \
    device/lge/thunderg/files/lib/liblgeat.so:system/lib/liblgeat.so \
    device/lge/thunderg/files/lib/liblgdrm.so:system/lib/liblgdrm.so \
    device/lge/thunderg/files/lib/liblgdrmwbxml.so:system/lib/liblgdrmwbxml.so \
    device/lge/thunderg/files/lib/liblgerft.so:system/lib/liblgerft.so \
    device/lge/thunderg/files/lib/libbcmwl.so:system/lib/libbcmwl.so \
    device/lge/thunderg/files/lib/libdss.so:system/lib/libdss.so \
    device/lge/thunderg/files/lib/libril.so:system/lib/libril.so \
    device/lge/thunderg/files/bin/rild:system/bin/rild \

# OMX
PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/lib/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    device/lge/thunderg/files/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so \
    device/lge/thunderg/files/lib/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \
    device/lge/thunderg/files/lib/libOmxAdpcmDec.so:system/lib/libOmxAdpcmDec.so \
    device/lge/thunderg/files/lib/libOmxAmrDec.so:system/lib/libOmxAmrDec.so \
    device/lge/thunderg/files/lib/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \
    device/lge/thunderg/files/lib/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so \
    device/lge/thunderg/files/lib/libOmxAmrwbDec.so:system/lib/libOmxAmrwbDec.so \
    device/lge/thunderg/files/lib/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so \
    device/lge/thunderg/files/lib/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \
    device/lge/thunderg/files/lib/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    device/lge/thunderg/files/lib/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \
    device/lge/thunderg/files/lib/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
    device/lge/thunderg/files/lib/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \
    device/lge/thunderg/files/lib/libOmxQcelpDec.so:system/lib/libOmxQcelpDec.so \
    device/lge/thunderg/files/lib/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \
    device/lge/thunderg/files/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
    device/lge/thunderg/files/lib/libOmxWmvDec.so:system/lib/libOmxWmvDec.so \
#    device/lge/thunderg/files/lib/libomx_aacdec_sharedlibrary.so:system/lib/libomx_aacdec_sharedlibrary.so \
#    device/lge/thunderg/files/lib/libomx_amrdec_sharedlibrary.so:system/lib/libomx_amrdec_sharedlibrary.so \
#    device/lge/thunderg/files/lib/libomx_amrenc_sharedlibrary.so:system/lib/libomx_amrenc_sharedlibrary.so \
#    device/lge/thunderg/files/lib/libomx_avcdec_sharedlibrary.so:system/lib/libomx_avcdec_sharedlibrary.so \
#    device/lge/thunderg/files/lib/libomx_m4vdec_sharedlibrary.so:system/lib/libomx_m4vdec_sharedlibrary.so \
#    device/lge/thunderg/files/lib/libomx_mp3dec_sharedlibrary.so:system/lib/libomx_mp3dec_sharedlibrary.so \
#    device/lge/thunderg/files/lib/libomx_nextreaming_divxdec_sharedlibrary.so:system/lib/libomx_nextreaming_divxdec_sharedlibrary.so \
#    device/lge/thunderg/files/lib/libomx_nextreaming_wmadec_sharedlibrary.so:system/lib/libomx_nextreaming_wmadec_sharedlibrary.so \
#    device/lge/thunderg/files/lib/libomx_nextreaming_wmvdec_sharedlibrary.so:system/lib/libomx_nextreaming_wmvdec_sharedlibrary.so \
#    device/lge/thunderg/files/lib/libomx_sharedlibrary.so:system/lib/libomx_sharedlibrary.so \
#    device/lge/thunderg/files/lib/libqcomm_omx.so:system/lib/libqcomm_omx.so \
#    device/lge/thunderg/files/lib/libstagefright_omx.so:system/lib/libstagefright_omx.so \
#    device/lge/thunderg/files/lib/libopencore_common.so:system/lib/libopencore_common.so \
#    device/lge/thunderg/files/lib/libmm-omxcore.so:system/lib/libmm-omxcore.so \

# Bluetooth
PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/bin/BCM4325D1_004.002.004.0218.0248.hcd:system/bin/BCM4325D1_004.002.004.0218.0248.hcd \
    device/lge/thunderg/files/bin/btld:system/bin/btld \
    device/lge/thunderg/files/etc/bluetooth/audio.conf:system/etc/bluetooth/audio.conf \
    device/lge/thunderg/files/etc/bluetooth/auto_pairing.conf:system/etc/bluetooth/auto_pairing.conf \
    device/lge/thunderg/files/etc/bluetooth/blacklist.conf:system/etc/bluetooth/blacklist.conf \
    device/lge/thunderg/files/etc/bluetooth/input.conf:system/etc/bluetooth/input.conf \
    device/lge/thunderg/files/etc/bluetooth/main.conf:system/etc/bluetooth/main.conf \

$(call inherit-product, device/common/gps/gps_eu_supl.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_thunderg
PRODUCT_BRAND := LGE
PRODUCT_DEVICE := thunderg
PRODUCT_MODEL := LG-P500
PRODUCT_MANUFACTURER := LGE
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=thunderg

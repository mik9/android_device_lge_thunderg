$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/lge/thunderg/thunderg-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/thunderg/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/lge/thunderg/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_PACKAGES += \
	hwprops \
    libOmxCore

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_thunderg
PRODUCT_DEVICE := thunderg
PRODUCT_BRAND := LG
PRODUCT_MANUFACTURER := LGE

# Board-specific init
PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/init.thunderg.rc:root/init.thunderg.rc \
    device/lge/thunderg/files/initlogo.rle:root/initlogo.rle

# Backlight
PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/lib/hw/lights.thunderg.so:system/lib/hw/lights.thunderg.so \

# 2D
PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/lib/hw/gralloc.thunderg.so:system/lib/hw/gralloc.thunderg.so \
    device/lge/thunderg/files/lib/hw/copybit.thunderg.so:system/lib/hw/copybit.thunderg.so \

# Sensors
PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/lib/hw/sensors.thunderg.so:system/lib/hw/sensors.thunderg.so \
    device/lge/thunderg/files/bin/ami304d:system/bin/ami304d \

PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    device/lge/thunderg/files/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    device/lge/thunderg/files/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    device/lge/thunderg/files/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so

PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/lib/liboemcamera.so:system/lib/liboemcamera.so

# Wifi
PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/lib/modules/wireless.ko:system/lib/modules/wireless.ko \
    device/lge/thunderg/files/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/lge/thunderg/files/etc/wl/nvram.txt:system/etc/wl/nvram.txt \
    device/lge/thunderg/files/etc/wl/rtecdc.bin:system/etc/wl/rtecdc.bin \
    device/lge/thunderg/files/etc/wl/rtecdc-apsta.bin:system/etc/wl/rtecdc-apsta.bin \
    device/lge/thunderg/files/etc/wl/rtecdc-mfgtest.bin:system/etc/wl/rtecdc-mfgtest.bin

# SD Card
PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/etc/vold.fstab:system/etc/vold.fstab

# Audio (need to test a2dp)
PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/lge/thunderg/files/lib/liba2dp.so:system/lib/liba2dp.so \
    device/lge/thunderg/files/lib/libaudioeq.so:system/lib/libaudioeq.so

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml

# LGE services
PRODUCT_COPY_FILES += \
    device/lge/thunderg/files/bin/port-bridge:system/bin/port-bridge \
    device/lge/thunderg/files/bin/qmuxd:system/bin/qmuxd \
    device/lge/thunderg/files/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
    device/lge/thunderg/files/bin/rmt_storage:system/bin/rmt_storage \
    device/lge/thunderg/files/bin/netmgrd:system/bin/netmgrd \
    device/lge/thunderg/files/bin/wiperiface:system/bin/wiperiface \

PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libril-qc-1.so \
    rild.libargs="-d /dev/smd0" \
    ro.lge.vibrator_amp=125 \
    ro.opengles.version=131072 \
    dalvik.vm.heapsize=32m \
    ro.product.model="LG P500"

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
    device/lge/thunderg/files/lib/libmm-omxcore.so:system/lib/libmm-omxcore.so \
    device/lge/thunderg/files/lib/libomx_aacdec_sharedlibrary.so:system/lib/libomx_aacdec_sharedlibrary.so \
    device/lge/thunderg/files/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so \
    device/lge/thunderg/files/lib/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \
    device/lge/thunderg/files/lib/libOmxAdpcmDec.so:system/lib/libOmxAdpcmDec.so \
    device/lge/thunderg/files/lib/libomx_amrdec_sharedlibrary.so:system/lib/libomx_amrdec_sharedlibrary.so \
    device/lge/thunderg/files/lib/libOmxAmrDec.so:system/lib/libOmxAmrDec.so \
    device/lge/thunderg/files/lib/libomx_amrenc_sharedlibrary.so:system/lib/libomx_amrenc_sharedlibrary.so \
    device/lge/thunderg/files/lib/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \
    device/lge/thunderg/files/lib/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so \
    device/lge/thunderg/files/lib/libOmxAmrwbDec.so:system/lib/libOmxAmrwbDec.so \
    device/lge/thunderg/files/lib/libomx_avcdec_sharedlibrary.so:system/lib/libomx_avcdec_sharedlibrary.so \
    device/lge/thunderg/files/lib/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so \
    device/lge/thunderg/files/lib/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \
    device/lge/thunderg/files/lib/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    device/lge/thunderg/files/lib/libomx_m4vdec_sharedlibrary.so:system/lib/libomx_m4vdec_sharedlibrary.so \
    device/lge/thunderg/files/lib/libomx_mp3dec_sharedlibrary.so:system/lib/libomx_mp3dec_sharedlibrary.so \
    device/lge/thunderg/files/lib/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \
    device/lge/thunderg/files/lib/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
    device/lge/thunderg/files/lib/libomx_nextreaming_divxdec_sharedlibrary.so:system/lib/libomx_nextreaming_divxdec_sharedlibrary.so \
    device/lge/thunderg/files/lib/libomx_nextreaming_wmadec_sharedlibrary.so:system/lib/libomx_nextreaming_wmadec_sharedlibrary.so \
    device/lge/thunderg/files/lib/libomx_nextreaming_wmvdec_sharedlibrary.so:system/lib/libomx_nextreaming_wmvdec_sharedlibrary.so \
    device/lge/thunderg/files/lib/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \
    device/lge/thunderg/files/lib/libOmxQcelpDec.so:system/lib/libOmxQcelpDec.so \
    device/lge/thunderg/files/lib/libomx_sharedlibrary.so:system/lib/libomx_sharedlibrary.so \
    device/lge/thunderg/files/lib/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \
    device/lge/thunderg/files/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
    device/lge/thunderg/files/lib/libOmxWmvDec.so:system/lib/libOmxWmvDec.so \
    device/lge/thunderg/files/lib/libqcomm_omx.so:system/lib/libqcomm_omx.so \
    device/lge/thunderg/files/lib/libstagefright_omx.so:system/lib/libstagefright_omx.so \
    device/lge/thunderg/files/lib/libopencore_common.so:system/lib/libopencore_common.so \

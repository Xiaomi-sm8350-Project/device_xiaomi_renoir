#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8350-common
$(call inherit-product, device/xiaomi/sm8350-common/common.mk)

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info_shimaidp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_shima/audio_platform_info_shimaidp.xml \
    $(LOCAL_PATH)/audio/mixer_paths_shimaidp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_shima/mixer_paths_shimaidp.xml \
    $(LOCAL_PATH)/audio/mixer_paths_overlay_dynamic.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_shima/mixer_paths_overlay_dynamic.xml \
    $(LOCAL_PATH)/audio/mixer_paths_overlay_static.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_shima/mixer_paths_overlay_static.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths_shimaidp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_shima/sound_trigger_mixer_paths_shimaidp.xml \
    $(LOCAL_PATH)/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_shima/sound_trigger_platform_info.xml

# Display
PRODUCT_PRODUCT_PROPERTIES += \
    vendor.display.use_smooth_motion=1

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service

# Init scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.renoir.perf.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.renoir.perf.rc

# NFC
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.product.hardware.sku=nfc

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Call the proprietary setup
$(call inherit-product-if-exists, vendor/xiaomi/renoir/renoir-vendor.mk)

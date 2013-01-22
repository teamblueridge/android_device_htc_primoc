#
# Copyright (C) 2011 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# common msm7x30 configs
$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, vendor/qcom/proprietary/qcom-vendor.mk)

# The gps config appropriate for this device

PRODUCT_COPY_FILES += \
    device/htc/primoc/prebuilt/etc/gps.conf:system/etc/gps.conf

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

PRODUCT_COPY_FILES += \
    device/htc/primoc/prebuilt/root/init.primoc.rc:root/init.primoc.rc \
    device/htc/primoc/prebuilt/root/init.usb.rc:root/init.usb.rc \
    device/htc/primoc/prebuilt/root/init.rc:root/init.rc \
    device/htc/primoc/prebuilt/root/ueventd.rc:root/ueventd.rc \
    device/htc/primoc/prebuilt/root/init:root/init \
    device/htc/primoc/prebuilt/root/ueventd.primoc.rc:root/ueventd.primoc.rc

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/primoc/primoc-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r3 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    ro.sf.lcd_density=240
	
# Carrier Info
CDMA_GOOGLE_BASE := android-virgin-us
CDMA_CARRIER_ALPHA := Virgin_Mobile
CDMA_CARRIER_NUMERIC := 311490

# Property Overides for carrier
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-htc \
    ro.com.google.clientidbase.gmm=android-htc \
    ro.com.google.clientidbase.yt=$(CDMA_GOOGLE_BASE) \
    ro.com.google.clientidbase.am=$(CDMA_GOOGLE_BASE) \
    ro.com.google.clientidbase.ms=$(CDMA_GOOGLE_BASE) \
    ro.cdma.home.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    ro.cdma.home.operator.numeric=$(CDMA_CARRIER_NUMERIC) \
    gsm.sim.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    gsm.sim.operator.numeric=$(CDMA_CARRIER_NUMERIC) \
    gsm.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    gsm.operator.numeric=$(CDMA_CARRIER_NUMERIC)


# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0

ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.service.adb.enable=1

DEVICE_PACKAGE_OVERLAYS += device/htc/primoc/overlay

#GooManager OTA Support
PRODUCT_PROPERTY_OVERRIDES += \
    ro.goo.developerid=kalaker \
    ro.goo.rom=sickleromPrimoc \
    ro.goo.version=$(shell date +%s)

# GPS / Lights / Sensors
PRODUCT_PACKAGES += \
    gps.primoc \
    lights.primoc \
    sensors.primoc

# Additional packages
PRODUCT_PACKAGES += \
    Torch

# idc files
PRODUCT_COPY_FILES += \
    device/htc/primoc/prebuilt/usr/idc/himax-touchscreen.idc:system/usr/idc/himax-touchscreen.idc \
    device/htc/primoc/prebuilt/usr/idc/primoc-keypad.idc:system/usr/idc/primoc-keypad.idc \
    device/htc/primoc/prebuilt/usr/idc/qwerty.idc:system/usr/idc/qwerty.idc \
    device/htc/primoc/prebuilt/usr/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \
    device/htc/primoc/prebuilt/usr/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/htc/primoc/prebuilt/usr/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
    device/htc/primoc/prebuilt/usr/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
    device/htc/primoc/prebuilt/usr/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
    device/htc/primoc/prebuilt/usr/keychars/Virtual.kcm:system/usr/keychars/Virtual.kcm \
    device/htc/primoc/prebuilt/usr/keylayout/himax-touchscreen.kl:system/usr/keylayout/himax-touchscreen.kl \
    device/htc/primoc/prebuilt/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/primoc/prebuilt/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/primoc/prebuilt/usr/keylayout/primoc-keypad.kl:system/usr/keylayout/primoc-keypad.kl \
    device/htc/primoc/prebuilt/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/primoc/prebuilt/usr/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl

PRODUCT_COPY_FILES += \
    device/htc/primoc/prebuilt/etc/vold.fstab:system/etc/vold.fstab

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/primoc/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
	device/htc/primoc/prebuilt/etc/audio_policy.conf:system/etc/audio_policy.conf \
    device/htc/primoc/prebuilt/etc/media_codecs.xml:system/etc/media_codecs.xml	

# Kernel modules
#PRODUCT_COPY_FILES += \

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/htc/primoc/prebuilt/root/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    device/htc/primoc/prebuilt/modules/bcmdhd.ko:system/lib/modules/bcmdhd.ko \
    device/htc/primoc/prebuilt/modules/cpaccess.ko:system/lib/modules/cpaccess.ko \
    device/htc/primoc/prebuilt/modules/dma_test.ko:system/lib/modules/dma_test.ko \
    device/htc/primoc/prebuilt/modules/reset_modem.ko:system/lib/modules/reset_modem.ko
	

$(call inherit-product, build/target/product/full_base.mk)

# HTC Audio
$(call inherit-product, device/htc/primoc/media_a1026.mk)
$(call inherit-product, device/htc/primoc/media_htcaudio.mk)

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

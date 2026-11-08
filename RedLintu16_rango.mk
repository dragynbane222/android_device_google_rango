#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-FileCopyrightText: The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Google Applications: the bare minimum from vendor/gms. BirdHouse shows the Google feed, so the
# Pixel Launcher is left out there. Set to false for a build without Google Applications.
REDLINTU16_GMS := true
SETUP_WIZARD := true
# RedWhite themes for recovery and the boot animation: light (white) or dark (black).
REDLINTU16_RECOVERY_THEME := light
REDLINTU16_BOOTANIMATION_THEME := light

# Inherit the RedLintu16 config for a phone.
PHONE := true
$(call inherit-product, vendor/RedLintu16/config/RedLintu16.mk)

# Inherit device configuration
DEVICE_CODENAME := rango
DEVICE_PATH := device/google/rango
VENDOR_PATH := vendor/google/rango
$(call inherit-product, $(DEVICE_PATH)/aosp_$(DEVICE_CODENAME).mk)

# Device identifier. This must come after all inclusions
PRODUCT_NAME := lineage_$(DEVICE_CODENAME)
PRODUCT_SYSTEM_BRAND := google
PRODUCT_SYSTEM_MANUFACTURER := Google
PRODUCT_SYSTEM_NAME := generic_system_google

# Boot animation
TARGET_SCREEN_HEIGHT := 2424
TARGET_SCREEN_WIDTH := 1080

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="rango-user 17 CP3A.261005.005 16271449 release-keys" \
    BuildSystemDesc="generic_system_google-user 17 CP3A.261005.005 16271449 release-keys" \
    BuildFingerprint=google/rango/rango:17/CP3A.261005.005/16271449:user/release-keys \
    BuildSystemFingerprint=google/generic_system_google/generic:17/CP3A.261005.005/16271449:user/release-keys \
    DeviceProduct=$(DEVICE_CODENAME)

$(call inherit-product, $(VENDOR_PATH)/$(DEVICE_CODENAME)-vendor.mk)

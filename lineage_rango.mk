#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-FileCopyrightText: The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common stuff
$(call inherit-product, vendor/lineage/config/common_full_foldable_book_telephony.mk)

# Inherit device configuration
DEVICE_CODENAME := rango
DEVICE_PATH := device/google/rango
VENDOR_PATH := vendor/google/rango
$(call inherit-product, $(DEVICE_PATH)/aosp_$(DEVICE_CODENAME).mk)

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 10 Pro Fold
PRODUCT_NAME := lineage_$(DEVICE_CODENAME)

# Boot animation
TARGET_SCREEN_HEIGHT := 2424
TARGET_SCREEN_WIDTH := 1080

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="rango-user 16 BP4A.260205.001 14624666 release-keys" \
    BuildFingerprint=google/rango/rango:16/BP4A.260205.001/14624666:user/release-keys \
    DeviceProduct=$(DEVICE_CODENAME)

$(call inherit-product, $(VENDOR_PATH)/$(DEVICE_CODENAME)-vendor.mk)

-include vendor/lineage-priv/keys/keys.mk
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST := %

TARGET_BUILD_VARIANT := user
TARGET_INCLUDE_ACCORD := true
WITH_ADB_INSECURE := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_RELEASE := bp4a

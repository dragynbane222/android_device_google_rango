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
PRODUCT_NAME := lineage_$(DEVICE_CODENAME)
PRODUCT_SYSTEM_BRAND := google
PRODUCT_SYSTEM_MANUFACTURER := Google
PRODUCT_SYSTEM_NAME := generic_system_google

# Boot animation
TARGET_SCREEN_HEIGHT := 2424
TARGET_SCREEN_WIDTH := 1080

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="rango-user 17 CP3A.261005.005 16271449 release-keys" \
    BuildSystemDesc=generic_system_google-user 17 CP3A.261005.005 16271449 release-keys \
    BuildFingerprint=google/rango/rango:17/CP3A.261005.005/16271449:user/release-keys \
    BuildSystemFingerprint=google/generic_system_google/generic:17/CP3A.261005.005/16271449:user/release-keys \
    DeviceProduct=$(DEVICE_CODENAME)

$(call inherit-product, $(VENDOR_PATH)/$(DEVICE_CODENAME)-vendor.mk)

-include vendor/lineage-priv/keys/keys.mk
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST := %
PRODUCT_BUILD_IGNORE_APEX_CONTRIBUTION_CONTENTS := true

# Lunch banner maintainer variable
RISING_MAINTAINER="c_smith"

# Chipset/Maintainer properties (ro.rising.chipset/ro.rising.maintainer)
# Set RISING_MAINTAINER for version control
# (Optional if builder is setting properties via init_<device>.cpp)
PRODUCT_BUILD_PROP_OVERRIDES += \
    RisingChipset="Google Tensor G5" \
    RisingMaintainer="c_smith"

RISING_MAINTAINER := c_smith

# Disable/enable blur support, false by default
TARGET_ENABLE_BLUR := true

# Whether to ship aperture camera, false by default
PRODUCT_NO_CAMERA := false

WITH_GMS := true

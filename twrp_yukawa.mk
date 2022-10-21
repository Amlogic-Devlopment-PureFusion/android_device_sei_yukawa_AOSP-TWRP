#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common twrp stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from yukawa device
$(call inherit-product, device/sei/yukawa/device.mk)

PRODUCT_DEVICE := yukawa
PRODUCT_NAME := twrp_yukawa
PRODUCT_BRAND := generic
PRODUCT_MODEL := ATV on yukawa
PRODUCT_MANUFACTURER := sei

PRODUCT_GMS_CLIENTID_BASE := android-sei

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="yukawa-userdebug 12 SP2A.220505.008 eng.elimin.20221019.191811 test-keys"

BUILD_FINGERPRINT := generic/yukawa/yukawa:12/SP2A.220505.008/eliminater7410191856:userdebug/test-keys

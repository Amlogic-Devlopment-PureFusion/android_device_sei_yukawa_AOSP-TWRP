#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/sei/yukawa

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a53

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := vim3
TARGET_NO_BOOTLOADER := true

# Display
#TARGET_SCREEN_DENSITY := 320

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x11078000
BOARD_KERNEL_CMDLINE := no_console_suspend console=ttyAML0,115200 earlycon printk.devkmsg=on androidboot.boot_devices=soc/ffe07000.mmc init=/init firmware_class.path=/vendor/firmware androidboot.hardware=yukawa androidboot.selinux=permissive buildvariant=userdebug
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0xfff88000
BOARD_KERNEL_TAGS_OFFSET := 0xfef88100
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
TARGET_KERNEL_CONFIG := yukawa_defconfig
TARGET_KERNEL_SOURCE := kernel/sei/yukawa

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_INCLUDE_DTB_IN_BOOTIMG := 
endif

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 29429760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 41943040 # 41943040 bytes = 40M | Original: 29429760 = 28M
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
BOARD_SUPER_PARTITION_SIZE := 2684354560 # 2560M
BOARD_SUPER_PARTITION_GROUPS := sei_dynamic_partitions
BOARD_SEI_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor
BOARD_SEI_DYNAMIC_PARTITIONS_SIZE := 2680160256 # 2556M Reserve 4M for DAP metadata

# Platform
TARGET_BOARD_PLATFORM := yukawa

# Recovery
#TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# TWRP Configuration

# Misc
#TW_MTP_DEVICE := /dev/mtp_usb
#TW_HAS_MTP := true
#TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true

# Debug
TARGET_USES_LOGD := true
# include Logcat daemon for help in debugging
TWRP_INCLUDE_LOGCAT := true
TWRP_EVENT_LOGGING := false

# TWRP Theme BOARD_SUPER_PARTITION_GROUPS
TW_THEME := landscape_hdpi
# Old is gold. Put false to use the old one.
#TWRP_NEW_THEME := true

# Set the path to the sysfs entry which controls the brightness
#TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"

# Max brightness to prevent display damage
#TW_MAX_BRIGHTNESS := 255

# Default brightness for TWRP
#TW_DEFAULT_BRIGHTNESS := 150

# Disable/enable SELinux. Only suggested when you want to enable SELinux support
#TWHAVE_SELINUX := true

# Set the default language, if not english
TW_DEFAULT_LANGUAGE := en

# disables things like sdcard partitioning and may save you some space if TWRP isn't fitting in your recovery patition
#BOARD_HAS_NO_REAL_SDCARD := true

#BOARD_HAS_SDCARD_INTERNAL := true

# TWRP specific build flags
RECOVERY_VARIANT := twrp
#RECOVERY_SDCARD_ON_DATA := true
#TARGET_RECOVERY_PIXEL_FORMAT := ABGR_8888
#TARGET_RECOVERY_PIXEL_FORMAT := RGBA_8888
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
#TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
#TARGET_RECOVERY_FORCE_PIXEL_FORMAT := "RGB_565"
BOARD_HAS_NO_SELECT_BUTTON := true
#BOARD_TOUCH_RECOVERY :=
BOARD_RECOVERY_SWIPE := true
#BOARD_SUPPRESS_SECURE_ERASE := true
#TW_USE_NEW_MINADBD := true
TW_USE_TOOLBOX := true

#TW_INCLUDE_LOGICAL := product odm
TW_EXTRA_LANGUAGES := false
TW_SCREEN_BLANK_ON_BOOT := false
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_DEVICE_VERSION := $(shell date '+%Y%m%d-%H%M%S') by Eliminater74

TW_OEM_BUILD := true
#TW_DISABLE_TTF := true

### TW NO'S ###
TW_NO_SCREEN_TIMEOUT := true
TW_NO_HAPTICS := true
TW_NO_LEGACY_PROPS := true
# Disable the battery percentage for devices where it doesn't work properly
TW_NO_BATT_PERCENT := true
# Remove exFAT formatting binaries
TW_NO_EXFAT := true

# Decryption support for /data
#TW_INCLUDE_CRYPTO := true
#TW_INCLUDE_CRYPTO_FBE := true
#TW_INCLUDE_FBE_METADATA_DECRYPT := false
#BOARD_USES_METADATA_PARTITION := true

# Tool
#TW_INCLUDE_REPACKTOOLS := true
#TW_INCLUDE_RESETPROP := true
#TW_INCLUDE_LIBRESETPROP :=true


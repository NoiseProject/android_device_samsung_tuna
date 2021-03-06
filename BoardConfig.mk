#
# Copyright (C) 2011 The Android Open-Source Project
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

ANDROID_COMPILE_WITH_JACK := false

# CMHW
BOARD_HARDWARE_CLASS := $(DEVICE_FOLDER)/cmhw

#Charging LED
TARGET_USE_CHARGING_LED := true

DEVICE_FOLDER := device/samsung/tuna
# WITH_DEXPREOPT := true
# WITH_DEXPREOPT_PIC := true

PRODUCT_VENDOR_KERNEL_HEADERS += $(DEVICE_FOLDER)/kernel-headers

# Default values, if not overridden else where.
TARGET_BOARD_INFO_FILE := $(DEVICE_FOLDER)/board-info.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_FOLDER)/bluetooth

TARGET_BOARD_OMAP_CPU := 4460

TARGET_NO_BOOTLOADER := true

TARGET_BOARD_PLATFORM := omap4
TARGET_BOOTLOADER_BOARD_NAME := tuna

# Memory management
MALLOC_IMPL := dlmalloc
ART_USE_HSPACE_COMPACT := true

# EGL
BOARD_EGL_CFG := $(DEVICE_FOLDER)/egl.cfg
USE_OPENGL_RENDERER := true

# Processor
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a9
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_FPU_VARIANT := neon-fp16

BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_CMDLINE := androidboot.hardware=$(TARGET_BOOTLOADER_BOARD_NAME) androidboot.selinux=permissive

TARGET_KERNEL_CONFIG := cm_tuna_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/tuna
TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.7


TARGET_NO_RADIOIMAGE := true
TARGET_BOOTLOADER_BOARD_NAME := tuna

# We're now a unified build, but this wasn't always the case.
TARGET_OTA_ASSERT_DEVICE := tuna,,maguro,toro,toroplus

TARGET_TI_HWC_HDMI_DISABLED := true

# Franken-domx
TI_CAMERAHAL_USES_LEGACY_DOMX_DCC := true
TI_CAMERAHAL_MAX_CAMERAS_SUPPORTED := 2
#TI_CAMERAHAL_DEBUG_ENABLED := true

COMMON_GLOBAL_CFLAGS += -DFORCE_SCREENSHOT_CPU_PATH

TARGET_EXTRA_CFLAGS += -DOMAP_TUNA

# For enabling some things that are OMAP_ENHANCEMENT's and are applicable to tuna...
OMAP_TUNA := true

BOARD_CREATE_TUNA_HDCP_KEYS_SYMLINK := true

# set if the target supports FBIO_WAITFORVSYNC
TARGET_HAS_WAITFORVSYNC := true

TARGET_NEEDS_BIONIC_MD5 := true

TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"

# device-specific extensions to the updater binary
TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater_tuna
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_FOLDER)

TARGET_RECOVERY_FSTAB = $(DEVICE_FOLDER)/rootdir/fstab.tuna
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_SETS_FSTAB := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 12517376
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 685768704
BOARD_CACHEIMAGE_PARTITION_SIZE := 452984832
BOARD_USERDATAIMAGE_PARTITION_SIZE := 14539537408
BOARD_FLASH_BLOCK_SIZE := 4096

BOARD_CHARGER_BACKLIGHT_PATH := /sys/class/backlight/s6e8aa0/brightness

# Disable journaling on system.img to save space.
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0

#TARGET_PROVIDES_INIT_RC := true
#TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
#WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcmdhd.ko"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcmdhd_apsta.bin"

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

BOARD_HAL_STATIC_LIBRARIES := libdumpstate.tuna

# on toro(plus) boards we need to apply a special adaptive filter
# on the compass output because of noise generated by the pmic.
# TODO: find a way to ONLY apply this to toro(plus), and leave maguro alone.
BOARD_INVENSENSE_APPLY_COMPASS_NOISE_FILTER := true

BOARD_SEPOLICY_DIRS += \
	$(DEVICE_FOLDER)/sepolicy

# TWRP
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_INCLUDE_JB_CRYPTO := true
TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_REAL_BLKDEV := "/dev/block/platform/omap/omap_hsmmc.0/by-name/userdata"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_FS_OPTIONS := "nomblk_io_submit,errors=panic"
TW_CRYPTO_FS_FLAGS := "0x00000406"
TW_CRYPTO_KEY_LOC := "/dev/block/platform/omap/omap_hsmmc.0/by-name/metadata"
SP1_NAME := "efs"
SP1_BACKUP_METHOD := files
SP1_MOUNTABLE := 1
TW_FLASH_FROM_STORAGE := true
TW_NO_USB_STORAGE := true
TW_NO_SCREEN_BLANK := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/usb-otg"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "usb-otg"
TW_MAX_BRIGHTNESS := 255
TW_BRIGHTNESS_PATH := /sys/class/backlight/s6e8aa0/brightness
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/platform/omap/omap_temp_sensor.0/temperature

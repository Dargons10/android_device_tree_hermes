# Path
DEVICE_PATH := device/xiaomi/hermes

# Platform
TARGET_BOOTLOADER_BOARD_NAME := mt6795
TARGET_BOARD_PLATFORM := mt6795
TARGET_NO_BOOTLOADER := true
TARGET_IS_64_BIT := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Build old-style zip files (required for ota updater)
BLOCK_BASED_OTA := false

# Kernel
#ifneq ($(TARGET_BUILD_VARIANT),user)
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive
#else
#BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
#endif
BOARD_MKBOOTIMG_ARGS := \
    --base 0x40078000 \
    --board $(TARGET_BOARD_PLATFORM) \
    --kernel_offset 0x00008000 \
    --pagesize 2048 \
    --ramdisk_offset 0x03f88000 \
    --second_offset 0x00e88000 \
    --tags_offset 0x0df88000
# Prebuilt
#TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/kernel
# Source
TARGET_KERNEL_SOURCE := kernel/xiaomi/hermes
TARGET_KERNEL_CONFIG := hermes_defconfig
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_ARCH := arm64

# Partitons make_ext4fs requires numbers
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12737576960
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 134217728
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
BOARD_CACHEIMAGE_PARTITION_SIZE := 629145600
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# EXT4
TARGET_USERIMAGES_USE_EXT4 := true
#TARGET_USERIMAGES_USE_F2FS := true

# Hardware
BOARD_USES_MTK_HARDWARE := true
BOARD_USES_LEGACY_MTK_AV_BLOB := true

# disable hardware id match check
BOARD_DISABLE_HW_ID_MATCH_CHECK := true

# Display
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
VSYNC_EVENT_PHASE_OFFSET_NS := -8000000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := -8000000
PRESENT_TIME_OFFSET_FROM_VSYNC_NS := 0

# Fix video autoscaling on old OMX decoders
TARGET_OMX_LEGACY_RESCALING:= true

# Audio
USE_XML_AUDIO_POLICY_CONF := 1

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
YELLOW_LED_PATH := /sys/class/leds/yellow/brightness

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# RIL
SIM_COUNT := 2
BOARD_PROVIDES_RILD := true
BOARD_PROVIDES_LIBRIL := true
BOARD_CONNECTIVITY_VENDOR := MediaTek
BOARD_CONNECTIVITY_MODULE := conn_soc
#BOARD_RIL_CLASS := ../../../$(DEVICE_PATH)/mtk/ril_class

# LightHAL
TARGET_PROVIDES_LIBLIGHT := true

# LineageHW
BOARD_USES_LINEAGE_HARDWARE := true
BOARD_HARDWARE_CLASS := $(DEVICE_PATH)/lineagehw

# Camera
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
TARGET_NEEDS_LEGACY_CAMERA_HAL1_DYN_NATIVE_HANDLE := true

# Low-ram
MALLOC_SVELTE := true

# Include
TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# Device specific props
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop

# Shim libs
TARGET_LD_SHIM_LIBS := \
        /system/vendor/lib/libcam_utils.so|libshim_cam.so \
        /system/vendor/lib64/libcam_utils.so|libshim_cam.so \
        /system/vendor/lib/libcam.utils.sensorlistener.so|libshim_gui.so \
        /system/vendor/lib64/libcam.utils.sensorlistener.so|libshim_gui.so \
        /system/vendor/lib/libmmsdkservice.feature.so|libshim_mmsdk.so \
        /system/vendor/lib64/libmmsdkservice.feature.so|libshim_mmsdk.so \
        /system/vendor/lib/libMtkOmxVdec.so|libshim_omx.so
        #/system/vendor/bin/mtk_agpsd|libshim_agps.so\
        #/system/lib/libmedia.so|libshim_snd.so\
        #/system/lib64/libmedia.so|libshim_snd.so\
        #/system/lib/libgui.so|libshim_gui.so\
        #/system/lib64/libgui.so|libshim_gui.so\
        #/system/lib/libcutils.so|libshim_atomic.so\
        #/system/lib64/libcutils.so|libshim_atomic.so\
        #/system/lib/libc.so|libshim_bionic.so\
        #/system/lib64/libc.so|libshim_bionic.so\
        #/system/lib/liblog.so|libshim_xlog.so\
        #/system/lib64/liblog.so|libshim_xlog.so\
        #/system/lib/libnetutils.so|libshim_netutils.so\
        #/system/lib64/libnetutils.so|libshim_netutils.so\
        #/system/lib/libui.so|libshim_ui.so\
        #/system/lib64/libui.so|libshim_ui.so

# Wi-Fi
BOARD_WLAN_DEVICE := MediaTek
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
WPA_SUPPLICANT_VERSION := VER_0_8_X
WIFI_DRIVER_FW_PATH_STA := STA
WIFI_DRIVER_FW_PATH_P2P := P2P
WIFI_DRIVER_FW_PATH_AP := AP
WIFI_DRIVER_FW_PATH_PARAM := "/dev/wmtWifi"
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wmtWifi"
WIFI_DRIVER_STATE_ON := 1
WIFI_DRIVER_STATE_OFF := 0

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/fstab.mt6795
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_RECOVERY_SWIPE := true

# Sepolicy
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy
SELINUX_IGNORE_NEVERALLOWS := true

# Build kernel without kernel sources
$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)

#
# Oreo board
#

# Disable dex pre-opt
#WITH_DEXPREOPT := false

# GC tweak
PRODUCT_TAGS += dalvik.gc.type-precise

# SW Gatekeeper
BOARD_USE_SOFT_GATEKEEPER := true

# Camera flags
TARGET_USES_NON_TREBLE_CAMERA := true

# Suppress MTK audio blob error message flag
SUPPRESS_MTK_AUDIO_BLOB_ERR_MSG := true

# MTK av blob flag
LEGACY_MTK_AV_BLOB := true

# Graphics
USE_OPENGL_RENDERER := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
BOARD_EGL_NEEDS_HANDLE_VALUE := true

# HIDL Manifest
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/configs/manifest.xml

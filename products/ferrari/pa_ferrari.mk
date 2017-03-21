# Copyright (C) 2014 The CyanogenMod Project
#           (C) 2017 The LineageOS Project
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
# limitations under the License

# Check for the target product.
ifeq (pa_ferrari,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Set bootanimation to 1080p display.
TARGET_BOOT_ANIMATION_RES := 1080

# Inherit from our common CAF device tree.
include device/qcom/common/common.mk

# Inherit the device configuration itself.
$(call inherit-product, device/xiaomi/ferrari/device.mk)

# Must define platform variant before including any common things
TARGET_BOARD_PLATFORM_VARIANT := msm8939

# Device identifier. This must come after all inclusions
PRODUCT_NAME := pa_ferrari
PRODUCT_DEVICE := ferrari
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Mi 4i
PRODUCT_MANUFACTURER := Xiaomi

# Google client ID.
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_SYSTEM_PROPERTY_BLACKLIST += ro.qualcomm.bt.hci_transport

# Override build properties
PRODUCT_BUILD_PROP_OVERRIDES += \
	BUILD_FINGERPRINT="Xiaomi/ferrari/ferrari:5.0.2/LRX22G/V8.1.5.0.LXIMIDI:user/release-keys" \
	PRIVATE_BUILD_DESC="ferrari-user 5.0.2 LRX22G V8.1.5.0.LXIMIDI release-keys" \
	PRODUCT_NAME="ferrari"

TARGET_VENDOR := Xiaomi

# Inherit the main configuration from our vendor.
include vendor/pa/main.mk

endif
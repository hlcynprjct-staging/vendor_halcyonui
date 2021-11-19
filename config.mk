#
# Copyright (C) 2019-2021 The ConquerOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

include $(call all-subdir-makefiles,$(LOCAL_PATH))

# Accent Color
PRODUCT_PACKAGES += \
    AccentBlueline \
    AccentOxypink \
    AccentPixelBlue

# Apps
 PRODUCT_PACKAGES += \
    NexusLauncherRelease \
    ThemePicker \
    WallpaperPickerGoogleRelease

# Bootanimation
ifeq ($(TARGET_BOOT_ANIMATION_RES),1080)
     PRODUCT_COPY_FILES += vendor/halcyonui/bootanimation/bootanimation_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),1440)
     PRODUCT_COPY_FILES += vendor/halcyonui/bootanimation/bootanimation_1440.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),720)
     PRODUCT_COPY_FILES += vendor/halcyonui/bootanimation/bootanimation_720.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
else
    ifeq ($(TARGET_BOOT_ANIMATION_RES),)
        $(warning "halcyonUI: TARGET_BOOT_ANIMATION_RES is undefined, assuming 1080p")
    else
        $(warning "halcyonUI: Current bootanimation res is not supported, forcing 1080p")
    endif
    PRODUCT_COPY_FILES += vendor/halcyonui/bootanimation/bootanimation_1080.zip:$(TARGET_COPY_OUT_PRODUCT)/media/bootanimation.zip
endif

# Config Files
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,vendor/halcyonui/etc,$(TARGET_COPY_OUT_SYSTEM_EXT)/etc)

# Fonts
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/halcyonui/fonts,$(TARGET_COPY_OUT_PRODUCT)/fonts) \
    vendor/halcyonui/etc/fonts_customization.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/fonts_customization.xml

PRODUCT_PACKAGES += \
    FontArbutus \
    FontArvoLato \
    FontGoogleSans \
    FontKai \
    FontManrope \
    FontNotoSerifSource \
    FontOnePlusSans \
    FontRubik \
    FontVictor

# Gestures
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.vendor.overlay.theme=com.android.internal.systemui.navbar.gestural

# IME
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.ime.bs_theme=true \
    ro.com.google.ime.system_lm_dir=/system/product/usr/share/ime/google/d3_lms \
    ro.com.google.ime.theme_id=5

# Navigation Bar
#PRODUCT_PACKAGES += \
#    GesturalNavigationOverlayLong \
#    GesturalNavigationOverlayMedium \
#    GesturalNavigationOverlayHidden

# Overlays
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/halcyonui/overlay
DEVICE_PACKAGE_OVERLAYS += \
    vendor/halcyonui/overlay/common/

# Power off charing resource
PRODUCT_PACKAGES += \
    charger_res_images \
    product_charger_res_images

# SetupWizard
PRODUCT_PRODUCT_PROPERTIES += \
    setupwizard.enable_assist_gesture_training=true \
    setupwizard.feature.baseline_setupwizard_enabled=true \
    setupwizard.feature.show_pixel_tos=true \
    setupwizard.feature.show_support_link_in_deferred_setup=false \
    setupwizard.theme=glif_v3_light

# Wallpaper
PRODUCT_PROPERTY_OVERRIDES += \
    ro.wallpapers_loc_request_suw=true

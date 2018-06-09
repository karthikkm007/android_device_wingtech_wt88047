#
# Copyright (C) 2016 The CyanogenMod Project
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
#

$(call inherit-product, vendor/wingtech/wt88047/wt88047-vendor.mk)
$(call inherit-product, vendor/wingtech/volte/volte.mk)
$(call inherit-product, vendor/wingtech/volte/wt88047/wt88047-vendor.mk)

# ANT+
PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant.antradio_library \
    libantradio

# Permissions
PRODUCT_COPY_FILES += \
    external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:system/vendor/etc/permissions/com.dsi.ant.antradio_library.xml

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default \
    tinymix

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.midi.xml:system/vendor/etc/permissions/android.software.midi.xml

# GNSS HAL
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-impl

# Init scripts
PRODUCT_PACKAGES += \
    init.qcom.rc \
    init.qcom.mem.sh \
    init.qcom.power.rc \
    init.qcom.ssr.rc \
    init.recovery.qcom.rc \
    ueventd.qcom.rc

# Media
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/vendor/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/vendor/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/vendor/etc/media_codecs_google_video_le.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/vendor/etc/media_codecs_google_video.xml

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    media.aac_51_output_enabled=true

# WiFi Display
PRODUCT_PROPERTY_OVERRIDES += \
    persist.debug.wfd.enable=1
    persist.sys.wfd.virtual=0

# Properties
ifeq ($(TARGET_BOARD_PLATFORM_VARIANT),msm8939)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.fw.dex2oat_thread_count=4
endif

PRODUCT_PROPERTY_OVERRIDES += \
    ro.am.reschedule_service=true \
    ro.config.max_starting_bg=8

# Audio
PRODUCT_PACKAGES += \
    audio.primary.msm8916 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudio-resampler \

PRODUCT_PACKAGES += \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libqcomvoiceprocessingdescriptors \
    libqcompostprocbundle

PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio.effect@2.0-impl \
    android.hardware.broadcastradio@1.0-impl \
    android.hardware.soundtrigger@2.0-impl

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects.xml:system/vendor/etc/audio_effects.xml

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    av.streaming.offload.enable=true \
    audio.deep_buffer.media=true \
    audio.offload.buffer.size.kb=64 \
    audio.offload.gapless.enabled=true \
    audio.offload.min.duration.secs=30 \
    audio.offload.pcm.16bit.enable=false \
    audio.offload.pcm.24bit.enable=true \
    audio.offload.video=true \
    use.voice.path.for.pcm.voip=true

# Bluetooth
PRODUCT_PACKAGES += \
    libbt-vendor \
    android.hardware.bluetooth@1.0-impl

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/vendor/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/vendor/etc/permissions/android.hardware.bluetooth_le.xml

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    qcom.bluetooth.soc=smd \
    ro.bluetooth.dun=true \
    ro.bluetooth.hfp.ver=1.7 \
    ro.bluetooth.sap=true \
    ro.qualcomm.bt.hci_transport=smd

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.memtrack@1.0-impl \
    copybit.msm8916 \
    gralloc.msm8916 \
    hwcomposer.msm8916 \
    libgenlock \
    libtinyxml \
    memtrack.msm8916

# Permissions
ifeq ($(TARGET_BOARD_PLATFORM_VARIANT),msm8939)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/vendor/etc/permissions/android.hardware.opengles.aep.xml
endif

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    debug.composition.type=c2d \
    debug.mdpcomp.idletime=600 \
    persist.hwc.mdpcomp.enable=true \
    persist.hwc.ptor.enable=true \
    debug.enable.sglscale=1

ifeq ($(TARGET_BOARD_PLATFORM_VARIANT),msm8916)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196608
else
ifeq ($(TARGET_BOARD_PLATFORM_VARIANT),msm8939)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196610
endif
endif

# RenderScript HAL
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl

# FM
PRODUCT_PACKAGES += \
    FMRadio \
    libfmjni

# Keymaster HAL
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl

# Keystore
ifneq ($(TARGET_PROVIDES_KEYMASTER),true)
PRODUCT_PACKAGES += \
    keystore.msm8916
endif

# Media
PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/vendor/etc/media_codecs.xml

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=1 \
    vidc.enc.narrow.searchrange=1

# Storage
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.sdcardfs=true

# IRQ balance
ifeq ($(TARGET_BOARD_PLATFORM_VARIANT),msm8939)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/msm_irqbalance.conf:system/vendor/etc/msm_irqbalance.conf
endif

# Power HAL
PRODUCT_PACKAGES += \
    android.hardware.power@1.0-impl \
    power.msm8916

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=libqti-perfd-client.so \
    ro.core_ctl_min_cpu=0 \
    ro.core_ctl_max_cpu=4

ifeq ($(TARGET_BOARD_PLATFORM_VARIANT),msm8916)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.min_freq_0=800000
else
ifeq ($(TARGET_BOARD_PLATFORM_VARIANT),msm8939)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.min_freq_0=960000 \
    ro.min_freq_4=800000
endif
endif

# IRSC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:system/vendor/etc/sec_config

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/vendor/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/vendor/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/vendor/etc/permissions/android.software.sip.voip.xml

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    persist.data.qmi.adb_logmask=0 \
    persist.radio.apm_sim_not_pwdn=1 \
    ro.telephony.call_ring.multiple=false \
    ro.use_data_netmgrd=true

# RIL
PRODUCT_PACKAGES += \
    libcnefeatureconfig \
    librmnetctl \
    libxml2

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/vendor/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/vendor/etc/permissions/android.hardware.wifi.xml

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.disableWifiApFirmwareReload=true \
    wifi.interface=wlan0

# WiFi HAL
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service

# Wifi
PRODUCT_PACKAGES += \
    libqsap_sdk \
    libQWiFiSoftApCfg \
    libwcnss_qmi \
    wcnss_service \
    libwpa_client

PRODUCT_PACKAGES += \
    hostapd \
    wificond \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/p2p_supplicant_overlay.conf:system/vendor/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wpa_supplicant_overlay.conf:system/vendor/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/WCNSS_qcom_cfg.ini:system/vendor/etc/wifi/WCNSS_qcom_cfg.ini

# Recovery
PRODUCT_PACKAGES += \
    librecovery_updater_cm

# Seccomp
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/seccomp/mediacodec-seccomp.policy:system/vendor/etc/seccomp_policy/mediacodec.policy \
    $(LOCAL_PATH)/seccomp/mediaextractor-seccomp.policy:system/vendor/etc/seccomp_policy/mediaextractor.policy

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/vendor/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

# Init scripts
PRODUCT_PACKAGES += \
    init.qcom.usb.rc

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/vendor/etc/permissions/android.hardware.usb.accessory.xml

# USB HAL
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Screen density
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320

PRODUCT_PROPERTY_OVERRIDES += \
    debug.hwui.use_buffer_age=false

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# For android_filesystem_config.h
PRODUCT_PACKAGES += \
    fs_config_files

# HIDL
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/manifest.xml:system/vendor/manifest.xml

# Init scripts
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.target.rc

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/ft5x06_ts.kl:system/usr/keylayout/ft5x06_ts.kl \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-impl \
    lights.msm8916

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    $(LOCAL_PATH)/configs/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml

PRODUCT_PROPERTY_OVERRIDES += \
    media.aac_51_output_enabled=true \
    persist.media.treble_omx=false

# Factory Reset Protection
PRODUCT_PROPERTY_OVERRIDES += \
    ro.frp.pst=/dev/block/bootdevice/by-name/config

# use 3 threads max for dex2oat
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.fw.dex2oat_thread_count=2 \
    ro.sys.fw.use_trim_settings=true \
    ro.sys.fw.empty_app_percent=50 \
    ro.sys.fw.trim_empty_percent=100 \
    ro.sys.fw.trim_cache_percent=100 \
    ro.sys.fw.trim_enable_memory=1073741824 \
    dalvik.vm.heapgrowthlimit=192m \
    dalvik.vm.heapminfree=6m \
    dalvik.vm.heapstartsize=14m \
    dalvik.vm.heapsize=256m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapmaxfree=8m

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/acdb/QRD_Bluetooth_cal.acdb:system/etc/acdbdata/QRD/QRD_Bluetooth_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/QRD_General_cal.acdb:system/etc/acdbdata/QRD/QRD_General_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/QRD_Global_cal.acdb:system/etc/acdbdata/QRD/QRD_Global_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/QRD_Handset_cal.acdb:system/etc/acdbdata/QRD/QRD_Handset_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/QRD_Hdmi_cal.acdb:system/etc/acdbdata/QRD/QRD_Hdmi_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/QRD_Headset_cal.acdb:system/etc/acdbdata/QRD/QRD_Headset_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/QRD_Speaker_cal.acdb:system/etc/acdbdata/QRD/QRD_Speaker_cal.acdb \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:system/vendor/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/vendor/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/mixer_paths.xml:system/vendor/etc/mixer_paths_qrd_skui.xml

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.audio.fluencetype=fluence \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.voicerec=false \
    persist.audio.fluence.speaker=false

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    camera.device@3.2-impl \
    camera.msm8916 \
    libmm-qcamera \
    libshim_camera \
    Snap

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    persist.camera.cpp.duplication=false \
    persist.camera.hal.debug.mask=0 \
    ro.camera.sensors=ov8865_q8v18a,ov2680_skuhf,ov2680_5987fhq

# GPS
PRODUCT_PACKAGES += \
    gps.msm8916 \
    libshims_flp \
    libshims_get_process_name

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps/flp.conf:system/etc/flp.conf \
    $(LOCAL_PATH)/gps/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/gps/izat.conf:system/etc/izat.conf \
    $(LOCAL_PATH)/gps/sap.conf:system/etc/sap.conf

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml

# IMS
PRODUCT_PACKAGES += \
    libshims_ims

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    persist.data.target=dpm1 \
    persist.radio.multisim.config=dsds \
    persist.radio.custom_ecc=1 \
    persist.radio.ecc_hard_1=112,911,110,122,119,120,000,118 \
    persist.radio.ecc_hard_count=1 \
    rild.libpath=/system/vendor/lib/libril-qc-qmi-1.so \
    ril.subscription.types=RUIM

# Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal-engine.conf:system/etc/thermal-engine.conf

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
    $(LOCAL_PATH)/wifi/WCNSS_wlan_dictionary.dat:system/etc/firmware/wlan/prima/WCNSS_wlan_dictionary.dat

# Sensor HAL
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    calmodule.cfg \
    libcalmodule_common \
    sensors.msm8916

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# relax sensor fusion mag field filter
PRODUCT_PROPERTY_OVERRIDES += \
    ro.fusion.magfield.max=250

# USB ID
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.usb.vid=2717 \
    ro.usb.id.midi=90BA \
    ro.usb.id.midi_adb=90BB \
    ro.usb.id.mtp=ff60 \
    ro.usb.id.mtp_adb=ff68 \
    ro.usb.id.ptp=ff10 \
    ro.usb.id.ptp_adb=ff18 \
    ro.usb.id.ums=ff20 \
    ro.usb.id.ums_adb=ff28

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

PRODUCT_ENFORCE_RRO_TARGETS := framework-res

# Vendor security patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.lineage.build.vendor_security_patch=2017-01-01

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    android/sensor.cpp \
    gui/SensorManager.cpp

LOCAL_C_INCLUDES := gui
LOCAL_SHARED_LIBRARIES := libgui libutils liblog libbinder libandroid
LOCAL_MODULE := libshim_camera
LOCAL_MODULE_CLASS := SHARED_LIBRARIES

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := parcel/parcel.cpp

LOCAL_SHARED_LIBRARIES := libbinder
LOCAL_MODULE := libshim_parcel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := boringssl/p_dec.c boringssl/p_open.c boringssl/cipher.c \
    boringssl/e_des.c boringssl/cleanup.c boringssl/ctrl.c

LOCAL_CFLAGS += -std=c99
LOCAL_C_INCLUDES := boringssl
LOCAL_SHARED_LIBRARIES := libcrypto
LOCAL_MODULE := libshim_boringssl
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	camera/Camera.cpp \
	camera/CameraMetadata.cpp \
	camera/CaptureResult.cpp \
	camera/CameraParameters2.cpp \
	camera/ICamera.cpp \
	camera/ICameraClient.cpp \
	camera/ICameraService.cpp \
	camera/ICameraServiceListener.cpp \
	camera/ICameraServiceProxy.cpp \
	camera/ICameraRecordingProxy.cpp \
	camera/ICameraRecordingProxyListener.cpp \
	camera/camera2/ICameraDeviceUser.cpp \
	camera/camera2/ICameraDeviceCallbacks.cpp \
	camera/camera2/CaptureRequest.cpp \
	camera/camera2/OutputConfiguration.cpp \
	camera/CameraBase.cpp \
	camera/CameraUtils.cpp \
	camera/VendorTagDescriptor.cpp \
	camera/CameraParameters.cpp

LOCAL_SHARED_LIBRARIES := \
	libcutils \
	libutils \
	liblog \
	libbinder \
	libhardware \
	libui \
	libgui \
	libcamera_metadata

LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/camera/include \
	system/media/camera/include \
	system/media/private/camera/include

LOCAL_MODULE:= libshims_camera

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := ims/MediaBuffer.c
LOCAL_SHARED_LIBRARIES := libstagefright_foundation
LOCAL_MODULE := libshims_ims
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

LOCAL_PATH := $(call my-dir)/../../..
PVRSDKDIR := $(realpath $(call my-dir)/../../../../../../..)

ASSETDIR := $(PVRSDKDIR)/Examples/Advanced/DeferredShading/Vulkan/Build/Android/assets


ifneq "$(MAKECMDGOALS)" "clean"
# Prebuilt module PVRUtilsVk
include $(CLEAR_VARS)
LOCAL_MODULE := PVRUtilsVk
LOCAL_SRC_FILES := $(PVRSDKDIR)/Framework/Bin/Android/local/$(TARGET_ARCH_ABI)/libPVRUtilsVk.a
include $(PREBUILT_STATIC_LIBRARY)
endif

ifneq "$(MAKECMDGOALS)" "clean"
# Prebuilt module PVRShell
include $(CLEAR_VARS)
LOCAL_MODULE := PVRShell
LOCAL_SRC_FILES := $(PVRSDKDIR)/Framework/Bin/Android/local/$(TARGET_ARCH_ABI)/libPVRShell.a
include $(PREBUILT_STATIC_LIBRARY)
endif

ifneq "$(MAKECMDGOALS)" "clean"
# Prebuilt module PVRVk
include $(CLEAR_VARS)
LOCAL_MODULE := PVRVk
LOCAL_SRC_FILES := $(PVRSDKDIR)/Framework/Bin/Android/local/$(TARGET_ARCH_ABI)/libPVRVk.a
include $(PREBUILT_STATIC_LIBRARY)
endif

ifneq "$(MAKECMDGOALS)" "clean"
# Prebuilt module PVRAssets
include $(CLEAR_VARS)
LOCAL_MODULE := PVRAssets
LOCAL_SRC_FILES := $(PVRSDKDIR)/Framework/Bin/Android/local/$(TARGET_ARCH_ABI)/libPVRAssets.a
include $(PREBUILT_STATIC_LIBRARY)
endif

ifneq "$(MAKECMDGOALS)" "clean"
# Prebuilt module PVRCore
include $(CLEAR_VARS)
LOCAL_MODULE := PVRCore
LOCAL_SRC_FILES := $(PVRSDKDIR)/Framework/Bin/Android/local/$(TARGET_ARCH_ABI)/libPVRCore.a
include $(PREBUILT_STATIC_LIBRARY)
endif


# Module VulkanDeferredShading
include $(CLEAR_VARS)

LOCAL_MODULE    := VulkanDeferredShading

### Add all source file names to be included in lib separated by a whitespace
LOCAL_SRC_FILES  := VulkanDeferredShading.cpp

LOCAL_C_INCLUDES := $(PVRSDKDIR)/Framework \
                    $(PVRSDKDIR)/Builds/Include



LOCAL_LDLIBS := -latomic \
                -llog \
                -landroid

LOCAL_STATIC_LIBRARIES := PVRUtilsVk PVRVk PVRAssets PVRCore android_native_app_glue


LOCAL_CFLAGS += $(SDK_BUILD_FLAGS)

LOCAL_WHOLE_STATIC_LIBRARIES := PVRShell

include $(BUILD_SHARED_LIBRARY)

$(call import-module,android/native_app_glue)

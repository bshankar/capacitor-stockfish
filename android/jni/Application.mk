APP_PLATFORM := android-21
APP_STL := c++_shared
APP_ABI := armeabi-v7a arm64-v8a x86 x86_64
APP_OPTIM := release
APP_USE_CPP0X := true

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
	APP_CPPFLAGS += -m32 -DUSE_SSE -DUSE_PREFETCH -DUSE_POPCNT
endif

ifeq ($(TARGET_ARCH_ABI),arm64-v8a)
	APP_CPPFLAGS += -m64 -DIS_64BIT -DUSE_PREFETCH -DUSE_POPCNT -DUSE_NEON=8
endif

ifeq ($(TARGET_ARCH_ABI),x86)
	APP_CPPFLAGS += -m32 -DNO_PREFETCH -DUSE_SSE3 -DUSE_POPCNT -DUSE_MMX
endif

ifeq ($(TARGET_ARCH_ABI),x86_64)
	APP_CPPFLAGS += -m64 -DIS_64BIT -DUSE_PREFETCH -DUSE_SSE2 -DUSE_SSE3 -DUSE_POPCNT
endif

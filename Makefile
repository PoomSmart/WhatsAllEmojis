TARGET := iphone:clang:latest:12.0
ARCHS = arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = WhatsAllEmojis

$(TWEAK_NAME)_FILES = Tweak.x
$(TWEAK_NAME)_CFLAGS = -fobjc-arc
$(TWEAK_NAME)_LIBRARIES = EmojiLibrary

include $(THEOS_MAKE_PATH)/tweak.mk

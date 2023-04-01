# Versioning System

ifndef HAVOC_BUILD_TYPE
    HAVOC_BUILD_TYPE := Unofficial
endif

# Only include Havoc OTA for official builds
ifeq ($(filter-out Official,$(HAVOC_BUILD_TYPE)),)
    PRODUCT_PACKAGES += \
        Updater
endif

TARGET_PRODUCT_SHORT := $(subst havoc_,,$(HAVOC_BUILD_TYPE))

HAVOC_DATE_YEAR := $(shell date -u +%Y)
HAVOC_DATE_MONTH := $(shell date -u +%m)
HAVOC_DATE_DAY := $(shell date -u +%d)
HAVOC_DATE_HOUR := $(shell date -u +%H)
HAVOC_DATE_MINUTE := $(shell date -u +%M)
HAVOC_VERSION = LTS
HAVOC_BUILD_DATE := $(HAVOC_DATE_YEAR)$(HAVOC_DATE_MONTH)$(HAVOC_DATE_DAY)
HAVOC_FINGERPRINT := Havoc-OS/v$(HAVOC_VERSION)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(shell date -u +%Y%m%d)/$(shell date -u +%H%M)

ifeq ($(WITH_GAPPS),true)
    HAVOC_BUILD_VARIANT = GApps
    HAVOC_BUILD_VERSION := Havoc-OS-v$(HAVOC_VERSION)-$(shell date -u +%Y%m%d)-$(HAVOC_BUILD)-$(HAVOC_BUILD_TYPE)-GApps
else
    HAVOC_BUILD_VARIANT = Vanilla
    HAVOC_BUILD_VERSION := Havoc-OS-v$(HAVOC_VERSION)-$(shell date -u +%Y%m%d)-$(HAVOC_BUILD)-$(HAVOC_BUILD_TYPE)
endif

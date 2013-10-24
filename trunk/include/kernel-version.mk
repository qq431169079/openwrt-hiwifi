# Use the default kernel version if the Makefile doesn't override it

LINUX_RELEASE?=1

ifeq ($(LINUX_VERSION),3.3.8)
  LINUX_KERNEL_MD5SUM:=f1058f64eed085deb44f10cee8541d50
endif

ifeq ($(LINUX_VERSION),3.10.15)
  LINUX_KERNEL_MD5_SUM:=3fe22263308674d92c6d106f633eca52
endif

ifeq ($(LINUX_VERSION),3.10.17)
  LINUX_KERNEL_MD5SUM:=0c52d1266fe1087bcfa6517646188ecc
endif

# disable the md5sum check for unknown kernel versions
LINUX_KERNEL_MD5SUM?=x

split_version=$(subst ., ,$(1))
merge_version=$(subst $(space),.,$(1))
KERNEL_BASE=$(firstword $(subst -, ,$(LINUX_VERSION)))
KERNEL=$(call merge_version,$(wordlist 1,2,$(call split_version,$(KERNEL_BASE))))
ifeq ($(firstword $(call split_version,$(KERNEL_BASE))),2)
  KERNEL_PATCHVER=$(call merge_version,$(wordlist 1,3,$(call split_version,$(KERNEL_BASE))))
else
  KERNEL_PATCHVER=$(KERNEL)
endif


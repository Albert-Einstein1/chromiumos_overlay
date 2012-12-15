# Copyright (c) 2012 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="Firmwares For Broadcom BCM43XX."

LICENSE="BSD"
SLOT="0"
KEYWORDS="x86 arm amd64"

EGIT_REPO_URI="https://android.googlesource.com/platform/hardware/broadcom/wlan"
EGIT_BRANCH="master"
inherit git

FIRMWARE_4329=bcmdhd/firmware/bcm4329

src_install() {
	insinto /lib/firmware/bcm4329
	newins ${S}/${FIRMWARE_4329}/fw_bcm4329.bin fw_bcmdhd.bin
	newins ${S}/${FIRMWARE_4329}/fw_bcm4329_apsta.bin fw_bcmdhd_apsta.bin
    newins ${FILESDIR}/nvram_4329.txt nvram_4329.txt
}

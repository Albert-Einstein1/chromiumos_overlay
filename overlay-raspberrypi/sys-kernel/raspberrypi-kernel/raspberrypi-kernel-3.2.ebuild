# Copyright (c) 2012 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=4
EGIT_PROJECT="raspberrypi/linux"
EGIT_REPO_URI="git://github.com/${EGIT_PROJECT}.git"
EGIT_BRANCH="rpi-3.2.27"

# To move up to a new commit, you should update this and then bump the
# symlink to a new rev.
EGIT_COMMIT="f9506a194ad6a4afef06cb423286367ab787dee6"

# This must be inherited *after* EGIT/CROS_WORKON variables defined
inherit git cros-kernel2

DESCRIPTION="Chrome OS Kernel-raspberrypi"
KEYWORDS="arm"

DEPEND="!sys-kernel/chromeos-kernel-next
	!sys-kernel/chromeos-kernel
"
RDEPEND="${DEPEND}"

src_install() {
  dodir /lib/firmware
  cros-kernel2_src_install

  ${FILESDIR}/mkimage/imagetool.py "$(get_build_dir)/arch/${ARCH}/boot/Image" \
    "kernel.img"

  insinto /boot
  doins ${FILESDIR}/cmdline.txt
  doins ${FILESDIR}/config.txt
}

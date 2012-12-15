# Copyright (c) 2012 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=4
EGIT_PROJECT="m943040028/android_kernel_asus_tf201"
EGIT_REPO_URI="git://github.com/${EGIT_PROJECT}.git"
EGIT_BRANCH="android-tegra-nv-3.1-asushacks"

# To move up to a new commit, you should update this and then bump the
# symlink to a new rev.
EGIT_COMMIT="fbb24faac4104c0186aaf9fe6ff5888f26dbd740"

# This must be inherited *after* EGIT/CROS_WORKON variables defined
inherit git cros-kernel2

DESCRIPTION="TF201 kernel"
KEYWORDS="arm"

DEPEND="!sys-kernel/chromeos-kernel-next
	!sys-kernel/chromeos-kernel
"
RDEPEND="${DEPEND}"

src_install() {
	dodir /lib/firmware
	cros-kernel2_src_install

	${FILESDIR}/abootimg --create ${T}boot.img -f ${FILESDIR}/bootimg.cfg \
	-k $(get_build_dir)/arch/arm/boot/zImage -r ${FILESDIR}/ramdisk.img

	insinto /boot
	newins ${T}/boot.img boot.img
}

# Copyright (c) 2010 The Chromium OS Authors. All rights reserved.
# Copyright (c) 2011 NVIDIA Corporation
# Distributed under the terms of the GNU General Public License v2

# The package version (i.e. ${PV}) represents the video driver ABI version of
# the server, plus the version of the LDK that the driver comes from.  For
# example, the X driver for xserver 1.9 (which uses ABI version 8) from LDK
# version 1.2.3 would be tegra-drivers-8.1.2.3.

EAPI="4"

inherit cros-binary versionator

DESCRIPTION="Tegra2 user-land drivers"
HOMEPAGE="http://developer.nvidia.com/linux-tegra"

LICENSE="NVIDIA"
SLOT="0"
KEYWORDS="arm"
IUSE="hardfp"

DEPEND=""
RDEPEND="sys-apps/nvrm
	=x11-base/xorg-server-1.12*"

S=${WORKDIR}

src_unpack() {
	CROS_BINARY_URI="http://developer.download.nvidia.com/akamai/mobile/files/L4T/cardhu_Tegra-Linux-R16.2.0_armhf.tbz2"
	CROS_BINARY_SUM="3523dfbfdbfa6c5314784f74c1d9ebb27b16c801"
	cros-binary_src_unpack

	local pkg=${CROS_BINARY_URI##*/}
	ln -s "${CROS_BINARY_STORE_DIR}/${pkg}"
	unpack ./${pkg}
	# Tarballs all the way down!
	unpack ./Linux_for_Tegra/nv_tegra/nvidia_drivers.tbz2
}

src_install() {
	local abinum=$(get_major_version)

	insinto /usr/lib/xorg/modules/drivers
	newins usr/lib/xorg/modules/drivers/tegra_drv.abi${abinum}.so tegra_drv.so
}

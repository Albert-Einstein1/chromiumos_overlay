# Copyright (c) 2010 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=2

inherit cros-binary

DESCRIPTION="OpenMAX binary libraries"
SLOT="0"
KEYWORDS="arm"
IUSE="hardfp"
LICENSE="NVIDIA"

DEPEND=""
RDEPEND="sys-apps/nvrm
	media-libs/openmax-codecs
	virtual/opengles"

src_unpack() {
	CROS_BINARY_URI="http://developer.download.nvidia.com/akamai/mobile/files/L4T/cardhu_Tegra-Linux-R16.2.0_armhf.tbz2"
	CROS_BINARY_SUM="3523dfbfdbfa6c5314784f74c1d9ebb27b16c801"
	cros-binary_src_unpack

	local pkg=${CROS_BINARY_URI##*/}
	ln -s "${CROS_BINARY_STORE_DIR}/${pkg}"
	unpack ./${pkg}

	# Tarballs all the way down!
	tar jxf ./Linux_for_Tegra/nv_tegra/nvidia_drivers.tbz2 -C "${T}"
}


src_install() {
	dolib.so ${T}/usr/lib/libnvomxilclient.so	  	|| die
	dolib.so ${T}/usr/lib/libnvomx.so			|| die
	dosym libnvomx.so /usr/lib/libOmxCore.so		|| die
}

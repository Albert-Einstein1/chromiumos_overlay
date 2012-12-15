# Copyright (c) 2010 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=2

inherit cros-binary

DESCRIPTION="NVIDIA binary OpenGL|ES libraries for Tegra2"
SLOT="0"
KEYWORDS="arm"
IUSE="hardfp"
LICENSE="NVIDIA"

DEPEND=""
RDEPEND="sys-apps/nvrm
	x11-drivers/opengles-headers
	!x11-drivers/opengles"

src_unpack() {
	CROS_BINARY_URI="http://developer.download.nvidia.com/akamai/mobile/files/L4T/cardhu_Tegra-Linux-R16.2.0_armhf.tbz2"
	CROS_BINARY_SUM="3523dfbfdbfa6c5314784f74c1d9ebb27b16c801"
	cros-binary_src_unpack

	local pkg=${CROS_BINARY_URI##*/}
	ln -s "${CROS_BINARY_STORE_DIR}/${pkg}"
	unpack ./${pkg}
}

src_install() {
	# Tarballs all the way down!
	tar jxf ./Linux_for_Tegra/nv_tegra/nvidia_drivers.tbz2 -C ${T}

	insinto /usr/lib
	newins ${T}/usr/lib/libEGL.so.1 libEGL.so.1		|| die
	fperms 0755 /usr/lib/libEGL.so.1			|| die
	dosym libEGL.so.1 /usr/lib/libEGL.so			|| die

	newins ${T}/usr/lib/libGLESv2.so.2 libGLESv2.so.2	|| die
	fperms 0755 /usr/lib/libGLESv2.so.2			|| die
	dosym libGLESv2.so.2 /usr/lib/libGLESv2.so		|| die
}

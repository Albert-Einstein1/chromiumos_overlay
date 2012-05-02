# Copyright (c) 2010 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=2

inherit cros-binary

DESCRIPTION="OpenMAX binary libraries"
SLOT="0"
KEYWORDS="arm"
LICENSE="NVIDIA"

DEPEND=""
RDEPEND="=sys-apps/nvrm-0.0.4*
	media-libs/openmax-codecs
	virtual/opengles"

CROS_BINARY_URI="http://developer.download.nvidia.com/assets/tools/files/l4t/r15_beta/cardhu_Tegra-Linux-R15.beta.1.0_armel.tbz2"
CROS_BINARY_SUM="bf5f5fab362ee5fdf89f11b11a8883cdb0b6ccd8"

src_install() {
	local target="${CROS_BINARY_STORE_DIR}/${CROS_BINARY_URI##*/}"
	tar xpjf "${target}" -C "${T}" || die "Failed to unpack ${target}"
	tar xpzf "${T}/Linux_for_Tegra/nv_tegra/base.tgz" -C "${T}" || die "Failed to unpack base"

	dolib.so ${T}/usr/lib/libnvomxilclient.so	  	|| die
	dolib.so ${T}/usr/lib/libnvomx.so			|| die
	dosym libnvomx.so /usr/lib/libOmxCore.so		|| die
}

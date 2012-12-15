# Copyright (c) 2010 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=2

inherit cros-binary

DESCRIPTION="NVIDIA binary nvrm daemon and libraries for Tegra2"
SLOT="0"
KEYWORDS="arm"
IUSE="hardfp"
LICENSE="NVIDIA"

RDEPEND=""
DEPEND="${RDEPEND}"

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

	insinto /lib/firmware
	doins ${T}/lib/firmware/nvavp_os_0ff00000.bin		|| die
	fperms 0644 /lib/firmware/nvavp_os_0ff00000.bin		|| die
	doins ${T}/lib/firmware/nvavp_os_eff00000.bin		|| die
	fperms 0644 /lib/firmware/nvavp_os_eff00000.bin		|| die
	doins ${T}/lib/firmware/nvavp_vid_ucode_alt.bin		|| die
	fperms 0644 /lib/firmware/nvavp_vid_ucode_alt.bin	|| die
	doins ${T}/lib/firmware/nvrm_avp_0ff00000.bin		|| die
	fperms 0644 /lib/firmware/nvrm_avp_0ff00000.bin		|| die
	doins ${T}/lib/firmware/nvrm_avp_8e000000.bin		|| die
	fperms 0644 /lib/firmware/nvrm_avp_8e000000.bin		|| die
	doins ${T}/lib/firmware/nvrm_avp_9e000000.bin		|| die
	fperms 0644 /lib/firmware/nvrm_avp_9e000000.bin		|| die
	doins ${T}/lib/firmware/nvrm_avp_be000000.bin		|| die
	fperms 0644 /lib/firmware/nvrm_avp_be000000.bin		|| die
	doins ${T}/lib/firmware/nvrm_avp_eff00000.bin		|| die
	fperms 0644 /lib/firmware/nvrm_avp_eff00000.bin		|| die

	dolib.so ${T}/usr/lib/libardrv_dynamic.so	||die
	dolib.so ${T}/usr/lib/libcgdrv.so	||die
	dolib.so ${T}/usr/lib/libKD.so	||die
	dolib.so ${T}/usr/lib/libnvapputil.so	||die
	dolib.so ${T}/usr/lib/libnvavp.so	||die
	dolib.so ${T}/usr/lib/libnvcwm.so	||die
	dolib.so ${T}/usr/lib/libnvdc.so	||die
	dolib.so ${T}/usr/lib/libnvddk_2d.so	||die
	dolib.so ${T}/usr/lib/libnvddk_2d_v2.so	||die
	dolib.so ${T}/usr/lib/libnvddk_disp.so	||die
	dolib.so ${T}/usr/lib/libnvddk_kbc.so	||die
	dolib.so ${T}/usr/lib/libnvddk_mipihsi.so	||die
	dolib.so ${T}/usr/lib/libnvddk_nand.so	||die
	dolib.so ${T}/usr/lib/libnvddk_se.so	||die
	dolib.so ${T}/usr/lib/libnvddk_snor.so	||die
	dolib.so ${T}/usr/lib/libnvddk_spif.so	||die
	dolib.so ${T}/usr/lib/libnvddk_usbphy.so	||die
	dolib.so ${T}/usr/lib/libnvdispatch_helper.so	||die
	dolib.so ${T}/usr/lib/libnvglsi.so	||die
	dolib.so ${T}/usr/lib/libnvmedia_audio.so	||die
	dolib.so ${T}/usr/lib/libnvmm_audio.so	||die
	dolib.so ${T}/usr/lib/libnvmm_camera.so	||die
	dolib.so ${T}/usr/lib/libnvmm_contentpipe.so	||die
	dolib.so ${T}/usr/lib/libnvmm_image.so	||die
	dolib.so ${T}/usr/lib/libnvmmlite_audio.so	||die
	dolib.so ${T}/usr/lib/libnvmmlite_image.so	||die
	dolib.so ${T}/usr/lib/libnvmmlite.so	||die
	dolib.so ${T}/usr/lib/libnvmmlite_utils.so	||die
	dolib.so ${T}/usr/lib/libnvmmlite_video.so	||die
	dolib.so ${T}/usr/lib/libnvmm_manager.so	||die
	dolib.so ${T}/usr/lib/libnvmm_parser.so	||die
	dolib.so ${T}/usr/lib/libnvmm_service.so	||die
	dolib.so ${T}/usr/lib/libnvmm.so	||die
	dolib.so ${T}/usr/lib/libnvmm_utils.so	||die
	dolib.so ${T}/usr/lib/libnvmm_video.so	||die
	dolib.so ${T}/usr/lib/libnvmm_writer.so	||die
	dolib.so ${T}/usr/lib/libnvodm_disp.so	||die
	dolib.so ${T}/usr/lib/libnvodm_dtvtuner.so	||die
	dolib.so ${T}/usr/lib/libnvodm_imager.so	||die
	dolib.so ${T}/usr/lib/libnvodm_misc.so	||die
	dolib.so ${T}/usr/lib/libnvodm_query.so	||die
	dolib.so ${T}/usr/lib/libnvos.so	||die
	dolib.so ${T}/usr/lib/libnvparser.so	||die
	dolib.so ${T}/usr/lib/libnvrm_graphics.so	||die
	dolib.so ${T}/usr/lib/libnvrm.so	||die
	dolib.so ${T}/usr/lib/libnvsm.so	||die
	dolib.so ${T}/usr/lib/libnvtestio.so	||die
	dolib.so ${T}/usr/lib/libnvtestresults.so	||die
	dolib.so ${T}/usr/lib/libnvtvmr.so	||die
	dolib.so ${T}/usr/lib/libnvwinsys.so	||die
	dolib.so ${T}/usr/lib/libnvwsi.so	||die

	insinto /etc/udev/rules.d
	doins ${FILESDIR}/etc/udev/rules.d/51-nvrm.rules        || die
}

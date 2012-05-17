# Copyright (c) 2012 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=4
EGIT_PROJECT="user/amartin/linux-2.6"
EGIT_REPO_URI="git://nv-tegra.nvidia.com/${EGIT_PROJECT}.git"
EGIT_BRANCH="chromeos-3.0"

# To move up to a new commit, you should update this and then bump the
# symlink to a new rev.
EGIT_COMMIT="2ebd7f4990e6e73277b50b8bd96c2000625e3b0c"

# This must be inherited *after* EGIT/CROS_WORKON variables defined
inherit git cros-kernel2

DESCRIPTION="Chrome OS Kernel-waluigi"
KEYWORDS="amd64 arm x86"

DEPEND="!sys-kernel/chromeos-kernel-next
	!sys-kernel/chromeos-kernel
"
RDEPEND="${DEPEND}"

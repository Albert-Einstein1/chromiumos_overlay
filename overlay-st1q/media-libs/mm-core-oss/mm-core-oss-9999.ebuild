# Copyright (c) 2010 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=2

# EGIT_BRANCH must be set prior to 'inherit git' being used by cros-workon
EGIT_BRANCH="froyo"

if [[ -n "${PRIVATE_REPO}" ]] ; then
	CROS_WORKON_REPO="${PRIVATE_REPO}"
	CROS_WORKON_PROJECT="platform/vendor/qcom-opensource/omx/mm-core"
	CROS_WORKON_LOCALNAME="qcom/opensource/omx/mm-core"
else
    CROS_WORKON_PROJECT="mm-core"
fi

inherit cros-workon toolchain-funcs

DESCRIPTION="omx multi-media core libraries"
HOMEPAGE="http://src.chromium.org"
SRC_URI=""
LICENSE="BSD"
SLOT="0"
KEYWORDS="~arm"
IUSE=""

RDEPEND=""
DEPEND="chromeos-base/kernel"


src_compile() {
	tc-export CC CXX
	emake CCC="${CXX}" LIBVER="9.9.99" || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" LIBVER="9.9.99" install || die "emake install failed"
}

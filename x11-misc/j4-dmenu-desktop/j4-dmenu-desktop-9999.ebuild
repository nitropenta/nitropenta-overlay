# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3 cmake-utils

DESCRIPTION="A rewrite of i3-dmenu-desktop, which is much faster"
HOMEPAGE="https://github.com/enkore/j4-dmenu-desktop"
EGIT_REPO_URI="git://github.com/enkore/j4-dmenu-desktop.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="x11-misc/dmenu"

PATCHES=(
	"${FILESDIR}"/${PN}-9999-fix_locale.patch
)

src_prepare() {
	epatch "${PATCHES[@]}"

	eapply_user
}

src_configure() {
	local mycmakeargs=(
		-DNO_TESTS=1
	)
	cmake-utils_src_configure
}

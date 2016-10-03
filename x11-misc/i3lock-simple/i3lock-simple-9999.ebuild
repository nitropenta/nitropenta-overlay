# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils toolchain-funcs git-r3

DESCRIPTION="Simple screen locker"
HOMEPAGE="https://github.com/nitropenta/i3lock-simple"
EGIT_REPO_URI="https://github.com/nitropenta/i3lock-simple.git"
EGIT_BRANCH=master

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="media-libs/imlib2[png]
	x11-misc/i3lock-color"
DEPEND=""
DOCS=( README.md )

src_prepare() {
	path=/usr/share/${PN}
	sed -ie "s:SCRIPTPATH=.*:SCRIPTPATH=${path}:" lock || die
	eapply_user
}

src_install() {
	newbin lock ${PN}
	insinto /usr/share/${PN}
	doins background.png
}

# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils git-r3 autotools
# multilib-minimal

DESCRIPTION="YubiKey Personalization cross-platform library and tool"
HOMEPAGE=""
SRC_URI=""
EGIT_REPO_URI="https://github.com/Yubico/yubikey-personalization.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-auth/libyubikey"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply "${FILESDIR}/yubikey-ar.patch"
	default
	eautoreconf
#	multilib_copy_sources
}

#multilib_
src_configure() {
	econf --disable-static || die "Failed"
}

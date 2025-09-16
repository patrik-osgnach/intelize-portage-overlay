# Copyright 2011-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker systemd

DESCRIPTION="sshd intel configs"
HOMEPAGE="https://it.intel.com"


SRC_URI="https://litr.intel.com/client/ubuntu/pool/main/s/${PN}/${PN}_${PV//_p/-}_all.deb"
S=${WORKDIR}

SLOT="0"
KEYWORDS="amd64"

src_install() {
	gunzip "${WORKDIR}"/usr/share/doc/sshd-intelit/changelog.gz
	dodoc "${WORKDIR}"/usr/share/doc/sshd-intelit/{copyright,changelog}
	cp -R "${WORKDIR}/etc" "${D}" || die "install failed!"
	cp -R "${WORKDIR}/opt" "${D}" || die "install failed!"
	cp -R "${WORKDIR}/home" "${D}" || die "install failed!"
	systemd_newunit "${WORKDIR}"/etc/systemd/system/sshd-intelit.service sshd-intelit.service
}

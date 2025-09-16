# Copyright 2011-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker systemd

DESCRIPTION="Fleetdm Osquery"
HOMEPAGE="https://fleetdm.com"
SLOT="0"


SRC_URI="https://litr.intel.com/client/ubuntu/pool/main/f/fleet-osquery/${PN}_${PV}_amd64.deb"
S=${WORKDIR}

KEYWORDS="amd64"

src_install() {
	rm -f "${WORKDIR}/usr/local/bin/orbit"
	exeinto /usr/bin
    doexe "${FILESDIR}/orbit"
	into /
	systemd_newunit "${WORKDIR}"/usr/lib/systemd/system/orbit.service orbit.service
	doins -r "${WORKDIR}/etc"
	doins -r "${WORKDIR}/opt"
    chmod 755 "${D}/opt/orbit/bin/orbit/linux/stable/orbit"
    chmod 755 "${D}/opt/orbit/bin/desktop/linux/stable/fleet-desktop/fleet-desktop"
    chmod 755 "${D}/opt/orbit/bin/osqueryd/linux/stable/osqueryd"
    chmod 600 "${D}/opt/orbit/updates-metadata.json"
}

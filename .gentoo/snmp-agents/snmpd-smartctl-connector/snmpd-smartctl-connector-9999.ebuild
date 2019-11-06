# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="An SNMP extension script to provide access to harddisk SMART data"
HOMEPAGE="https://github.com/GITHUB_REPOSITORY"
LICENSE="GPL-3"

if [[ ${PV} = *9999* ]]; then
    inherit git-r3
    EGIT_REPO_URI="https://github.com/GITHUB_REPOSITORY"
    EGIT_BRANCH="GITHUB_REF"
else
    SRC_URI="https://github.com/GITHUB_REPOSITORY/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

KEYWORDS="amd64 x86"
IUSE="test"
SLOT="0"

RESTRICT="!test? ( test )"

RDEPEND=">=dev-libs/snmpd-connector-lib-1.0.0
         >=snmp-mibs/smartctl-snmp-mib-0.3
         sys-apps/smartmontools"
DEPEND="test? ( 
    ${RDEPEND}
    dev-util/bats-assert
)"

src_test() {
    bats --tap tests || die "Tests failed"
}

src_install() {
    einstalldocs

    exeinto /usr/sbin
    doexe usr/sbin/*

    insinto /etc
    doins etc/*
}

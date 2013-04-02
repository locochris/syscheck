#!/bin/sh -ex
ORG=locochris
PKG=syscheck
VERSION=0.0.10

DEPENDENCIES=shpec/shpec:0.0.9

TMPDIR=${TMPDIR:-/tmp}

install_dependencies() {
  for dependency_and_version in $@; do
    dependency=`echo $dependency_and_version|cut -d: -f1`
    version=`echo $dependency_and_version|cut -d: -f2`
    if ! command -v shpec >/dev/null 2>&1 || [ `shpec --version` != $version ]; then
      sh -c "`curl https://raw.github.com/$dependency/master/install.sh`"
    fi
  done
}

install_pkg() {
  org=${1:-$ORG}
  pkg=${2:-$PKG}
  version=${3:-$VERSION}

  pkgdir=${TMPDIR}/${pkg}-${version}

  cd $TMPDIR
  curl -sL https://github.com/${org}/${pkg}/archive/${version}.tar.gz | tar zxf -
  cd $pkgdir
  make install
  cd $TMPDIR
  rm -rf $PKGDIR
}

install_dependencies $DEPENDENCIES
install_pkg $ORG $PKG $VERSION

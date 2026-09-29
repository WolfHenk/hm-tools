#!/bin/bash
set -euo pipefail

# script to generate the CCU addon package.

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$ROOT_DIR"

# generate tempdir
mkdir -p tmp/
rm -rf tmp/*

# copy all relevant stuff
cp -a update_script tmp/
cp -a VERSION tmp/
cp -a www tmp/
cp -a rc.d tmp/
cp -a profile.d tmp/
cp -a licenses tmp/

copy_arch_tools() {
  local arch="$1"
  shift

  mkdir -p "tmp/${arch}"

  for tool in "$@"; do
    if [[ ! -d "${arch}/${tool}" ]]; then
      echo "Missing ${arch}/${tool}" >&2
      exit 1
    fi
    cp -a "${arch}/${tool}" "tmp/${arch}/"
  done
}

### Hier können einzelne Programme !!! abgewählt !!! werden ###
# Die Liste TOOLS anpassen, wenn ein Programm nicht ins Paket soll.
# Raspberry Pi 5 und Compute Module 5 verwenden den aarch64-Bereich.

TOOLS=(mc nano htop bash imagemagick sshpass oathtool iostat)

copy_arch_tools arm "${TOOLS[@]}"
copy_arch_tools aarch64 "${TOOLS[@]}"
copy_arch_tools x86 "${TOOLS[@]}"

###############################################################

# generate archive
(
  cd tmp
  tar --owner=root --group=root --exclude=.DS_Store -czvf "../hm-tools-$(cat ../VERSION).tar.gz" *
)

rm -rf tmp

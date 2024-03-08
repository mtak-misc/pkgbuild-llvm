#!/bin/sh
USERID=$1

rm *debug*.zstd
pacman -Syu --noconfirm base-devel sudo git python-myst-parser
pacman -U llvm-*.zstd llvm-libs-*.zstd
useradd builder -u ${USERID} -m -G wheel && echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
#chown builder -R ..
#chown builder -R /tmp
#cd ./llvm-git ; su builder -c "yes '' | MAKEFLAGS=\"-j $(nproc)\" makepkg --noconfirm --nocheck --skippgpcheck -sc"

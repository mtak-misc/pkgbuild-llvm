#!/bin/sh
USERID=$1

pacman -Syu --noconfirm base-devel sudo git python-myst-parser
useradd builder -u ${USERID} -m -G wheel && echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

pacman --noconfirm -U llvm-*.zst compiler-rt-*.zst
rm llvm-*.zst compiler-rt-*.zst

cd ./clang ; su builder -c "yes '' | MAKEFLAGS=\"-j $(nproc)\" nice -n 10 makepkg --noconfirm --nocheck --skippgpcheck -sc"
rm clang-debug*.zst
mv clang-*.zst ..

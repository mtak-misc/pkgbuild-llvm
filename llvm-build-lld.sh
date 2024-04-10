#!/bin/sh
USERID=$1

pacman -Syu --noconfirm base-devel sudo git python-myst-parser
useradd builder -u ${USERID} -m -G wheel && echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

pacman --noconfirm -U *.pkg.tar.zst
export CC=clang
export CXX=clang++

cd ./lld ; su builder -c "yes '' | MAKEFLAGS=\"-j $(nproc)\" makepkg --noconfirm --nocheck --skippgpcheck -sc"
rm lld-debug*.zst
mv lld-*.zst ..

cd ..
rm llvm-*.zst
rm compiler-rt-*.zst
rm clang-*.zst

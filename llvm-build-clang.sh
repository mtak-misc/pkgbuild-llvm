#!/bin/sh
USERID=$1

pacman -Syu --noconfirm base-devel sudo git python-myst-parser
useradd builder -u ${USERID} -m -G wheel && echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

pacman --noconfirm -U *.pkg.tar.zst
export CC=clang
export CXX=clang++

cd ./clang ; su builder -c "yes '' | nice -n 10 MAKEFLAGS=\"-j $(nproc)\" makepkg --noconfirm --nocheck --skippgpcheck -sc"
rm clang-debug*.zst
mv clang-*.zst ..

cd ..
rm llvm-*.zst
rm compiler-rt-*.zst
rm lld-*.zst

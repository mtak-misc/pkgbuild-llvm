#!/bin/sh
USERID=$1

pacman -Syu --noconfirm base-devel sudo git python-myst-parser
useradd builder -u ${USERID} -m -G wheel && echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

pacman -S --noconfirm llvm compiler-rt clang lld
export CC=clang
export CXX=clang++

cd ./llvm ; su builder -c "yes '' | MAKEFLAGS=\"-j $(nproc)\" makepkg --noconfirm --nocheck --skippgpcheck -sc"
rm llvm-debug*.zst
#pacman -U --noconfirm llvm-*.zst
mv llvm-*.zst ..
cd ..
#rm -rf llvm

cd ./compiler-rt ; su builder -c "yes '' | MAKEFLAGS=\"-j $(nproc)\" makepkg --noconfirm --nocheck --skippgpcheck -sc"
rm compiler-rt-debug*.zst
#pacman -U --noconfirm compiler-rt-*.zst
mv compiler-rt-*.zst ..
cd ..
#rm -rf compiler-rt

cd ./clang ; su builder -c "yes '' | MAKEFLAGS=\"-j $(nproc)\" makepkg --noconfirm --nocheck --skippgpcheck -sc"
rm clang-debug*.zst
#pacman -U --noconfirm clang-*.zst
mv clang-*.zst ..
cd ..
#rm -rf clang

cd ./lld ; su builder -c "yes '' | MAKEFLAGS=\"-j $(nproc)\" makepkg --noconfirm --nocheck --skippgpcheck -sc"
rm lld-debug*.zst
mv lld-*.zst ..

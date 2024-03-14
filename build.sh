#!/bin/sh
USERID=$1

pacman -Syu --noconfirm base-devel sudo git python-myst-parser
useradd builder -u ${USERID} -m -G wheel && echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RES=`find ./ -maxdepth 1 -name *.pkg.tar.zst 2>/dev/null`

if [ $? -ne 0 ]; then
  echo 'Unexpected error.'
  echo $RES
elif [ -z "$RES" ]; then
  echo 'No packages.'
else
  pacman --noconfirm -U *.pkg.tar.zst
  export CC=clang
  export CXX=clang++
fi

cd ./llvm ; su builder -c "yes '' | MAKEFLAGS=\"-j $(nproc)\" makepkg --noconfirm --nocheck --skippgpcheck -sc"
rm llvm-debug*.zst
pacman -U --noconfirm llvm-*.zst

cd ../compiler-rt ; su builder -c "yes '' | MAKEFLAGS=\"-j $(nproc)\" makepkg --noconfirm --nocheck --skippgpcheck -sc"
rm compiler-rt-debug*.zst
pacman -U --noconfirm compiler-rt-*.zst

cd ../clang ; su builder -c "yes '' | MAKEFLAGS=\"-j $(nproc)\" makepkg --noconfirm --nocheck --skippgpcheck -sc"
rm clang-debug*.zst
pacman -U --noconfirm clang-*.zst

cd ../lld ; su builder -c "yes '' | MAKEFLAGS=\"-j $(nproc)\" makepkg --noconfirm --nocheck --skippgpcheck -sc"
rm lld-debug*.zst

cd ..
mv */*.zst .

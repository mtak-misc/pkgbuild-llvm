#!/bin/sh
USERID=$1

pacman -Syu --noconfirm base-devel sudo git python-myst-parser
useradd builder -u ${USERID} -m -G wheel && echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RES=`find ./ -maxdepth 1 -name "*.pkg.tar.zst" 2>/dev/null`
if [ $? -ne 0 ]; then
  echo 'Unexpected error.'
elif [ -z "$RES" ]; then
  echo 'No packages.'
else
  pacman --noconfirm -U *.pkg.tar.zst
  export CC=clang
  export CXX=clang++
fi

cd ./llvm ; su builder -c "yes '' | MAKEFLAGS=\"-j $(nproc)\" makepkg --noconfirm --nocheck --skippgpcheck -sc"
rm llvm-debug*.zst
mv llvm-*.zst ..

if [ -n "$RES" ]; then
  cd ..
  rm compiler-rt-*.zst
  rm clang-*.zst
  rm lld-*.zst
fi

#!/bin/sh
USERID=$1

pacman -Syu --noconfirm base-devel sudo git python-myst-parser
useradd builder -u ${USERID} -m -G wheel && echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RES=`find ./ -maxdepth 1 -name "*.pkg.tar.zst" 2>/dev/null`
if [ $? -ne 0 ]; then
  echo 'Unexpected error.'
elif [ -z "$RES" ]; then
  echo 'No packages.'
  pacman --noconfirm -S llvm compiler-rt clang lld
else
  pacman --noconfirm -U *.pkg.tar.zst
fi

export CC=clang
export CXX=clang++

#cd ./llvm ; su builder -c "yes '' | MAKEFLAGS=\"-j $(nproc)\" makepkg --noconfirm --nocheck --skippgpcheck -sc"
#rm llvm-debug*.zst
#pacman -U --noconfirm llvm-*.zst
#mv llvm-*.zst ..
#cd ..

#cd ./lld ; su builder -c "yes '' | MAKEFLAGS=\"-j $(nproc)\" makepkg --noconfirm --nocheck --skippgpcheck -sc"
#rm lld-debug*.zst
#pacman -U --noconfirm lld-*.zst
#mv lld-*.zst ..
#cd ..

pacman --noconfirm -S cmake ninja lib32-llvm-libs
cd ./compiler-rt ; su builder -c "yes '' | MAKEFLAGS=\"-j $(nproc)\" makepkg --noconfirm --nocheck --skippgpcheck -sc"
rm compiler-rt-debug*.zst
pacman -U --noconfirm compiler-rt-*.zst
mv compiler-rt-*.zst ..
cd ..

#cd ./clang ; su builder -c "yes '' | MAKEFLAGS=\"-j $(nproc)\" makepkg --noconfirm --nocheck --skippgpcheck -sc"
#rm clang-debug*.zst
#mv clang-*.zst ..

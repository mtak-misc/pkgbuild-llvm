#!/bin/sh
NEWVERSION=$1
PKGVERSION=$(grep "pkgver=" clang/PKGBUILD)
OLDVERSION="${PKGVERSION#pkgver=}"
PKGREL=$(grep "pkgrel=" clang/PKGBUILD)

RES=`find ./ -maxdepth 1 -name "*.pkg.tar.zst" 2>/dev/null`
if [ $? -ne 0 ]; then
  echo 'Unexpected error.'
elif [ -z "$RES" ]; then
  echo 'No packages.'
#  pacman --noconfirm -S llvm compiler-rt clang lld
else
  sed -i 's/gcc/clang/g' clang/PKGBUILD
fi

#sed -i 's/gcc/clang/g' clang/PKGBUILD
#echo "sed -i 's/${OLDVERSION}/${NEWVERSION}/g' clang/PKGBUILD" | bash
#echo "sed -i 's/${PKGREL}/pkgrel=1/g' clang/PKGBUILD" | bash
#grep -oP "'\K[a-f0-9]{64}(?='.*)" clang/PKGBUILD | awk '{print "sed -i \x27s/"$1"/SKIP/g\x27 clang/PKGBUILD"}' | bash

#sed -i '/patch -Np2/d' clang/PKGBUILD 
# sed -i '/clang-tools-extra|clang/d' clang/PKGBUILD
#sed -i 's/-DLLVM_BUILD_TESTS=ON/-DLLVM_BUILD_TESTS=OFF/g' clang/PKGBUILD

#!/bin/sh
NEWVERSION=$1
LLVMBUILD=$2
PKGVERSION=$(grep "pkgver=" llvm/PKGBUILD)
OLDVERSION="${PKGVERSION#pkgver=}"
PKGREL=$(grep "pkgrel=" llvm/PKGBUILD)

RES=`find ./ -maxdepth 1 -name "*.pkg.tar.zst" 2>/dev/null`
if [ $? -ne 0 ]; then
  echo 'Unexpected error.'
elif [ -z "$RES" ]; then
  echo 'No packages.'
#  pacman --noconfirm -S llvm compiler-rt clang lld 
  if [ ${LLVMBUILD} = "true" ]; then
    sed -i 's/gcc-libs/llvm-libs/g' llvm/PKGBUILD
  fi
else
  sed -i 's/gcc-libs/llvm-libs/g' llvm/PKGBUILD
fi
#sed -i 's/gcc-libs/llvm-libs/g' llvm/PKGBUILD
echo "sed -i 's/${OLDVERSION}/${NEWVERSION}/g' llvm/PKGBUILD" | bash
echo "sed -i 's/${PKGREL}/pkgrel=1/g' llvm/PKGBUILD" | bash
grep -oP "'\K[a-f0-9]{64}(?='.*)" llvm/PKGBUILD | awk '{print "sed -i \x27s/"$1"/SKIP/g\x27 llvm/PKGBUILD"}' | bash

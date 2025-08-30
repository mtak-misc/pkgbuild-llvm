#!/bin/sh
NEWVERSION=$1
PKGVERSION=$(grep "pkgver=" compiler-rt/PKGBUILD)
OLDVERSION="${PKGVERSION#pkgver=}"
PKGREL=$(grep "pkgrel=" compiler-rt/PKGBUILD)

RES=`find ./ -maxdepth 1 -name "*.pkg.tar.zst" 2>/dev/null`
if [ $? -ne 0 ]; then
  echo 'Unexpected error.'
elif [ -z "$RES" ]; then
  echo 'No packages.'
#  pacman --noconfirm -S llvm compiler-rt clang lld
else
  sed -i "s/'gcc-libs/'llvm-libs/g" compiler-rt/PKGBUILD
fi
#sed -i "s/'gcc-libs/'llvm-libs/g" compiler-rt/PKGBUILD
sed -i '/makedepends_x86_64/d' compiler-rt/PKGBUILD
echo "sed -i 's/${OLDVERSION}/${NEWVERSION}/g' compiler-rt/PKGBUILD" | bash
echo "sed -i 's/${PKGREL}/pkgrel=1/g' compiler-rt/PKGBUILD" | bash
grep -oP "'\K[a-f0-9]{64}(?='.*)" compiler-rt/PKGBUILD | awk '{print "sed -i \x27s/"$1"/SKIP/g\x27 compiler-rt/PKGBUILD"}' | bash
#sed -i 's/llvm-lib32-libs/lib32-llvm-libs/g' compiler-rt/PKGBUILD

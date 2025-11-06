#!/bin/sh
NEWVERSION=$1
LLVMBUILD=$2
PKGVERSION=$(grep "pkgver=" lld/PKGBUILD)
OLDVERSION="${PKGVERSION#pkgver=}"
PKGREL=$(grep "pkgrel=" lld/PKGBUILD)

RES=`find ./ -maxdepth 1 -name "*.pkg.tar.zst" 2>/dev/null`
if [ $? -ne 0 ]; then
  echo 'Unexpected error.'
elif [ -z "$RES" ]; then
  echo 'No packages.'
#  pacman --noconfirm -S llvm compiler-rt clang lld
  if [ ${LLVMBUILD} = "true" ]; then
    sed -i "s/'llvm-libs' 'gcc-libs'/'llvm-libs'/g" lld/PKGBUILD
  fi
else
  sed -i "s/'llvm-libs' 'gcc-libs'/'llvm-libs'/g" lld/PKGBUILD
fi

#sed -i "s/'llvm-libs' 'gcc-libs'/'llvm-libs'/g" lld/PKGBUILD
echo "sed -i 's/${OLDVERSION}/${NEWVERSION}/g' lld/PKGBUILD" | bash
echo "sed -i 's/${PKGREL}/pkgrel=1/g' lld/PKGBUILD" | bash
grep -oP "'\K[a-f0-9]{64}(?='.*)" lld/PKGBUILD | awk '{print "sed -i \x27s/"$1"/SKIP/g\x27 lld/PKGBUILD"}' | bash

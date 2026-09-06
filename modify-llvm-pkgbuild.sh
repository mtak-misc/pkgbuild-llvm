#!/bin/sh
NEWVERSION=$1
LLVMBUILD=$2
PKGVERSION=$(grep "pkgver=" llvm/PKGBUILD)
OLDVERSION="${PKGVERSION#pkgver=}"
PKGREL=$(grep "pkgrel=" llvm/PKGBUILD)

sed -i '/patch -Np2 -i/d' llvm/PKGBUILD
sed -i \
  -e 's/0001-SDAG-Freeze-condition-in-select-of-load-fold-208683.patch//g' \
  -e "s/'91eaec904dcc7e02cd4f5007d844e0b7cb34a2cd8b9757d8a3f329383978bb20'//g" \
  llvm/PKGBUILD  

cat llvm/PKGBUILD  

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
grep -oP "(?<=')[a-f0-9]{64}(?=')" llvm/PKGBUILD | awk '{print "sed -i \x27s/"$1"/SKIP/g\x27 llvm/PKGBUILD"}' | bash

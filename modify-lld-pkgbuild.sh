#!/bin/sh
NEWVERSION=$1
PKGVERSION=$(grep "pkgver=" lld/PKGBUILD)
OLDVERSION="${PKGVERSION#pkgver=}"
PKGREL=$(grep "pkgrel=" lld/PKGBUILD)

#sed -i "s/'llvm-libs' 'gcc-libs'/'llvm-libs'/g" lld/PKGBUILD
echo "sed -i 's/${OLDVERSION}/${NEWVERSION}/g' lld/PKGBUILD" | bash
echo "sed -i 's/${PKGREL}/pkgrel=1/g' lld/PKGBUILD" | bash
grep -oP "'\K[a-f0-9]{64}(?='.*)" lld/PKGBUILD | awk '{print "sed -i \x27s/"$1"/SKIP/g\x27 lld/PKGBUILD"}' | bash

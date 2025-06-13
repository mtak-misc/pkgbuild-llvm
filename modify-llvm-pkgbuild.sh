#!/bin/sh
NEWVERSION=$1
PKGVERSION=$(grep "pkgver=" llvm/PKGBUILD)
OLDVERSION="${PKGVERSION#pkgver=}"
PKGREL=$(grep "pkgrel=" PKGBUILD)

echo "sed -i 's/${OLDVERSION}/${NEWVERSION}/g' llvm/PKGBUILD" | bash
echo "sed -i 's/${PKGREL}/pkgrel=1/g' llvm/PKGBUILD" | bash
grep -oP "'\K[a-f0-9]{64}(?='.*)" llvm/PKGBUILD | awk '{print "sed -i \x27s/"$1"/SKIP/g\x27 llvm/PKGBUILD"}' | bash

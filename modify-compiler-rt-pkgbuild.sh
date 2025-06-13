#!/bin/sh
NEWVERSION=$1
PKGVERSION=$(grep "pkgver=" compiler-rt/PKGBUILD)
OLDVERSION="${PKGVERSION#pkgver=}"
PKGREL=$(grep "pkgrel=" PKGBUILD)

echo "sed -i 's/${OLDVERSION}/${NEWVERSION}/g' compiler-rt/PKGBUILD" | bash
echo "sed -i 's/${PKGREL}/pkgrel=1/g' compiler-rtPKGBUILD" | bash
grep -oP "'\K[a-f0-9]{64}(?='.*)" compiler-rt/PKGBUILD | awk '{print "sed -i \x27s/"$1"/SKIP/g\x27 compiler-rt/PKGBUILD"}' | bash

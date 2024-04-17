#!/bin/sh

sed -i 's/pkgver=17.0.6/pkgver=18.1.4/g' compiler-rt/PKGBUILD
sed -i 's/11b8d09dcf92a0f91c5c82defb5ad9ff4acf5cf073a80c317204baa922d136b4/SKIP/g' compiler-rt/PKGBUILD
sed -i 's/807f069c54dc20cb47b21c1f6acafdd9c649f3ae015609040d6182cab01140f4/SKIP/g' compiler-rt/PKGBUILD

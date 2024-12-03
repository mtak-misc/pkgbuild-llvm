#!/bin/sh

sed -i 's/pkgver=18.1.8/pkgver=19.1.5/g' llvm/PKGBUILD
sed -i 's/pkgrel=5/pkgrel=1/g' llvm/PKGBUILD
sed -i 's/f68cf90f369bc7d0158ba70d860b0cb34dbc163d6ff0ebc6cfa5e515b9b2e28d/SKIP/g' llvm/PKGBUILD
sed -i 's/59badef592dd34893cd319d42b323aaa990b452d05c7180ff20f23ab1b41e837/SKIP/g' llvm/PKGBUILD
sed -i 's/b76b810f3d3dc5d08e83c4236cb6e395aa9bd5e3ea861e8c319b216d093db074/SKIP/g' llvm/PKGBUILD
sed -i '/patch -Np2/d' llvm/PKGBUILD

#!/bin/sh

sed -i 's/pkgver=17.0.6/pkgver=18.1.5/g' clang/PKGBUILD
sed -i 's/pkgrel=2/pkgrel=1/g' clang/PKGBUILD
sed -i 's/a78f668a726ae1d3d9a7179996d97b12b90fb76ab9442a43110b972ff7ad9029/SKIP/g' clang/PKGBUILD
sed -i 's/aa774642415d338d7b77a66fcbad6fd1f77f382dabcb67422a6230614eff1ab9/SKIP/g' clang/PKGBUILD
sed -i 's/b638167da139126ca11917b6880207cc6e8f9d1cbb1a48d87d017f697ef78188/SKIP/g' clang/PKGBUILD
sed -i 's/807f069c54dc20cb47b21c1f6acafdd9c649f3ae015609040d6182cab01140f4/SKIP/g' clang/PKGBUILD
sed -i 's/3054d0a9c9375dab1a4539cc2cc45ab340341c5d71475f9599ba7752e222947b/SKIP/g' clang/PKGBUILD
sed -i '/patch -Np2/d' clang/PKGBUILD 
sed -i '/clang-tools-extra|clang/d' clang/PKGBUILD
sed -i 's/-DLLVM_BUILD_TESTS=ON/-DLLVM_BUILD_TESTS=OFF/g' clang/PKGBUILD

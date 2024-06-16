#!/bin/sh

sed -i 's/pkgver=17.0.6/pkgver=18.1.7/g' llvm/PKGBUILD
sed -i 's/pkgrel=5/pkgrel=1/g' llvm/PKGBUILD
sed -i 's/b638167da139126ca11917b6880207cc6e8f9d1cbb1a48d87d017f697ef78188/SKIP/g' llvm/PKGBUILD
sed -i 's/807f069c54dc20cb47b21c1f6acafdd9c649f3ae015609040d6182cab01140f4/SKIP/g' llvm/PKGBUILD
sed -i 's/3054d0a9c9375dab1a4539cc2cc45ab340341c5d71475f9599ba7752e222947b/SKIP/g' llvm/PKGBUILD
sed -i '/mkdir build/i \ \ curl -L https://github.com/llvm/llvm-project/commit/f800c1f3b207e7bcdc8b4c7192928d9a078242a0.patch -o ../llvm.patch' llvm/PKGBUILD 
sed -i '/mkdir build/i \ \ ln -s llvm-$pkgver.src llvm' llvm/PKGBUILD
sed -i '/mkdir build/i \ \ cd .. ; patch -Np1 -i llvm.patch' llvm/PKGBUILD

#!/bin/sh

sed -i 's/pkgver=19.1.6/pkgver=19.1.7/g' clang/PKGBUILD
#sed -i 's/pkgrel=5/pkgrel=1/g' clang/PKGBUILD
sed -i 's/ad1a3b125ff014ded290094088de40efb9193ce81a24278184230b7d401f8a3e/SKIP/g' clang/PKGBUILD
sed -i 's/9c7ec82d9a240dc2287b8de89d6881bb64ceea0dcd6ce133c34ef65bda22d99e/SKIP/g' clang/PKGBUILD
sed -i 's/0e8048333bab2ba3607910e5d074259f08dccf00615778d03a2a55416718eb45/SKIP/g' clang/PKGBUILD
#sed -i 's/59badef592dd34893cd319d42b323aaa990b452d05c7180ff20f23ab1b41e837/SKIP/g' clang/PKGBUILD
#sed -i 's/b76b810f3d3dc5d08e83c4236cb6e395aa9bd5e3ea861e8c319b216d093db074/SKIP/g' clang/PKGBUILD
#sed -i '/patch -Np2/d' clang/PKGBUILD 
#sed -i '/clang-tools-extra|clang/d' clang/PKGBUILD
#sed -i 's/-DLLVM_BUILD_TESTS=ON/-DLLVM_BUILD_TESTS=OFF/g' clang/PKGBUILD
#sed -i 's/0d4dc477f5a28f9f16639dc094b6d9bc14228d5de771547394799d2d5f8cd1df/SKIP/g' clang/PKGBUILD

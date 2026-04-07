#!/bin/sh
USERID=$1 
LLVMBUILD=$2

pacman -Syu --noconfirm base-devel sudo git python-myst-parser
useradd builder -u ${USERID} -m -G wheel && echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RES=`find ./ -maxdepth 1 -name "*.pkg.tar.zst" 2>/dev/null`
if [ $? -ne 0 ]; then
  echo 'Unexpected error.'
elif [ -z "$RES" ]; then
  echo 'No packages.'
  #
  if [ ${LLVMBUILD} = "true" ]; then
    export CC=clang
    export CXX=clang++
    pacman --noconfirm -S llvm compiler-rt clang lld
#    curl -L https://archlinux.org/packages/extra-staging/x86_64/llvm/download/ -o llvm-x86_64.pkg.tar.zst
#    curl -L https://archlinux.org/packages/extra-staging/x86_64/llvm-libs/download/ -o llvm-libs-x86_64.pkg.tar.zst
#    curl -L https://archlinux.org/packages/extra-staging/x86_64/lld/download/ -o lld-x86_64.pkg.tar.zst
#    curl -L https://archlinux.org/packages/extra-staging/x86_64/compiler-rt/download/ -o compiler-rt-x86_64.pkg.tar.zst
#    curl -L https://archlinux.org/packages/extra-staging/x86_64/clang/download/ -o clang-x86_64.pkg.tar.zst

#    pacman --noconfirm -U *.pkg.tar.zst

  fi
else
  pacman --noconfirm -U *.pkg.tar.zst
  export CC=clang
  export CXX=clang++
fi

cd ./llvm ; su builder -c "yes '' | MAKEFLAGS=\"-j $(nproc)\" makepkg --noconfirm --nocheck --skippgpcheck -sc"
rm llvm-debug*.zst
pacman -U --noconfirm llvm-*.zst
mv llvm-*.zst ..
cd ..

cd ./lld ; su builder -c "yes '' | MAKEFLAGS=\"-j $(nproc)\" makepkg --noconfirm --nocheck --skippgpcheck -sc"
rm lld-debug*.zst
pacman -U --noconfirm lld-*.zst
mv lld-*.zst ..
cd ..

cd ./compiler-rt ; su builder -c "yes '' | MAKEFLAGS=\"-j $(nproc)\" makepkg --noconfirm --nocheck --skippgpcheck -sc"
rm compiler-rt-debug*.zst
pacman -U --noconfirm compiler-rt-*.zst
mv compiler-rt-*.zst ..
cd ..

cd ./clang ; su builder -c "yes '' | MAKEFLAGS=\"-j $(nproc)\" makepkg --noconfirm --nocheck --skippgpcheck -sc"
rm clang-debug*.zst
mv clang-*.zst ..

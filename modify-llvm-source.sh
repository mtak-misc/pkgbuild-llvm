sed -i 's/source=($_source_base\/llvm-$pkgver.src.tar.xz{,.sig}.*/source=($_source_base\/llvm-project-$pkgver.src.tar.xz{,.sig})/' llvm/PKGBUILD
sed -i '/sha256sums=/,/)/c\sha256sums=(\x27SKIP\x27\n            \x27SKIP\x27)' llvm/PKGBUILD
sed -i '\|\$_source_base/cmake-\$pkgver\.src\.tar\.xz{,\.sig}|d' llvm/PKGBUILD
sed -i '\|\$_source_base/third-party-\$pkgver\.src\.tar\.xz{,\.sig})|d' llvm/PKGBUILD

sed -i '/rename -v/d' llvm/PKGBUILD
sed -i 's/cd llvm-$pkgver.src/cd llvm-project-$pkgver.src/g' llvm/PKGBUILD
sed -i 's/mkdir build/mkdir -p llvm\/build/g' llvm/PKGBUILD
sed -i 's/rm cmake\/modules/rm llvm\/cmake\/modules/g' llvm/PKGBUILD

sed -i 's/cd llvm-project-$pkgver.src\/build/cd llvm-project-$pkgver.src\/llvm\/build/g' llvm/PKGBUILD

sed -i 's/\.\.\/LICENSE.TXT/..\/..\/LICENSE.TXT/g' llvm/PKGBUILD
sed -i 's/llvm-$pkgver.src\/LICENSE.TXT/llvm-project-$pkgver.src\/llvm\/LICENSE.TXT/g' llvm/PKGBUILD

sed -i 's|source=($_source_base/compiler-rt-$pkgver.src.tar.xz{,.sig}|source=($_source_base/llvm-project-$pkgver.src.tar.xz{,.sig})|' compiler-rt/PKGBUILD
sed -i '/cmake-$pkgver.src.tar.xz/d' compiler-rt/PKGBUILD
sed -i '/third-party-$pkgver.src.tar.xz/d' compiler-rt/PKGBUILD

sed -i '/^sha256sums=/,/)/c\sha256sums=('\''SKIP'\''\n            '\''SKIP'\'')' compiler-rt/PKGBUILD

sed -i '/mv cmake/d' compiler-rt/PKGBUILD
sed -i '/mv third-party/d' compiler-rt/PKGBUILD

sed -i 's|cd compiler-rt-$pkgver.src|cd llvm-project-$pkgver.src/compiler-rt|g' compiler-rt/PKGBUILD

sed -i 's|source=(\$_source_base/clang-\$pkgver\.src\.tar\.xz{,\.sig}|source=($_source_base/llvm-project-$pkgver.src.tar.xz{,.sig})|' clang/PKGBUILD
sed -i 's/rename -v -- "-$pkgver.src" .*/cd llvm-project-$pkgver.src/' clang/PKGBUILD
sed -i 's/cd clang-$pkgver.src/cd clang/' clang/PKGBUILD

sed -i '/sha256sums=(/,/)/c\sha256sums=("SKIP"\n            "SKIP")' clang/PKGBUILD

sed -i '\|\$_source_base/clang-\$pkgver\.src\.tar\.xz|d' PKGBUILD
sed -i '\|\$_source_base/clang-tools-extra-\$pkgver\.src\.tar\.xz|d' clang/PKGBUILD
sed -i '\|\$_source_base/llvm-\$pkgver\.src\.tar\.xz|d' clang/PKGBUILD
sed -i '\|\$_source_base/cmake-\$pkgver\.src\.tar\.xz|d' clang/PKGBUILD
sed -i '\|\$_source_base/third-party-\$pkgver\.src\.tar\.xz|d' clang/PKGBUILD
sed -i '/0001-Revert-clang-driver-When-fveclib-ArmPL-flag-is-in-us\.patch/d' clang/PKGBUILD
sed -i '/enable-fstack-protector-strong-by-default\.patch/d' clang/PKGBUILD

sed -i '/patch -Np2 -i \.\./d' clang/PKGBUILD

sed -i 's/cd clang-$pkgver.src\/build/cd llvm-project-$pkgver.src\/clang\/build/g' clang/PKGBUILD

sed -i 's|\$srcdir/clang-tools-extra|$srcdir/llvm-project-$pkgver.src/clang-tools-extra|g' clang/PKGBUILD
sed -i 's|\$srcdir/third-party-\$pkgver\.src|$srcdir/llvm-project-$pkgver.src/third-party|g' clang/PKGBUILD

sed -i 's|install -Dm644 \.\.\/LICENSE.TXT|install -Dm644 ../LICENSE.TXT|g' clang/PKGBUILD 
sed -i 's|cp -a \.\.\/bindings|cp -a ../bindings|g' clang/PKGBUILD

sed -i '/_source_base\/lld-\$pkgver\.src\.tar\.xz/,/_source_base\/cmake-\$pkgver\.src\.tar\.xz/c\source=($_source_base/llvm-project-$pkgver.src.tar.xz{,.sig})' lld/PKGBUILD

sed -i '\|\$_source_base/lld-\$pkgver\.src\.tar\.xz|d' lld/PKGBUILD
sed -i '\|\$_source_base/llvm-\$pkgver\.src\.tar\.xz|d' lld/PKGBUILD
sed -i '\|\$_source_base/libunwind-\$pkgver\.src\.tar\.xz|d' lld/PKGBUILD
sed -i '\|\$_source_base/cmake-\$pkgver\.src\.tar\.xz|d' lld/PKGBUILD

sed -i '/sha256sums=(/,/)/c\sha256sums=("SKIP"\n            "SKIP")' lld/PKGBUILD
sed -i '/mv libunwind/d' lld/PKGBUILD
sed -i '/mv cmake/d' lld/PKGBUILD

sed -i 's|lld-\$pkgver\.src|llvm-project-$pkgver.src/lld|g' lld/PKGBUILD

sed -i 's|llvm-\$pkgver\.src|llvm-project-$pkgver.src/llvm|g' lld/PKGBUILD

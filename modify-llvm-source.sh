sed -i 's/source=($_source_base\/llvm-$pkgver.src.tar.xz{,.sig}.*/source=($_source_base\/llvm-project-$pkgver.src.tar.xz{,.sig})/' llvm/PKGBUILD
sed -i '/sha256sums=/,/)/c\sha256sums=(\x27SKIP\x27\n            \x27SKIP\x27)' llvm/PKGBUILD

sed -i '/rename -v/d' llvm/PKGBUILD
sed -i 's/cd llvm-$pkgver.src/cd llvm-project-$pkgver.src/g' llvm/PKGBUILD
sed -i 's/mkdir build/mkdir -p llvm\/build/g' llvm/KGBUILD
sed -i 's/rm cmake\/modules/rm llvm\/cmake\/modules/g' llvm/PKGBUILD

sed -i 's/cd llvm-project-$pkgver.src\/build/cd llvm-project-$pkgver.src\/llvm\/build/g' llvm/PKGBUILD

sed -i 's/\.\.\/LICENSE.TXT/..\/..\/LICENSE.TXT/g' llvm/PKGBUILD
sed -i 's/llvm-$pkgver.src\/LICENSE.TXT/llvm-project-$pkgver.src\/llvm\/LICENSE.TXT/g' llvm/PKGBUILD

sed -i '/source=(/,/)/c\source=($_source_base/llvm-project-$pkgver.src.tar.xz{,.sig})' compiler-rt/PKGBUILD

sed -i '/sha256sums=(/,/)/c\sha256sums=(\'SKIP\'\n            \'SKIP\')' compiler-rt/PKGBUILD

sed -i '/prepare() {/,/}/c\prepare() {\n  # llvm-project内の構成を利用\n  mkdir -p llvm-project-$pkgver.src/compiler-rt/build\n}' compiler-rt/PKGBUILD

sed -i 's|cd compiler-rt-$pkgver.src/build|cd llvm-project-$pkgver.src/compiler-rt/build|' compiler-rt/PKGBUILD

sed -i 's|cd compiler-rt-$pkgver.src/build|cd llvm-project-$pkgver.src/compiler-rt/build|' compiler-rt/PKGBUILD

# 1. source行の変更とチェックサムの無効化（SKIPへの置換）
sed -i 's/source=($_source_base\/llvm-$pkgver.src.tar.xz{,.sig}.*/source=($_source_base\/llvm-project-$pkgver.src.tar.xz{,.sig})/' llvm/PKGBUILD
sed -i '/sha256sums=/,/)/c\sha256sums=(\x27SKIP\x27\n            \x27SKIP\x27)' llvm/PKGBUILD

# 2. prepare内のパス変更と不要なrenameの削除
# rename行を削除し、ディレクトリ名をllvm-projectベースに置換
sed -i '/rename -v/d' llvm/PKGBUILD
sed -i 's/cd llvm-$pkgver.src/cd llvm-project-$pkgver.src/g' llvm/PKGBUILD
sed -i 's/mkdir build/mkdir -p llvm\/build/g' llvm/KGBUILD
sed -i 's/rm cmake\/modules/rm llvm\/cmake\/modules/g' llvm/PKGBUILD

# 3. build, check, package 各関数内のパス修正
# build/checkのディレクトリ移動
sed -i 's/cd llvm-project-$pkgver.src\/build/cd llvm-project-$pkgver.src\/llvm\/build/g' llvm/PKGBUILD
# cmakeの実行パス（..）はそのまま（llvm/buildから見てllvm直下）で機能します

# 4. LICENSEファイルのパス修正
sed -i 's/\.\.\/LICENSE.TXT/..\/..\/LICENSE.TXT/g' llvm/PKGBUILD
sed -i 's/llvm-$pkgver.src\/LICENSE.TXT/llvm-project-$pkgver.src\/llvm\/LICENSE.TXT/g' llvm/PKGBUILD

#!/bin/sh

sed -i 's/pkgver=18.1.8/pkgver=19.1.3/g' lld/PKGBUILD
sed -i 's/800e6805fb613eb8428f7a199f6d06c4c19f78f2db69157a129bb04fc1c99769/SKIP/g' lld/PKGBUILD
sed -i 's/f68cf90f369bc7d0158ba70d860b0cb34dbc163d6ff0ebc6cfa5e515b9b2e28d/SKIP/g' lld/PKGBUILD
sed -i 's/c31577d16978b0da0e472ef751f74893a5b459a7ea4a383b75f7ab93cf1e6877/SKIP/g' lld/PKGBUILD
sed -i 's/59badef592dd34893cd319d42b323aaa990b452d05c7180ff20f23ab1b41e837/SKIP/g' lld/PKGBUILD
sed -i '/patch -Np2/d' lld/PKGBUILD
# sed -i 's//SKIP/g' lld/PKGBUILD

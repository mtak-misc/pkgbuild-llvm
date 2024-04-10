name: gcc-build-lld

on:
  workflow_dispatch:

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Cleanup
        run: |
          docker images
          sudo rm -rf "/opt/*" || true
          sudo rm -rf "/usr/share/dotnet" || true
          sudo rm -rf "$AGENT_TOOLSDIRECTORY" || true
          sudo rm -rf "/usr/local/lib/android" || true
          sudo rm -rf "/usr/local/share/boost" || true
          sudo rm -rf "/usr/lib/jvm" || true
          sudo rm -rf "/usr/share/swift" || true
          sudo rm -rf "/usr/local/julia*" || true
          sudo rm -rf "/usr/share/kotlinc" || true
          sudo rm -rf "/usr/local/share/edge_driver" || true
          sudo rm -rf "/usr/local/share/chromedriver-linux64" || true
          sudo rm -rf "/usr/local/share/gecko_driver" || true
          sudo rm -rf "/usr/share/miniconda" || true
          sudo rm -rf "/usr/local/share/phantomjs*" || true
          sudo rm -rf "/usr/share/sbt" || true
          sudo rm -rf "/usr/local/sqlpackage" || true
          docker rmi $(docker image ls -q --filter "reference=node*")
          docker rmi $(docker image ls -q --filter "reference=debian*")
          docker rmi $(docker image ls -q --filter "reference=alpine*")
          docker rmi $(docker image ls -q --filter "reference=ubuntu:20.04")
          sudo npm uninstall bazel
          rustup self uninstall -y
          sudo apt purge \
            ansible \
            apache2 \
            aria2 \
            azure-cli \
            cabal* \
            clang* \
            dotnet-sdk* \
            firefox \
            ghc* \
            google-chrome-stable \
            google-cloud-sdk \
            kubectl \
            libpq-dev \
            microsoft-edge-stable \
            moby-buildx \
            moby-cli \
            moby-compose \
            moby-engine \
            mongodb* \
            mono-complete \
            mysql* \
            nginx \
            node* \
            npm* \
            nuget \
            php* \
            postgresql* \
            powershell \
            r-base \
            rpm \
            ruby* \
            sphinxsearch \
            subversion \
            yarn \
            -yq >/dev/null 2>&1 || true
          sudo apt-get autoremove -y >/dev/null 2>&1 || true
          sudo apt-get autoclean -y >/dev/null 2>&1 || true
          df -h
      - name: Checkount repo
        uses: actions/checkout@v4
      - name: Prepare for makepkg
        run: |
          git clone --depth 1 https://gitlab.archlinux.org/archlinux/packaging/packages/lld.git
          sed -i 's/pkgver=17.0.6/pkgver=18.1.3/g' lld/PKGBUILD
          sed -i 's/4ac13125616dc44905b85820aa403d27ec1226329b7f674daeb5f5584c6f0b22/SKIP/g' lld/PKGBUILD
          sed -i 's/b638167da139126ca11917b6880207cc6e8f9d1cbb1a48d87d017f697ef78188/SKIP/g' lld/PKGBUILD
          sed -i 's/9e7535a353aa862730b4ba38df42e06f6856b40c4cc51b57f27b5046dc21d70d/SKIP/g' lld/PKGBUILD
          sed -i 's/807f069c54dc20cb47b21c1f6acafdd9c649f3ae015609040d6182cab01140f4/SKIP/g' lld/PKGBUILD
          sed -i '/patch -Np2/d' lld/PKGBUILD
          echo "USERID=$(id -u $(whoami))" >> $GITHUB_ENV
        env:
          USERID: ''    
      - name: Build llvm
        uses: docker://archlinux:latest
        with:
          entrypoint: '/bin/sh'
          args: ./gcc-build-lld.sh ${{ env.USERID }}
      - name: Upload packages
        uses: actions/upload-artifact@v4
        with:
          name: llvm-gcc
          path: ${{ github.workspace }}/*.pkg.tar.zst

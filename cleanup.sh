#!/bin/sh

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

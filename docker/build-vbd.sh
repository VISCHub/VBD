#!/bin/bash

#adduser vbd
#usermod -aG sudo vbd
#su vbd

git clone https://github.com/VISCHub/VBD

cd VBD

./autogen.sh

# https://github.com/bitcoin/bitcoin/blob/master/doc/build-unix.md
# ./configure
./configure --disable-wallet --without-gui --without-miniupnpc

make

make install

mkdir ~/.vbdcore

cat > ~/.vbdcore/vbd.conf <<EOF
server=1
listen=1
daemon=1
txindex=1
addnode=45.32.19.62
addnode=104.238.157.165
EOF

vbdd

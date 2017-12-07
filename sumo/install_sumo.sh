#!/bin/bash
#http://sumo.dlr.de/wiki/Installing/MacOS_Build_w_Homebrew

#brew install Caskroom/cask/xquartz
#brew install autoconf
#brew install automake
#brew install pkg-config
#brew install libtool
#brew install gdal
#brew install proj
#brew install xerces-c
#brew install fox

export CPPFLAGS="$CPPFLAGS -I/opt/X11/include/"
export LDFLAGS="-L/opt/X11/lib"
echo $PWD
cd /Users/TeoPro/Documents/git/osmosi/sumo
autoreconf -i
./configure CXX=clang++ CXXFLAGS="-stdlib=libc++ -std=gnu++11" --with-xerces=/usr/local --with-proj-gdal=/usr/local

make -j`sysctl -n hw.ncpu`
make install

#to start bin/sumo-gui
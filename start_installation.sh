#!/bin/bash
ROOT_VERSION=6.22.00
wget https://root.cern/download/root_v$ROOT_VERSION.source.tar.gz
tar -xzvf root_v$ROOT_VERSION.source.tar.gz
rm root_v$ROOT_VERSION.source.tar.gz -y
CURRENT_PATH=`pwd`
mkdir ~/root 
cd ~/root
mkdir root_$ROOT_VERSION-build root_$ROOT_VERSION-install
cd root_$ROOT_VERSION-build
cmake -DCMAKE_INSTALL_PREFIX=../root_$ROOT_VERSION-install -Dmathmore=ON -Droofit=ON -Dminuit2=ON -Dpyroot=ON -DPython3_EXECUTABLE=/usr/bin/python3.6 $CURRENT_PATH/root-$ROOT_VERSION
cmake -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON -build . -target install -j1
cmake --build . --target install -- -j11

cd ..
rm -rf  root_$ROOT_VERSION-build
cd $CURRENT_PATH
rm -rf root-$ROOT_VERSION 

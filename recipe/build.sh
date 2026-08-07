#!/bin/sh
set -eux

mkdir -p build
cd build

cmake ${CMAKE_ARGS} .. \
      -G "Ninja" \
      -DENABLE_MONGOC=OFF \
      -DENABLE_STATIC=OFF \
      -DENABLE_SHARED=ON \
      -DBUILD_SHARED_LIBS=ON \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DCMAKE_INSTALL_PREFIX=$PREFIX

cmake --build . --config Release
cmake --build . --config Release --target install

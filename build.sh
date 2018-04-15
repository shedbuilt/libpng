#!/bin/bash
patch -Np1 -i "${SHED_PKG_PATCH_DIR}/libpng-1.6.34-apng.patch" && \
LIBS=-lpthread ./configure --prefix=/usr \
                           --disable-static && \
make -j $SHED_NUM_JOBS && \
make DESTDIR="$SHED_FAKE_ROOT" install || exit 1
install -dm755 /usr/share/doc/libpng-1.6.34
install -m644 README /usr/share/doc/libpng-1.6.34
install -m644 libpng-manual.txt /usr/share/doc/libpng-1.6.34
#!/bin/bash
patch -Np1 -i "${SHED_PATCHDIR}/libpng-1.6.34-apng.patch" && \
LIBS=-lpthread ./configure --prefix=/usr \
                           --disable-static && \
make -j $SHED_NUMJOBS && \
make DESTDIR="$SHED_FAKEROOT" install || exit 1
install -dm755 /usr/share/doc/libpng-1.6.34
install -m644 README /usr/share/doc/libpng-1.6.34
install -m644 libpng-manual.txt /usr/share/doc/libpng-1.6.34
#!/bin/sh

rm -f	glhexen2.x86 hexen2.x86 \
	glhexen2.x86_64 hexen2.x86_64 \
	Hexen_II Hexen_II-gl
make distclean

OLDPATH=$PATH
MAKE_CMD=make

OSXBUILD=1
export OSXBUILD

# x86
PATH=/opt/cross_osx-x86.5/usr/bin:$OLDPATH
CC=i686-apple-darwin9-gcc
AS=i686-apple-darwin9-as
AR=i686-apple-darwin9-ar
RANLIB=i686-apple-darwin9-ranlib
LIPO=i686-apple-darwin9-lipo
export PATH CC AS AR RANLIB LIPO
$MAKE_CMD MACH_TYPE=x86 USE_X86_ASM=no glh2 $* SDL_API=2 || exit 1
i686-apple-darwin9-strip -S glhexen2 || exit 1
mv glhexen2 glhexen2.x86 || exit 1
$MAKE_CMD distclean
$MAKE_CMD MACH_TYPE=x86 h2 $* SDL_API=2 || exit 1
i686-apple-darwin9-strip -S hexen2 || exit 1
mv hexen2 hexen2.x86 || exit 1
$MAKE_CMD distclean

# x86_64
PATH=/opt/cross_osx-x86_64/usr/bin:$OLDPATH
CC=x86_64-apple-darwin9-gcc
AS=x86_64-apple-darwin9-as
AR=x86_64-apple-darwin9-ar
RANLIB=x86_64-apple-darwin9-ranlib
LIPO=x86_64-apple-darwin9-lipo
export PATH CC AS AR RANLIB LIPO
$MAKE_CMD MACH_TYPE=x86_64 glh2 $* SDL_API=2 || exit 1
x86_64-apple-darwin9-strip -S glhexen2 || exit 1
mv glhexen2 glhexen2.x86_64 || exit 1
$MAKE_CMD distclean
$MAKE_CMD MACH_TYPE=x86_64 h2 $* SDL_API=2 || exit 1
x86_64-apple-darwin9-strip -S hexen2 || exit 1
mv hexen2 hexen2.x86_64 || exit 1
$MAKE_CMD distclean

$LIPO -create -o Hexen_II-gl glhexen2.x86_64 glhexen2.x86 || exit 1
$LIPO -create -o Hexen_II hexen2.x86_64 hexen2.x86 || exit 1

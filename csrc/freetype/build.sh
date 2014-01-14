# freetype 2.5 custom build script
# features: truetype format, cff format, truetype bytecode hinter, autohinter,
# non-aa rasterizer, smooth rasterizer, stroker, lcd filtering.

[[ "$(uname)" == *Linux* ]] && libfile=../../bin/linux32/libfreetype.so
[[ "$(uname)" == *MINGW* ]] && libfile=../../bin/mingw32/freetype.dll

args=(gcc $CFLAGS -shared -o "$libfile" -Icustom -Iinclude -DFT2_BUILD_LIBRARY

      src/base/ftsystem.c
      src/base/ftinit.c
      src/base/ftdebug.c

      src/base/ftbase.c

      src/base/ftbbox.c       #recommended, see <freetype/ftbbox.h>
      src/base/ftglyph.c      #recommended, see <freetype/ftglyph.h>

      #src/base/ftbdf.c        #optional, see <freetype/ftbdf.h>
      src/base/ftbitmap.c     #optional, see <freetype/ftbitmap.h>
      #src/base/ftcid.c        #optional, see <freetype/ftcid.h>
      #src/base/ftfstype.c     #optional
      #src/base/ftgasp.c       #optional, see <freetype/ftgasp.h>
      #src/base/ftgxval.c      #optional, see <freetype/ftgxval.h>
      src/base/ftlcdfil.c     #optional, see <freetype/ftfil.h>
      #src/base/ftmm.c         #optional, see <freetype/ftmm.h>
      #src/base/ftotval.c      #optional, see <freetype/ftotval.h>
      #src/base/ftpatent.c     #optional
      #src/base/ftpfr.c        #optional, see <freetype/ftpfr.h>
      src/base/ftstroke.c     #optional, see <freetype/ftstroke.h>
      #src/base/ftsynth.c      #optional, see <freetype/ftsynth.h>
      #src/base/fttype1.c      #optional, see <freetype/t1tables.h>
      #src/base/ftwinfnt.c     #optional, see <freetype/ftwinfnt.h>
      #src/base/ftxf86.c       #optional, see <freetype/ftxf86.h>

      #src/base/ftmac.c        #only on the Macintosh

    #font drivers (optional; at least one is needed)

      #src/bdf/bdf.c           #BDF font driver
      src/cff/cff.c           #CFF/OpenType font driver
      #src/cid/type1cid.c      #Type 1 CID-keyed font driver
      #src/pcf/pcf.c           #PCF font driver
      #src/pfr/pfr.c           #PFR/TrueDoc font driver
      src/sfnt/sfnt.c         #SFNT files support (TrueType & OpenType)

      src/truetype/truetype.c #TrueType font driver
      #src/type1/type1.c       #Type 1 font driver
      #src/type42/type42.c     #Type 42 font driver
      #src/winfonts/winfnt.c   #Windows FONT / FNT font driver

    #rasterizers (optional; at least one is needed for vector formats)

      src/raster/raster.c     #monochrome rasterizer
      src/smooth/smooth.c     #anti-aliasing rasterizer

    #auxiliary modules (optional)

      src/autofit/autofit.c   #auto hinting module
      #src/cache/ftcache.c     #cache sub-system (in beta)
      #src/gzip/ftgzip.c       #support for compressed fonts (.gz)
      #src/lzw/ftlzw.c         #support for compressed fonts (.Z)
      #src/bzip2/ftbzip2.c     #support for compressed fonts (.bz2)
      #src/gxvalid/gxvalid.c   #TrueTypeGX/AAT table validation
      #src/otvalid/otvalid.c   #OpenType table validation
      src/psaux/psaux.c       #PostScript Type 1 parsing
      src/pshinter/pshinter.c #PS hinting module
      src/psnames/psnames.c   #PostScript glyph names support
)

"${args[@]}"

: <<COMMENT
    Notes:

      ftcache.c  needs ftglyph.c
      ftfstype.c needs fttype1.c
      ftglyph.c  needs ftbitmap.c
      ftstroke.c needs ftglyph.c
      ftsynth.c  needs ftbitmap.c

      cff.c      needs sfnt.c, pshinter.c, and psnames.c
      truetype.c needs sfnt.c and psnames.c
      type1.c    needs psaux.c pshinter.c, and psnames.c
      type1cid.c needs psaux.c, pshinter.c, and psnames.c
      type42.c   needs truetype.c

      To use ftbzip2.c, an application must be linked with a library
      which implements bzip2 support (and the bzip2 header files must
      be available also during compilation).

COMMENT

gcc -arch i386 -O2 `./files.sh` -shared -install_name @loader_path/libfreetype.dylib -o ../../bin/osx32/libfreetype.dylib -Icustom -Iinclude -DFT2_BUILD_LIBRARY

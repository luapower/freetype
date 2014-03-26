gcc -arch x86_64 -O2 `./files.sh` -shared -install_name @loader_path/libfreetype.dylib -o ../../bin/osx64/libfreetype.dylib -Icustom -Iinclude -DFT2_BUILD_LIBRARY

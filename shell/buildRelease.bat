@echo off
git submodule init
git submodule update
cd vcpkg
call bootstrap-vcpkg.bat
cd ..
rd /s /q build
md build
cd build
cmake .. -DCMAKE_TOOLCHAIN_FILE=../vcpkg/scripts/buildsystems/vcpkg.cmake
cmake --build . --config Release
cd ..
xcopy Debug\* . /Y

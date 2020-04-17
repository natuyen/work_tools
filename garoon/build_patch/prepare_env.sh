#!/bin/sh
echo "------------Prepare environment"
echo "------Remove old resource"
cd ${WORKSPACE}
rm -rf build*
# diff source
rm -rf source*
rm -rf *.txt
# built source
rm -rf *.zip
rm -rf *.tar

echo "------Copy build_sp folder"
cp -rf garoon/build_patch build
cp -rf garoon/build_sp/Tools/encode_php_gr.sh build

# make folder
mkdir -p source
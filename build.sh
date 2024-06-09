if [ ! -d ./bin ]; then
   mkdir bin
fi

cc=clang


# ------------------
#    Main Project
# ------------------

# ==============
# Gets list of all C files
c_filenames= 
for entry in ./src/*.c
do
  c_filenames="$c_filenames $entry"
done

for entry in ./src/base/*.c
do
  c_filenames="$c_filenames $entry"
done
# ==============
compiler_flags="-Wall -Wvarargs -Werror -Wno-unused-function -Wno-format-security -Wno-incompatible-pointer-types-discards-qualifiers -Wno-unused-but-set-variable -Wno-int-to-void-pointer-cast"
include_flags="-Isource -Ithird_party/include -Ithird_party/source"
linker_flags="-g -lm -lX11 -Lthird_party/lib"
defines="-D_DEBUG -D_CRT_SECURE_NO_WARNINGS"
output="-obin/codebase"
backend="-DBACKEND_GL46"
# ==============


# ==============
# TODO(voxel): REMOVE BACKEND SPECIFIC LINKS
if [ "$backend" = "-DBACKEND_D3D11" ]
then
  linker_flags="$linker_flags -ldxguid -ld3dcompiler"
fi
# ==============

# compiler_flags="$compiler_flags -fsanitize=address"

echo Building codebase...
$cc $c_filenames $compiler_flags $defines $backend $include_flags $linker_flags $output

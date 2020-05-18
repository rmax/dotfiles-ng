export CPU_CORES=$(nproc)

export MAKEFLAGS="${MAKEFLAGS} -j${CPU_CORES}"

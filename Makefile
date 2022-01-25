# Regular use, set compiler name, compiler flags, openmp flags zlib flags
CNAME=gcc
#linker flags
LFLAGS=-lm
#c flags
CFLAGS=-O3 -DMC_SELF_TEST
NOTES=
ifeq ($(CXX),g++)
	NOTES=gcc slow marching cubes (to compile with clang/llvm 'make CXX=clang')
endif
ifeq ($(CXX),clang)
	CNAME=clang
endif

all:
	$(info $(NOTES))
	$(CNAME) $(CFLAGS) MarchingCubes.c -o MarchingCubes $(LFLAGS)
	

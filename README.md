## About

This is a simple NIfTI to mesh implementation using the [AFNI marching cubes](https://github.com/afni/afni/tree/25e77d564f2c67ff480fa99a7b8e48ec2d9a89fc/src/SUMA/MarchingCubes) code. Ziad Saad ported the [C++ algorithm of Thomas Lewiner](http://thomas.lewiner.org/pdfs/marching_cubes_jgt.pdf) to C. Ziad's original port used the lookup table dated 13/07/2002, whereas this repository updates this to the tables from 12/08/2002. This updated table provides consistent winding order for triangles. This is a minimal project for demonstration only. Users seeking useful features should consider [nii2mesh](https://github.com/neurolabusc/nii2mesh) instead.

## Compiling

The following C code will download, compile and run the project on a Unix (Linux, macOS) computer. In this example, the executable is applied to the included NIfTI image `bet.nii` with an isosurface of 128 (e.g. voxel brighter than 128 will be considered opaque brain, darker will be considered transparent air). The example also runs the software without arguments, creating a series of test objects. In both cases, [PLY format](http://paulbourke.net/dataformats/ply/) meshes are created.

```
git clone https://github.com/neurolabusc/LewinerMarchingCubes
cd LewinerMarchingCubes
make
./MarchingCubes bet.nii 128
./MarchingCubes
```

The former operation is equivalent to running the AFNI [IsoSurface](https://afni.nimh.nih.gov/pub/dist/doc/program_help/IsoSurface.html) with the following parameters:

```
IsoSurface -input bet.nii.gz -isorange 128 255 -o_PLY isorange64_255
```

## Usage

Running the program with no arguments will generate a series of test datasets and provide details on typical usage:

```
Create PLY-format mesh from NIfTI format volume
Usage:
  ./MarchingCubes niiname isolevel originalMC
    niiname: uncompressed NIfTI .nii format volume
    isolevel: boundary level for surface
    originalMC: use Lewiner (0, default) or original (1) method 
Example:
  ./MarchingCubes bet.nii 64 1
Running with no arguments creates test data
```

The repository also includes a similar C++ project in the `CPP` folder. It provides similar performance but does not create test cases and only handles uint8 NIfTI images.

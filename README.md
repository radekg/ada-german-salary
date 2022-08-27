# German gross salary employer contributions calculator

Calculates German salary employer contributions for a gross number.

This program does not calculate employee contributions breakdown, only the employer part.

This is an Ada port of my [Fortran implementation](https://github.com/radekg/fortran-german-salary).

## Setup for development on macOS

### GNAT

1. Download GNAT from https://www.adacore.com/download/more.
2. Install in a directory you want. For example, I have installed it in `/Users/rad/dev/GNAT/2020`.
3. Add GNAT executables to `PATH`. I added the following line to the end of `~/.bash_profile`:

```sh
export PATH=/Users/rad/dev/GNAT/2020/bin:$PATH
```

**Note:** use `gprbuild` tool instead of `gnatmake`. `gprbuild` operates on project files. Two online resources for GPRBuild tool:

- https://learn.adacore.com/courses/GNAT_Toolchain_Intro/chapters/gprbuild.html
- https://docs.adacore.com/gprbuild-docs/html/gprbuild_ug/introduction.html

### Xcode

If you see an error like this when building Ada program on Mac:

```
ld: library not found for -lSystem
collect2: error: ld returned 1 exit status
gprbuild: link of main.adb failed
```

it is because you have no Xcode installed. GNAT requires Xcode so install it from the App Store. Before you can progress with the build, you'll have to gree to Xcode license:

```sh
sudo xcodebuild -license
```

Press return (`enter`) to display license text, then press `q`, finally type `agree` and press return again. Now, retry Ada program build. You should see output similar to:

### AUnit: the Ada unit test framework

Tests require [AUnit](https://github.com/AdaCore/aunit). I'm no expert, but to me it looks like dependencies have to be built for the target architecture and installed on the system. The easiest way to proceed with a dependency is to install it in the `<GNAT-install-dir>/lib`. For AUnit, the best way to proceed seems to be:

```sh
mkdir -p /tmp/aunit
cd /tmp/aunit
git clone https://github.com/AdaCore/aunit.git .
git checkout v22.0.0
make
make install
```

## Build

```sh
make build
```

Run the program with `./bin/main`.

## Run tests

This is a two step process:

1. Compile tests programs.
2. Run resulting test harnesses.

```sh
make tests
./tests/bin/cli-tests-harness
```

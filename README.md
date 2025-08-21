# Build a Conan/CMake C++ project

## Environment setup

We will install conan using `pip` (recomended way) on a virtual python3 environment.

```bash
$ python3 -m venv devenv
$ source devenv/bin/activate
(devenv)$ python -m pip install conan
```

After this we should be able to run the `conan` command.

```bash
(devenv)$ conan --verion
Conan version 2.19.1
```

## Conan profile setup

Conan will require a profile to operate. To create a default profile run:

```bash
(devenv) conan profile detect
```

You can check the created profile in `$CONAN_HOME/profiles/default`. Use `conan config home` for the value of
`CONAN_HOME`.

If you know what you are doing you can edit the profile to better tailor to you needs.

### Configure Conan's CMake generator

This is an optional step, but since builds with Ninja are faster you can make it be the default for conan by adding the
following line to your `$CONAN_HOME/global.conf`:

```
tools.cmake.cmaketoolchain:generator="Ninja"
```

## Installing dependencies

Using the `default` profile:
```bash
(devenv)$ conan install -of build/release --build=missing
```

Using a different profile:
```bash
(devenv)$ conan install -pr linux_release -of build/release --build=missing
```

## Building the project

```bash
(devenv)$ cmake -B build/release -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake
(devenv)$ cmake --build build/release
```

Or use a `CMakePresets.json` file:

```bash
(devenv)$ cmake --workflow release
```

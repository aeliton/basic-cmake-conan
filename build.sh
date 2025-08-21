#!/usr/bin/env bash

python3 -m venv devenv
. devenv/bin/activate
python -m pip install conan
conan profile detect || echo "default conan profile found..."
conan install -of build/release --build=missing .
cmake --workflow --preset release

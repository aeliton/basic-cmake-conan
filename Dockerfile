FROM ubuntu AS base

RUN apt-get -qy update && \
    apt-get -qy install cmake ninja-build clang clang-tools libstdc++-14-dev python3 python3-venv

RUN printf '#include<print>\nint main(){std::println("");}' \
           | clang++ -std=c++23 -x c++ - -o /dev/null

RUN python3 -m venv /opt/devenv
ENV PATH="/opt/devenv/bin:$PATH"
ENV CXX=clang++
ENV CC=clang

WORKDIR /work
COPY . .

RUN python -m pip install conan && \
    conan profile detect && \
    conan install -of build/release --build=missing . && \
    cmake --workflow --preset release

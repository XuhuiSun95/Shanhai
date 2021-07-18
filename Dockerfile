ARG OS_VERSION=20.04

FROM ubuntu:${OS_VERSION} AS dev

ARG CMAKE_VERSION=3.21.0
ARG GCC_VERSION=10

WORKDIR /usr/src
RUN apt-get update && DEBIAN_FRONTEND='noninteractive' apt-get install -y --no-install-recommends \
  build-essential \
  curl \
  g++-${GCC_VERSION} \
  git \
  ccache \
  cppcheck \
  clang-tidy \
  python3-pip \
  && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-${GCC_VERSION} 100 \
  && update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++-${GCC_VERSION} 100 \
  && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-${GCC_VERSION} 100 \
  && update-alternatives --install /usr/bin/cc cc /usr/bin/gcc-${GCC_VERSION} 100 \
  && rm -rf /var/lib/apt/lists/* \
  && pip3 install --no-cache-dir conan gcovr \
  && curl -L -k -o cmake-linux.sh https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-Linux-x86_64.sh \
  && sh cmake-linux.sh -- --skip-license --prefix=/usr/local \
  && rm cmake-linux.sh
COPY . .

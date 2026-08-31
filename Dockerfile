FROM ubuntu:22.04 AS builder

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get install --no-install-recommends -y \
                       git \
                       ca-certificates \
                       python3 \
                       tar \
                       build-essential \
                       gcc-arm-none-eabi \
                       libnewlib-arm-none-eabi \
                       libstdc++-arm-none-eabi-newlib \
                       cmake \
                       ninja-build && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /project
COPY . .

# Initialize internal submodules if not cloned
RUN git submodule update --init --recursive || true

RUN mkdir build && cd build && \
    cmake -DPICO_BOARD=pico -DPICO_FLASH_SIZE_BYTES=16777216 .. && \
    make -j$(nproc)

FROM scratch AS export-stage
COPY --from=builder /project/build/*.uf2 /

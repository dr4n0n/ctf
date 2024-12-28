# Use Ubuntu 22.04 ARM64 base image
FROM ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:0
ENV LIBGL_ALWAYS_SOFTWARE=1

# Install necessary system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    libssl-dev \
    zlib1g-dev \
    python3 \
    python3-pip \
    wget \
    libglib2.0-0 \
    libx11-dev \
    libgl1-mesa-glx \
    libxcb-glx0-dev \
    sudo \
    ninja-build \
    python3-setuptools \
    python3-wheel \
    curl \
    pkg-config \
    libxcb1-dev \
    libx11-xcb-dev \
    libxrandr-dev \
    libxi-dev \
    libxcomposite-dev \
    libxcursor-dev \
    libxtst-dev \
    libxkbcommon-dev \
    libwayland-dev \
    libwayland-egl1-mesa \
    mesa-utils \
    libglvnd-dev \
    software-properties-common

# Install Meson for building
RUN python3 -m pip install --upgrade pip && \
    python3 -m pip install meson

# Build Qt6 from source with necessary modules
WORKDIR /tmp
RUN git clone --branch 6.5.2 https://code.qt.io/qt/qt5.git && \
    cd qt5 && \
    ./init-repository --module-subset=qtbase,qt5compat,qtsvg,qttools && \
    mkdir build && \
    cd build && \
    cmake .. -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/opt/qt6 \
        -DCMAKE_BUILD_TYPE=Release \
        -DOpenGL_DIR=/usr/lib/aarch64-linux-gnu \
        -DFEATURE_opengl=ON \
        -DLLVM_INSTALL_DIR=/usr/lib/llvm-15 \
        -DClang_DIR=/usr/lib/llvm-15/lib/cmake/clang && \
    ninja && \
    ninja install

# Add Qt6 to PATH
ENV PATH="/opt/qt6/bin:${PATH}"

# Create a user for Cutter
RUN useradd -ms /bin/bash cutteruser && \
    echo "cutteruser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Switch to Cutter user
USER cutteruser
WORKDIR /home/cutteruser

# Clone and build Cutter from source
RUN git clone --recursive https://github.com/rizinorg/cutter.git && \
    cd cutter && \
    mkdir build && \
    cd build && \
    cmake .. -DCMAKE_INSTALL_PREFIX=/home/cutteruser/.local \
              -DBUILD_RZ_RETDEC=ON \
              -DCMAKE_PREFIX_PATH=/opt/qt6 && \
    make -j$(nproc) && \
    make install

# Clone and build rz-retdec plugin
RUN git clone --recursive https://github.com/rizinorg/rz-retdec.git && \
    cd rz-retdec && \
    git submodule update --init --recursive && \
    mkdir build && \
    cd build && \
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/home/cutteruser/.local \
        -DLLVM_INSTALL_DIR=/usr/lib/llvm-15 \
        -DClang_DIR=/usr/lib/llvm-15/lib/cmake/clang && \
    make -j2 && \
    make install

# Add Cutter to the PATH
ENV PATH="/home/cutteruser/.local/bin:${PATH}"

# Expose X11 display
CMD ["cutter"]


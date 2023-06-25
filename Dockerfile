FROM ubuntu:20.04

# Set environment variable to prevent interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package lists and install necessary build dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    make \
    g++ \
    qt5-default \
    libqt5widgets5 \
    libqt5svg5-dev \
    libopenscenegraph-dev \
    libxcb-xinerama0 \
    libx11-xcb-dev \
    libgl1-mesa-dev \
    libxcb-xkb-dev \
    libxcb-icccm4-dev \
    libxcb-image0-dev \
    libxcb-keysyms1-dev \
    libxcb-randr0-dev \
    libxcb-render-util0-dev \
    libxcb-render0-dev \
    libxcb-shape0-dev \
    libxcb-shm0-dev \
    libxcb-sync-dev \
    libxcb-util-dev \
    libxcb-xfixes0-dev \
    libxcb-xinerama0-dev \
    libxcb-xinput-dev \
    libxcb-xtest0-dev \
    libxcb-xv0-dev \
    libxcb-xvmc0-dev \
    libxkbcommon-x11-dev \
    mesa-common-dev \
    mesa-utils \
    x11-utils \
    xvfb


# Set the working directory inside the container
WORKDIR /app

# Copy the source code and CMakeLists.txt to the container
COPY . /app

# Build the C++ project using CMake
RUN mkdir build && \
    cd build && \
    cmake ../OpenRoadEd && \
    make

# Set the entrypoint to run the application
ENTRYPOINT ["./build/OpenRoadEd"]

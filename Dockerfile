FROM ubuntu:latest

# Install dependencies
RUN apt-get update && \
    apt-get install -y git curl unzip xz-utils libglu1-mesa xvfb

# Install Flutter
RUN git clone https://github.com/flutter/flutter.git /opt/flutter
ENV PATH="/opt/flutter/bin:${PATH}"

# Enable Flutter web support
RUN flutter channel stable && \
    flutter upgrade && \
    flutter config --enable-web

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set up the working directory
WORKDIR /workspace

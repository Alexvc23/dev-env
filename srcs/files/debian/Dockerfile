FROM debian:latest

# Install required packages
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    wget \
    vim \
    python3 \
    python3-pip

# Set the working directory
WORKDIR /app

# Create a volume to store files on the host
VOLUME /app/data

# Set the default command to run when the container starts
ENTRYPOINT ["/bin/bash"]

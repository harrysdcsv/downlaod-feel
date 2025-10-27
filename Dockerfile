# Use Python 3.12 base image
FROM python:3.12-slim

# Set the working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    curl \
    ffmpeg \
    aria2 \
    && rm -rf /var/lib/apt/lists/*

# Install mp4decrypt (Bento4)
RUN wget -q https://www.bok.net/Bento4/binaries/Bento4-SDK-1-6-0-641.x86_64-unknown-linux.zip && \
    unzip -q Bento4-SDK-1-6-0-641.x86_64-unknown-linux.zip && \
    cp Bento4-SDK-1-6-0-641.x86_64-unknown-linux/bin/mp4decrypt /usr/local/bin/ && \
    chmod +x /usr/local/bin/mp4decrypt && \
    rm -rf Bento4-SDK-1-6-0-641.x86_64-unknown-linux.zip Bento4-SDK-1-6-0-641.x86_64-unknown-linux

# Copy all files from the current directory to the container
COPY . .

# Install Python dependencies
RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir -r sainibots.txt && \
    pip3 install --no-cache-dir -U yt-dlp

# Create downloads directory
RUN mkdir -p downloads

# Make start script executable
RUN chmod +x start.sh

# Expose port for Flask app
EXPOSE 8000

# Set the command to run the startup script
CMD ["bash", "start.sh"]

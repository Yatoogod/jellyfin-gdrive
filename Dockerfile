# Dockerfile
FROM jellyfin/jellyfin:latest

# Set working directory
WORKDIR /app

# Copy necessary files
COPY . .

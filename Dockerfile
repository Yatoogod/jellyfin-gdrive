# Base image
FROM jellyfin/jellyfin:latest

# Install required packages and Rclone
RUN apt-get update && apt-get install -y \
    curl unzip fuse3 libfuse2 \
    && curl https://rclone.org/install.sh | bash \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Ensure FUSE support
RUN which fusermount3 || (echo "fusermount3 not found" && exit 1)

# Set up Rclone configuration and mount scripts
COPY rclone.conf /root/.config/rclone/rclone.conf
COPY mount-gdrive.sh /mount-gdrive.sh
COPY entrypoint.sh /entrypoint.sh

# Set executable permissions
RUN chmod +x /mount-gdrive.sh /entrypoint.sh

# Create mount point
RUN mkdir -p /mnt/gdrive

# Expose Jellyfin default port
EXPOSE 8096

# Use the custom entrypoint script
ENTRYPOINT ["/entrypoint.sh"]

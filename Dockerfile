# Base image
FROM jellyfin/jellyfin:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl unzip fuse3 libfuse2 \
    && curl https://rclone.org/install.sh | bash \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Ensure FUSE configuration
RUN echo "user_allow_other" >> /etc/fuse.conf

# Create mount point
RUN mkdir -p /mnt/gdrive

# Copy scripts
COPY rclone.conf /root/.config/rclone/rclone.conf
COPY mount-gdrive.sh /mount-gdrive.sh
COPY entrypoint.sh /entrypoint.sh

# Set executable permissions
RUN chmod +x /mount-gdrive.sh /entrypoint.sh

# Expose Jellyfin port
EXPOSE 8096

# Use entrypoint
ENTRYPOINT ["/entrypoint.sh"]

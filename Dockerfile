FROM jellyfin/jellyfin:latest

# Install FUSE and Rclone
RUN apt-get update && apt-get install -y \
    curl unzip fuse3 libfuse2 \
    && curl https://rclone.org/install.sh | bash \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Configure FUSE
RUN echo "user_allow_other" >> /etc/fuse.conf

# Copy mount script
COPY mount-gdrive.sh /mount-gdrive.sh
RUN chmod +x /mount-gdrive.sh

# Create mount point
RUN mkdir -p /mnt/gdrive

# Entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8096
ENTRYPOINT ["/entrypoint.sh"]

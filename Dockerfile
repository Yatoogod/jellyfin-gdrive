FROM jellyfin/jellyfin:latest

# Add FUSE support and debugging tools
RUN apt-get update && apt-get install -y \
    curl unzip fuse3 libfuse2 \
    && curl https://rclone.org/install.sh | bash \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Add these lines to ensure FUSE works in container
RUN echo "user_allow_other" >> /etc/fuse.conf

# Set up Rclone configuration
COPY rclone.conf /root/.config/rclone/rclone.conf

# Create and copy mount script
COPY mount-gdrive.sh /mount-gdrive.sh
RUN chmod +x /mount-gdrive.sh

# Create and copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose Jellyfin default port
EXPOSE 8096

# Use the custom entrypoint script
ENTRYPOINT ["/entrypoint.sh"]

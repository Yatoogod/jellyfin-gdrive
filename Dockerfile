FROM jellyfin/jellyfin:latest

# Install rclone
RUN apt-get update && apt-get install -y curl unzip
RUN curl https://rclone.org/install.sh | bash

# Copy rclone configuration (you'll need to create this)
COPY rclone.conf /root/.config/rclone/rclone.conf

# Create mount script
COPY mount-gdrive.sh /mount-gdrive.sh
RUN chmod +x /mount-gdrive.sh

# Entrypoint to mount Google Drive before starting Jellyfin
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8096

ENTRYPOINT ["/entrypoint.sh"]

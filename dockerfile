# Filename: Dockerfile
FROM jellyfin/jellyfin:latest

# Optional: Add custom configurations
COPY rclone /etc/rclone
COPY docker-compose.yml /app/

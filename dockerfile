# Recommended Dockerfile
FROM jellyfin/jellyfin:latest

# Ensure permissions are correct
WORKDIR /app
COPY . .
RUN chmod +x ./entrypoint.sh # If you have an entrypoint script

# Optional: Install additional dependencies
# RUN apt-get update && apt-get install -y rclone

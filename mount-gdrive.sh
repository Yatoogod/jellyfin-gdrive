#!/bin/bash
# Define variables
RCLONE_CONFIG="/root/.config/rclone/rclone.conf"
MOUNT_POINT="/mnt/gdrive"
LOG_FILE="/var/log/rclone.log"
RCLONE_REMOTE="gdrive:"

# Ensure mount point exists
mkdir -p "$MOUNT_POINT"

# Unmount if already mounted
fusermount -u "$MOUNT_POINT" || true

# Mount Google Drive
rclone mount $RCLONE_REMOTE "$MOUNT_POINT" \
    --config "$RCLONE_CONFIG" \
    --vfs-cache-mode writes \
    --allow-other \
    --dir-cache-time 5m \
    --poll-interval 1m \
    --log-level DEBUG \
    --log-file "$LOG_FILE" \
    --daemon

# Check mount status
sleep 5
mountpoint -q "$MOUNT_POINT" && echo "Drive mounted successfully" || echo "Mount failed"

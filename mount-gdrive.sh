#!/bin/bash
MOUNT_POINT="/mnt/gdrive"
RCLONE_REMOTE="gdrive:"
RCLONE_CONFIG="/root/.config/rclone/rclone.conf"
LOG_FILE="/var/log/rclone.log"

mkdir -p "$MOUNT_POINT"

# Detailed mounting with error handling
rclone mount "$RCLONE_REMOTE" "$MOUNT_POINT" \
    --config="$RCLONE_CONFIG" \
    --vfs-cache-mode writes \
    --allow-other \
    --log-level DEBUG \
    --log-file="$LOG_FILE" \
    && echo "Mount successful" \
    || (echo "Mounting failed. Check logs." && cat "$LOG_FILE")

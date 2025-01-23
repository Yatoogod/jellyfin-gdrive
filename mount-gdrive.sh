#!/bin/bash
# Google Drive Mounting Script for Northflank

MOUNT_POINT="/mnt/gdrive"
RCLONE_REMOTE="gdrive:"
RCLONE_CONFIG="/root/.config/rclone/rclone.conf"
LOG_FILE="/var/log/rclone.log"

# Ensure mount directory exists
mkdir -p "$MOUNT_POINT"

# Attempt mounting with detailed options
rclone mount "$RCLONE_REMOTE" "$MOUNT_POINT" \
    --config="$RCLONE_CONFIG" \
    --vfs-cache-mode writes \
    --allow-other \
    --log-level DEBUG \
    --log-file="$LOG_FILE"

# Check mount status
if [ $? -ne 0 ]; then
    echo "Mounting failed. Check $LOG_FILE for details."
    cat "$LOG_FILE"
    exit 1
fi

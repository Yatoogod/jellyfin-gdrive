#!/bin/bash
# Load FUSE kernel module
modprobe fuse || true

# Mount Google Drive using Rclone
/mount-gdrive.sh &
sleep 5

# Start Jellyfin
exec /jellyfin/jellyfin "$@"

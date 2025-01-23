#!/bin/bash
# Ensure FUSE is loaded
if command -v fusermount3 >/dev/null 2>&1; then
    echo "FUSE available"
else
    echo "FUSE not found, installing..."
    apt-get update && apt-get install -y fuse3
fi

# Mount Google Drive
/mount-gdrive.sh &

# Start Jellyfin
exec /jellyfin/jellyfin "$@"

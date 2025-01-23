#!/bin/bash

# Mount Google Drive to a specific directory
rclone mount gdrive: /mnt/gdrive \
    --vfs-cache-mode writes \
    --allow-other \
    --daemon

# Log successful mount
echo "Google Drive mounted at /mnt/gdrive"

rclone mount gdrive: /mnt/gdrive \
    --vfs-cache-mode writes \
    --allow-other \
    -vv --log-file=/var/log/rclone-debug.log

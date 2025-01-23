# mount-gdrive.sh
#!/bin/bash
mkdir -p /media/gdrive
rclone mount gdrive:/ /media/gdrive --allow-other &

# entrypoint.sh
#!/bin/bash
/mount-gdrive.sh
/jellyfin/jellyfin

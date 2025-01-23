#!/bin/bash
mkdir -p /media/gdrive
rclone mount gdrive:/ /media/gdrive --allow-other &

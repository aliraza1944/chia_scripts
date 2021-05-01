#!/bin/bash

# mounts temporary and final plot storage.
# run in ubuntu folder i.e. root

mkdir temp_plots

mkdir final_plots

lsblk

echo ""

read -p 'temp drive name: ' temp_drive

read -p 'final drive name: ' final_drive

# create logs directory
mkdir plot_logs

# format fs and mount
read -r -p "format drives to ext4 before mounting? [y/N] : " response

if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    echo "formatting drives before mounting"

    sudo mkfs -t ext4 "/dev/$temp_drive"

    sudo mkfs -t ext4 "/dev/$final_drive"
else
    echo "Mounting drives without formatting"
fi

sudo mount "/dev/$temp_drive" temp_plots

sudo mount "/dev/$final_drive" final_plots

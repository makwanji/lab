#!/bin/bash

# Check if the ./iso directory exists
if [ ! -d "./iso" ]; then
  echo "Error: ./iso directory does not exist."
  exit 1
fi

# Create the ISO image
ISO_NAME="proxmox-ve_8.3-1.iso"
hdiutil create -o "$ISO_NAME" -srcfolder "./iso" -format UDRW -volname "BootableISO"

# Check if the ISO creation was successful
if [ $? -eq 0 ]; then
  echo "Successfully created bootable ISO: $ISO_NAME"
else
  echo "Error: Failed to create bootable ISO."
  exit 1
fi

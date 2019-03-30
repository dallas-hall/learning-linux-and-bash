echo "[INFO] You should never just remove a device from the system without unmounting. This is because not all data may have been written from the buffer to the device yet. Unmounting ensures this happens first. The command is umount, notice the missing N."
echo -e  "# umount /path/to/device/on/virtual-directory\n"
echo "[INFO] If the device won't unmount because it is busy. That usually means it is open in the filesystem somewhere. Get out of that device and then try again."

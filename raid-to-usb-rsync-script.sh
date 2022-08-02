#!/usr/bin/env bash

export RAID_PATH="/raid"
export USB_PATH="/media/veracrypt1"

# https://stackoverflow.com/a/42876846
if [[ "$EUID" = 0 ]]; then
	echo "[INFO] Already root."
else
	sudo -k
	if sudo true; then
		echo "[INFO] Authenticated as sudo. Executing script as sudo."
	else
		echo "[ERROR] Wrong password. Exiting script with no changes."
		exit 1
	fi
fi

# https://www.tldp.org/LDP/abs/html/fto.html
#if [[ -d '/media/veracrypt2/' ]]; then
#	echo "[INFO] RAID mounted, checking USB."
#else
#	echo "[ERROR] RAID not mounted, exiting script with no changes."
#	exit 1
#fi

#if [[ -d '/media/veracrypt8/' ]]; then
#	echo "[INFO] USB mounted, rsyncing files."
#else
#	echo "[ERROR] USB not mounted, exiting script with no changes."
#	exit 1
#fi

if grep -qs "$RAID_PATH" /proc/mounts; then
	echo "[INFO] RAID mounted, copying files from $RAID_PATH/"
else
	echo "[ERROR] RAID not mounted, exiting script with no changes."
	exit 1
fi

if grep -qs "$USB_PATH" /proc/mounts; then
	echo "[INFO] USB mounted, copying files to $USB_PATH/"
else
	echo "[ERROR] USB not mounted, exiting script with no changes."
	exit 1
fi

# The trailing / is needed here.
rsync --archive --executability --delete \
--progress --stats --ignore-errors \
--human-readable --force \
--exclude="lost+found" --exclude=".Trash*" \
$RAID_PATH/ $USB_PATH/

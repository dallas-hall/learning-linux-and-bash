#!/usr/bin/env bash

export RAID_PATH="/raid"

#if [[ -d '/media/veracrypt2/' ]]; then
#	echo "[INFO] RAID mounted, rsyncing files."
#else
#	echo "[ERROR] RAID not mounted, exiting script with no changes."
#	exit 1
#fi

if grep -qs "$RAID_PATH" /proc/mounts; then
	echo "[INFO] RAID mounted, copying select $HOME files to $RAID_PATH"
else
	echo "[ERROR] RAID not mounted, exiting script with no changes."
	exit 1
fi

rsync --archive --executability --delete-after \
--progress --stats --ignore-errors \
--human-readable --force \
--exclude="tmp" --exclude="build" \
--exclude=".Trash" --exclude="Downloads" \
--exclude="Music" --exclude="ROM" \
--exclude="Videos" --exclude="Pictures" \
--exclude=".cache" --exclude=".local/share/Trash/files" \
--exclude=".dropbox-dist" \
--exclude=".local/share/Steam/steamapps/common/PAYDAY 2" \
--exclude=".local/share/Steam/steamapps/common/dota 2 beta" \
/home/dallas/ "$RAID_PATH"/slash/home/dallas/

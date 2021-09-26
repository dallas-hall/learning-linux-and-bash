#!/usr/bin/env bash

#if [[ -d '/media/veracrypt2/' ]]; then
#	echo "[INFO] RAID mounted, rsyncing files."
#else
#	echo "[ERROR] RAID not mounted, exiting script with no changes."
#	exit 1
#fi

if grep -qs '/media/veracrypt2' /proc/mounts; then
	echo "RAID mounted, copying files."
else
	echo "RAID not mounted, exiting script with no changes."
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
/home/blindcant/ /media/veracrypt2/dallas-linux-home/

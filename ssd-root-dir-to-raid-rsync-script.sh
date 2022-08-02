#!/usr/bin/env bash

export RAID_PATH="/raid"

# https://stackoverflow.com/a/42876846
if [[ "$EUID" = 0 ]]; then
	echo "[INFO] Executing script as root."
else
	echo "[ERROR] Currently not root. Exiting script with no changes."
	exit 1
fi

#if [[ -d '/media/veracrypt2/' ]]; then
#	echo "[INFO] RAID mounted, rsyncing files."
#else
#	echo "[ERROR] RAID not mounted, exiting script with no changes."
#	exit 1
#fi

if grep -qs "$RAID_PATH" /proc/mounts; then
	echo "[INFO] RAID mounted, copying files to $RAID_PATH"
else
	echo "[ERROR] RAID not mounted, exiting script with no changes."
	exit 1
fi

# https://unix.stackexchange.com/a/368216 and the \ needs to have a space before it
rsync --archive --executability --delete-after \
--progress --stats --ignore-errors \
--human-readable --force \
--include="/var" --include="/var/spool" --include="/var/spool/cron" \
--include="/var/spool/cron/blindcant" --include="/var/spool/cron/root" \
--include="/var/spool/anacron" --include="/var/spool/anacron/cron.daily" \
--include="/var/spool/anacron/cron.weekly" --include="/var/spool/anacron/cron.monthly" \
--include="/var/www" --include="/var/www/cgi-bin" --include="/var/www/html" \
--exclude="*" \
/ "$RAID_PATH"/slash

rsync --archive --executability --delete-after \
--progress --stats --ignore-errors \
--human-readable --force \
/opt/ "$RAID_PATH"/slash/opt

rsync --archive --executability --delete-after \
--progress --stats --ignore-errors \
--human-readable --force \
/usr/local/ "$RAID_PATH"/slash/usr/local

rsync --archive --executability --delete-after \
--progress --stats --ignore-errors \
--human-readable --force \
/etc/ "$RAID_PATH"/slash/etc

rsync --archive --executability --delete-after \
--progress --stats --ignore-errors \
--human-readable --force \
/root/ "$RAID_PATH"/slash/root/


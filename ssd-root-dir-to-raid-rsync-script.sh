#!/usr/bin/env bash

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

if grep -qs '/media/veracrypt2' /proc/mounts; then
	echo "RAID mounted, copying files."
else
	echo "RAID not mounted, exiting script with no changes."
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
#--include="/etc" --include="/etc/dnf" --include="/etc/dnf/dnf.conf" \
#--include="/etc/ssh" --include="/etc/ssh/sshd_config" \
#--include="/etc/hosts" --include="/etc/crypttab" --include="/etc/fstab" \
#--include="/etc/X11" --include="/etc/X11/xorg.conf.d" \
#--include="/etc/X11/xorg.conf.d/00-keyboard.conf" \
#--include="/etc/X11/xorg.conf.d/10-monitor.conf" \
#--include="/etc/X11/xorg.conf.d/50-mouse-acceleration.conf" \
#--include="/root" --include="/root/.bashrc" --include="/root/.vimrc" \
--exclude="*" \
/ /media/veracrypt2/root

rsync --archive --executability --delete-after \
--progress --stats --ignore-errors \
--human-readable --force \
/etc/ /media/veracrypt2/root/etc/

rsync --archive --executability --delete-after \
--progress --stats --ignore-errors \
--human-readable --force \
/root/ /media/veracrypt2/root/root/


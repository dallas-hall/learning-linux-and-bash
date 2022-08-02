#!/usr/bin/env bash

rsync --archive --executability \
--progress --stats --ignore-errors \
--human-readable --force \
/home/dallas/Dropbox/Sync/KeePassXC/dallas.kdbx /home/dallas/Documents/KeePassXC/dallas-from-dropbox.kdbx

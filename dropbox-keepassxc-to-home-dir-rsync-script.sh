#!/usr/bin/env bash

rsync --archive --executability \
--progress --stats --ignore-errors \
--human-readable --force \
/home/blindcant/Dropbox/Sync/KeePassXC/blindcant.kdbx /home/blindcant/Documents/KeePassXC/blindcant-from-dropbox.kdbx

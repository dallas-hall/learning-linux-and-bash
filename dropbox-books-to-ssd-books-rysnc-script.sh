#!/usr/bin/env bash

rsync --archive --executability \
--progress --stats --ignore-errors \
--human-readable --force \
/home/blindcant/Dropbox/Sync/Books/ /home/blindcant/Documents/Books

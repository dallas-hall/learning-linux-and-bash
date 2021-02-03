# https://stackoverflow.com/a/48010623
rsync --archive --executability --progress --stats --ignore-errors --human-readable \
--include=".gitconfig" --include=".bashrc" --include=".vimrc" \
--include=".bash_history" --include=".netrc" \
--include=".config" --include=".config/dconf" --include=".config/dconf/user" \
--include=".vscode" --include=".vscode/***" \ # Need to explicitly state the directory for inclusion other the exclude * will remove it.
--include="Development" --include="Development/***" \ # The triple * here means to copy everything recursively inside of this folder.
--include=".ssh"  --include=".ssh/***" \
--exclude="*" \
/home/$USER/ $HOSTNAME:/home/$USER # The slash on the end of dhall/ means to copy the directory contents but excluding the dhall directory.

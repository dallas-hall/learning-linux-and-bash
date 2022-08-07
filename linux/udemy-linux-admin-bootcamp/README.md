# Admin Bootcamp

## Linux Distributions

Linux distribution (distro) is the kernel plus a selection of curated software. You can change the default software if you like.

## Fundamentals

`/tmp` is typically cleared by the O/S on a reboot.

Applications not bundled with the distro are often installed into `/usr/local/$APP` and they can have their own directory structure in there like `/usr/local/$APP/bin`, `/usr/local/$APP/etc`, etc. The same convention can be used in `/opt` as well if the application is installed there, e.g. `/opt/$APP`. The application could also be installed in a shared manner like `/usr/local/bin/$APP_BINARY`, `/usr/local/etc/$APP_CONFIG` etc.

The shell is the default interface to the Linux system.

Use `~` and tab expansion to see all the service accounts on the system.

```
[dallas@desktop ~] $ l ~
~abrt/             ~chrony/           ~dbus/             ~games/            ~jiyeon/           ~mysql/            ~openvpn/          ~postfix/          ~rpc               ~sddm/             ~sync/             ~systemd-resolve/  ~unbound/
~adm/              ~colord/           ~dnsmasq/          ~geoclue/          ~lightdm/          ~nm-openconnect/   ~operator/         ~qemu/             ~rpcuser/          ~setroubleshoot/   ~systemd-coredump/ ~systemd-timesync/ ~vboxadd
~avahi/            ~daemon/           ~flatpak/          ~gluster/          ~lp/               ~nm-openvpn/       ~pipewire          ~radvd/            ~rtkit/            ~shutdown/         ~systemd-network/  ~tcpdump/
~bin/              ~dallas/           ~ftp/              ~halt/             ~mail/             ~nobody/           ~polkitd/          ~root/             ~saslauth          ~sshd/             ~systemd-oom/      ~tss

[dallas@desktop ~] $ l -d ~sddm/
drwxrwx--T. 4 sddm sddm 4.0K Feb 18 14:33 /var/lib/sddm//
```

`002` or `0002` is an ideal umask for files and folders to allow user and groups access.

`umask` displays in 4 characters and the first character represents the set UID, set GID, or sticky bit.

`touch` can be used to update the modification and/or access timestamp of a file.

`find` with :
* `-ls` will do an `ls -l`.
* `-mtime $DAYS` will find files in a time range. See `man` for full explanation.
* `-size $NUMBER[$UNIT]` will find files in a size range. See `man` for full explanation.
* `-ls` will do an `ls -l`.
* `-newer $FILE` will find files newer than `$FILE`.

`locate` is like the `find` command but it requires an index for searching. The index is built daily.

`head` and `tail` can use `-$NUMBER` instead of `-n $NUMBER` to display `$NUMBER` of lines.

`nano` is a clone of `pico`. Use `control` i.e. `^` to enter commands.

### vi

`view` starts `vi` in read only mode.

In `vi` the command `:x` is the same as `:wq`.

Use `:help [subcommand]` to get help for commands.

`$NUMBERi$TEXT` will insert `$TEXT` `$NUMBER` of times. e.g. `80i_` will insert 80 underscores.

`D` delete from the current curosr position to the end of the line.
`cw` change the current word boundary.
`cc` change the current line.
`c$` change text from the current curosr position. `C` is the same.
`~` reverses the case of a character.




# Admin Bootcamp <!-- omit in toc -->

All of the information here is stuff that wasn't covered in https://linuxcommand.org/tlcl.php and https://www.udemy.com/course/red-hat-enterprise-linux-8-technical-overview/

## Table of Contents <!-- omit in toc -->

- [Basic Knowledge](#basic-knowledge)
  - [Linux Distributions](#linux-distributions)
  - [Fundamentals](#fundamentals)
    - [vi](#vi)
    - [emacs](#emacs)
- [Intermediate Skills](#intermediate-skills)
  - [Comparing Files](#comparing-files)
  - [Custom Shell Prompts](#custom-shell-prompts)
  - [crontab](#crontab)
  - [Shell History](#shell-history)
  - [Boot Process](#boot-process)
    - [BIOS](#bios)
    - [Boot Loaders](#boot-loaders)
    - [Linux Kernel](#linux-kernel)
    - [Runlevels](#runlevels)
  - [System Logging](#system-logging)
    - [Syslog Standard](#syslog-standard)
    - [Log Rotation](#log-rotation)
- [Disks](#disks)
  - [Partitions](#partitions)
  - [Filesystems](#filesystems)
  - [Mounting](#mounting)
  - [Logical Volume Manager (LVM)](#logical-volume-manager-lvm)
    - [Create & Extend LVM](#create--extend-lvm)
    - [Delete LVM](#delete-lvm)
    - [Migratiting LVM Data](#migratiting-lvm-data)
  - [Users](#users)
  - [Networking](#networking)

# Basic Knowledge

## Linux Distributions

Linux distribution (i.e. distro for short) is the kernel plus a selection of curated software. You can change the default software if you like.

## Fundamentals

`/tmp` is typically cleared by the O/S on a reboot.

Applications not bundled with the distro are often installed into `/usr/local/$APP` and they can have their own directory structure in there like `/usr/local/$APP/bin`, `/usr/local/$APP/etc`, etc. The same convention can be used in `/opt` as well if the application is installed there, e.g. `/opt/$APP`. The application could also be installed in a shared manner like `/usr/local/bin/$APP_BINARY`, `/usr/local/etc/$APP_CONFIG` etc.

The shell is the default interface to the Linux system.

Use `~` and tab expansion to see all the service accounts and users on the system.

```
[dallas@desktop ~] $ l ~
~abrt/             ~chrony/           ~dbus/             ~games/            ~jiyeon/           ~mysql/            ~openvpn/          ~postfix/          ~rpc               ~sddm/             ~sync/             ~systemd-resolve/  ~unbound/
~adm/              ~colord/           ~dnsmasq/          ~geoclue/          ~lightdm/          ~nm-openconnect/   ~operator/         ~qemu/             ~rpcuser/          ~setroubleshoot/   ~systemd-coredump/ ~systemd-timesync/ ~vboxadd
~avahi/            ~daemon/           ~flatpak/          ~gluster/          ~lp/               ~nm-openvpn/       ~pipewire          ~radvd/            ~rtkit/            ~shutdown/         ~systemd-network/  ~tcpdump/
~bin/              ~dallas/           ~ftp/              ~halt/             ~mail/             ~nobody/           ~polkitd/          ~root/             ~saslauth          ~sshd/             ~systemd-oom/      ~tss

[dallas@desktop ~] $ l -d ~sddm/
drwxrwx--T. 4 sddm sddm 4.0K Feb 18 14:33 /var/lib/sddm//
```

`ls -F` will reveal file types by appending characters to the end.
* The `/` is for a directory.
* The `@` is for a link
* The `*` is for an executable

`002` or `0002` is an ideal umask for files and folders to allow user and groups access.

`umask` displays in 4 characters and the first character represents the set UID, set GID, or sticky bit. `umask -S` accepts symbolic notation.

`touch` can be used to update the modification and/or access timestamp of a file.

`find` with :
* `-ls` will do an `ls -l`.
* `-mtime $DAYS` will find files in a time range. See `man` for full explanation.
* `-size $NUMBER[$UNIT]` will find files in a size range. See `man` for full explanation.
* `-newer $FILE` will find files newer than `$FILE`.

`locate` is like the `find` command but it requires an index for searching. The index is built daily so results are not real time.

`head` and `tail` can use `-$NUMBER` instead of `-n $NUMBER` to display `$NUMBER` of lines.

`nano` is a clone of `pico`, see https://linuxgazette.net/issue50/guckes.html. Use `control` i.e. `^` to enter commands.

`sort -k $FIELD_NUMBER` to sort on a specific field.

The hyphen for `tar` options is optional. e.g. `tar -zxvf` is the same as `tar zxvf`. `tar -t` lists the file.

`gzcat` and `zcat` are the same.

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

`:$NUMBER` will go to that line number.

`gvim` is the GUI version.

### emacs

`emacs [$FILE]` to start the editor.

The documentation shows:
* `C-<char>` which means hold the control key and press a character key.
* `M-<char>` which means 2 things:
  1. Hold the alt key (i.e. meta key) and press a character key.
  2. Press the escape key and press a character key. This is used incase the alt key is being intercepted.

`C-h` to get help.
`C-x` or `C-c` to exit.
`C-x` or `C-s` to save.
`C-h` or `t` for the tutorial.
`C-h` followed by a character key to describe that combination.

`emacs` has a GUI version too.

# Intermediate Skills

`strings` can be used to look at text within a binary file.
`column -t` can be used to print a table.

## Comparing Files

`diff $FILE1 $FILE2` compares two files.
`sdiff $FILE1 $FILE2` compares two files side by side.
`vimdiff $FILE1 $FILE2` highlights differences in `vim` in separate windows. `qa` closes all open files and `ww` to move between windows.

## Custom Shell Prompts

`$prompt` is used instead of `$PS1` in csh, tcsh, and zsh.
`\t` does 24 hour current time in HH:MM:SS format and `\T` does 12 hour current time in HH:MM:SS format.
`\A` does 24 hour current time in HH:MM format and `\@` does 12 hour current time in HH:MM format.

## crontab

Some versions of `crontab` allow you to use annotations for commonly used scheduling times. e.g.
* `@monthly` = `0 0 1 * *`
* `@weekly` = `0 0 * * 0`
* `@daily` and `@midnight` = `0 0 * * *`
* `@hourly` = `0 * * * *`

## Shell History

Shell history files are commonly stored in memory and written to disk on exit. So common locations are:
* `~/.bash_history`
* `~/.history`
* `~/.histfile`

You can using `!:N` to get a value from the last command, e.g. `!:0` will get the command name and `!:1` will get the first argument. You can use shortcuts like `!^` for `!:1` (i.e. the first argument) and `!$` for the last argument.

You can keep pressing `^R` to cycle through shell history searches.
`^G` can be used to exit `^R` history searching.

## Boot Process

### BIOS

**Basic Input Output System (BIOS)** is firmware that is always run when the computer is turned on or reset. It is O/S independent and its primary purpose is to perform a **Power On Self Test (POST)** and if successful will then look for a boot loader. These can be on DVDs, USBs, or HDDs/SSDs/NVMes.

### Boot Loaders

**Linux Loader (LILO)** was the traditional boot loader for Linux but it has been replaced by the **Grand Unified Bootloader (GRUB)**. Boot loaders start the O/S, with or without custom parameters.

In GRUB press `e` to edit the currently highlighted boot option. Look for the line starting with `linux` and that is the Kernel being loaded. Any parameters are the Kernel are passed to the Kernel when loaded. Remove the `quiet` parameter for verbose boot logging. Press `^x` to boot from the edited GRUB entry. Press `esc` to quit back to the GRUB menu with no changes.

### Linux Kernel

`initrd` is for Linux kernels 2.4 and lower and `initramfs` is for Linux kernels 2.6 and above, e.g. `initramfs-5.19.10-200.fc36.x86_64.img`. Both are temporary filesystems stored in memory that contain device drivers and other code that are required to run the real filesystem and Linux kernel. These files are stored in `/boot` and `/boot/efi`. If the kernel is compressed its named will end in `z`, e.g. `vmlinuz-5.19.10-200.fc36.x86_64`

The kernel ring buffer is a data structure that records messages related to the operation of the kernel. A ring buffer is a special kind of buffer that is always a constant size, removing the oldest messages when new messages are received. You can view it with `dmesg`. The kernel ring buffer is also logged to files so you can view its entire contents, either with `/var/log/dmseg` or `journalctl -k|--dmesg`. You can view boot messages with `journalctl -k -b -1`

### Runlevels

A runlevel is a state of init and the whole system that defines what system services are operating. Run levels are identified by numbers. They were traditionally controlled by init from `/etc/inittab` but now they are typically replaced SystemD.

SystemD uses targets which are roughly equivalent to runlevels. You can see this by viewing the symlinks `/lib/systemd/system/runlevel*`

```
lrwxrwxrwx. 1 root root   15 Jul 14 23:30 /lib/systemd/system/runlevel0.target -> poweroff.target
lrwxrwxrwx. 1 root root   13 Jul 14 23:30 /lib/systemd/system/runlevel1.target -> rescue.target
lrwxrwxrwx. 1 root root   17 Jul 14 23:30 /lib/systemd/system/runlevel2.target -> multi-user.target
lrwxrwxrwx. 1 root root   17 Jul 14 23:30 /lib/systemd/system/runlevel3.target -> multi-user.target
lrwxrwxrwx. 1 root root   17 Jul 14 23:30 /lib/systemd/system/runlevel4.target -> multi-user.target
lrwxrwxrwx. 1 root root   16 Jul 14 23:30 /lib/systemd/system/runlevel5.target -> graphical.target
lrwxrwxrwx. 1 root root   13 Jul 14 23:30 /lib/systemd/system/runlevel6.target -> reboot.target
```

Use `telinit $RUNLEVEL_NUMBER` and `systemctl isolate $TARGET_NAME` to change runlevels and targets in real time.

## System Logging

### Syslog Standard

The syslog standard allows apps to generate messages that can be captured, processed, and stored by a system logger. Thus logging can be configured and controlled in a central location without apps having to implement their own logging.

Each message is labelled with a facility code and a severity level. Facility code indicates where the log message originated from (e.g. 0 is the kernel) and the severity code indicates what type of message it is (e.g. 0 is for emergency, the highest level meaning the system is unusable).

There are 8 local facilities that can be used by local apps, local0 through to local7.

Traditionally `syslogd` implemented the syslog standard but typically it has been replaced by `rsyslog`. The main configuration file is at `/etc/rsyslog.conf` and additional configuration files are loaded from `/etc/rsyslog.d/`. The logging rules have 2 components:
1. The selector field determines what to monitor and the list of logging severities.
   1. A `;` semi-colon is used to separate multiple selector fields.
2. The action field determines how to process the message.
   1. A `-` minus sign at the start uses caching mode. Meaning messages aren't immediately written to disk. So they may be lost if the system crashes.

These 2 components are separated by space or tabs.

```
# Write mail warnings using caching mode
mail.warn `/var/log/mail.warn

# Write all messages except mail, authpriv, and cron
*.info;mail.none;authpriv.none;cron.none /var/log/messages
```

The `logger` command can be used to generate syslog messages. The default FACILITY.SEVERITY is user.notice but you can override this with `-p`.

### Log Rotation

Provides an automated way to manage log files and prevent them filling up the disk. The configuration file is located at `/etc/logrotate.conf` and can include files from `/etc/logrotate.d/`.

# Disks

## Partitions

A single phyiscal storage device can be divided up into multiple sections, known as partitions.

The **Master Boot Record (MBR)** is a special boot sector at the beginning of a partitioned storage device. It contains information on how the storage device is partitioned. It has some limitations like:
* Up to 4 primary partitions only. An extended partition can be used to get around this.
* A maximum partition size of 2 TB

The MBR is being replaced by **Global Unique ID Partition Table (GPT)**. GPT is apart of Unified **Extensible Firmware Interface (UEFI)** which is replacing BIOS. It was created to overcome the limitations of MBR.

`fdisk` is a common utility for disk partitioning. `gdisk` and `parted` are alternatives.

`fdisk -l` will list drives and partitions.
`fdisk $DEVICE` will load an interactive menu. Press `n` to create a new MBR partition or press `g` to create a new GPT partition. After this you need to:
* Select the partition number, the default is fine.
* Select the sector to start the partition, the default is fine.
* Select the partition size, enter the size you want or the default is use the remainder of available space.
Press `t` to change the partition type and `w` to write the changes to the disk.

## Filesystems

There are a variety of filesystems available for Linux, ext4 is very popular. `mkfs -t $FS_TYPE $DEVICE` is used to create the filesystem on a partition.

Swap partitions are created with `mkswap $DEVICE` and mounted with `swapon $DEVICE`.

## Mounting

Partitions need to be mounted before you can access the data. You can do this with `mount $DEVICE $PATH` and you can unmount partitions with `umount $PATH|$DEVICE`. To automtically mount a partition at boot time you need to add it to `/etc/fstab`. There are 6 entries separated by a space on each line:
1. Device, can be mount path, label, or UUID.
2. Mount point.
3. Filesystem type.
4. Mount options, multiples are separated by a comma.
5. Dump back up toggling, rarely used anymore.
6. fsck boot time check order, 0 is skipped and 1 or 2 for priority.

`lsblk -f` and `blkid` can view labels and UUIDs. You can label ext filesystems with `e2label $PATH $LABEL`.

You can mount partitions over existing data. This doesn't destroy data but you can't see the data from the original mount until you unmount the new mount.

## Logical Volume Manager (LVM)

LVM allows you to:
* Create filesystems that extend across multiple physical storage devices.
* Expand or shrink filesystems in real-time.
* Easily migrate data.
* Give your storage volumes human readable descriptive names.
* Stripe or mirror data across multiple disks.
* Create point in time filesystem snapshots.


There are multiple layers of abstraction with LVM:
* (Top) File system, e.g. ext4 installed into the LV.
* Logical Volumes (LV), is a partitioned VG.
  * LVs contain extents, a small fixed sized chunk. There are logical extents within LVM and phyiscal extents on the storage devices. LVM maps logical extents to phyiscal extents. You cannot use all available extents, some are set aside for metadata.
* Volume Group (VG) is a group of combined PVs.
* Phyiscal Volume (PV), regular storage device(s) that have been allocated for LVM.
* (Bottom) Storage devices, any regular block storage device (e.g. HDD or SSD).

**Note:** `/boot` cannot be on a logical volume group because the boot loader cannot read it.

The high level steps to using LVM are:
1. Create your PV(s) from storage devices.
2. Create your VG from your PV.
3. Create your LV(s) from your VG.
4. Install a file system into the LV(s).

### Create & Extend LVM

```bash
# Show disk information
lvmdiskscan
lsblk
df -h
fdisk -l

# Create a PV
pvcreate /dev/$STORAGE_DEVICE

# View PV
pvs

# Create a VG
vgcreate vg_$NAME /dev/$STORAGE_DEVICE

# Extend a VG
vgextend vg_$NAME /dev/$STORAGE_DEVICE

# View VG
vgs

# Create LV
# Add -m $NUMBER to create a RAID
lvcreate -L $SIZE -n lv_$NAME vg_$NAME
lvcreate  -l $PERCENT_FREE -n lv_$NAME vg_$NAME

# Extend and resize the LV.
# Use + to add the specified size, without it you need to calculate total size.
# -r will resize the LV.
lvextend -L +$SIZE -r $LV_PATH

# Manually resize if you forget -r
resize2fs $LV_PATH

# View LV
# Cpy&Sync shows RAID LV details.
lvs
lvdisplay

# Create file system
mkfs -t ext4 $LV_PATH

# Mount the file system
mkdir -p $MOUNT_PATH
mount $LV_PATH $MOUNT_PATH
```

### Delete LVM

```bash
# Unmount the LV
umount $MOUNT_PATH

# Delete LV(s)
lvs
lvremove $LV_PATH

# Delete VG(s)
vgs
# Use this when multiple PVs are in the VG
vgreduce vg_$NAME
# Use this when 1 PV is in the VG
vgremove vg_$NAME

# Delete PV(s)
pvs
pvremove /dev/$STORAGE_DEVICE
```

### Migratiting LVM Data

```bash
# Create PV
pvcreate /dev/$STORAGE_DEVICE

# Add PV to existing VG
lvextend $LV_PATH /dev/$STORAGE_DEVICE

# Migrate data
pvmove /dev/$SOURCE_STORAGE_DEVICE /dev/$TARGET_STORAGE_DEVICE
```

## Users

The first entry in `/etc/passwd` is always for root. The format of this is file is a `:` separated list of information about the user. `username:password (always x):UID:GID:comments:home folder:shell`
* Usernames can be up to 32 characters but typically 8 or less is used. Sometimes usernames greater than 8 characters will have the UID displayed instead.
* The password is no longer stored here and always is `x`. The password hash is stored in `/etc/shadow` which only readable by `root`. The format of this is file is a `:` separated list of information about the user's password.
  * Username
  * Password hash
  * The date of the last password change, expressed as the number of days since Jan 1, 1970 (Unix time). `0` means to change password at next login.
  * The number of days left before the user is allowed to change their password.
  * The maximum number of days the password is valid, after that user is forced to change her password again. `99999` means never expire.
  * The number of days before password is to expire that user is warned that their password must be changed.
  * The number of days after password expires that account is disabled.
  * The date of expiration of the account, expressed as the number of days since Jan 1, 1970.
* The `newgrp` command can be used to create files and folders with a different primary group.
* If the users home folder doesn't exist in the filesystem it will be placed inside of `/`
* The `/etc/shells` file shows what shells are supported by the system. There is also `/usr/sbin/nologin` and `/bin/false` for accounts that cannot login, i.e. service and system accounts.

`/etc/login.defs` defines the UID and GUID ranges for users. Use the same UID and GUID across multiple servers.

`/etc/group` contains group information. The format of this is file is a `:` separated list of information about the user. `group name:password:GUID:user1,...,usern`. If password is `x` then this group has a password in `/etc/shadow`, which is rarely used.

`groups` displays groups for the current user and `group username` displays groups for the specified user.

## Networking


Linux Basics <!-- omit in toc -->
============

Learning Linux Basics Course & Labs from KodeKloud. https://kodekloud.com/courses/the-linux-basics-course/

**NOTE:** Everything listed here isn't present in any other Linux resources that I've done. The full content is availabe at https://github.com/kodekloudhub/linux-basics-course

- [Working With The Shell Part 1](#working-with-the-shell-part-1)
- [Working With The Shell Part 2](#working-with-the-shell-part-2)
  - [Anki cards needed below this line.](#anki-cards-needed-below-this-line)
- [Networking](#networking)
- [Security \& File Permissions](#security--file-permissions)
- [Service Management](#service-management)
- [Storage](#storage)

# Working With The Shell Part 1

The `pushd` commands adds directories to a stack. You can add as many as you like. Use `popd` to return the latest directory from the stack. You can view the stack with `dirs`.

![alt text](image.png)

`udev` is a device manager for the Linux kernel. Whenever a device is added or removed, the kernel sends a `uevent`notification of the change to `udev`.

![alt text](image-1.png)

`uevents` occur when new hardware is detected, they are messages

`dmesg` is used to examine or control the kernel ring buffer.

![alt text](image-2.png) is used to control and query the udev database and events.

`udevadm`

![alt text](image-3.png)

`lspci` prints detailed information about all PCI buses and devices in the system.

![alt text](image-4.png)

`lsblk` prints information about block devices, partitions and filesystems.

![alt text](image-5.png)

`lscpu` prints information about the CPU.

![alt text](image-6.png)

The socket is the physical slot on the motherboard.
The core is how many phyiscal CPUs.
The threads is how many logical CPUs per CPU core.
The total CPU amount is sockets x cores x threads.

![alt text](image-7.png)

`lsmem` prints information about the RAM.

![alt text](image-8.png)

`lshw` prints detailed information about all hardware.

![alt text](image-9.png)

There are 4 high level steps to the boot process:
1. BIOS POST
   1. Basic Input/Output System - Power On Self Test. This is done by the computer's hardware.
2. Boot loader, e.g. GRUB 2.
   1. The first sector of the disk points to the boot loader which is stored in `/boot`. The boot loader is responsible for starting the kernel.
   2. The kernel is stored in a compressed state to save disk space.
3. Kernel initialisaion.
   1. The compressed kernel is loaded into memory and is decompressed. The kernel performs a series of startup steps. The final step is loading the system initialisation process.
4. System initialisation, e.g. systemd. Sys5 was replaced by systemd.
   1. This sets up the user space.

![alt text](image-10.png)

Use `ls -l /sbin/init` to see which system initialisastion proces is being used.

![alt text](image-11.png)

The 2 most common run levels are:
* 3 for the shell.
* 5 for GUI.

![alt text](image-12.png)

`systemctl get-default`  shows what the current run level is and `systemctl set-default $LEVEL` changes the run leve.

![alt text](image-13.png)

![alt text](image-14.png)

There are 3 types of files in Linux:
1. Regular files,
2. Directories,
3. Special files.

![alt text](image-15.png)

There are 5 special file types:
1. Character files are serial devices in `/dev` like the mouse and keyboard.
2. Block files are block storage devices in `/dev` like HDD and RAM.
3. Links:
   1. Hard Links
   2. Symbolic LInks
4. Socket files enable communication between two processes. e.g. a Unix socket for `localhost` connectivity.
5. Named Pipes allow data to flow from one process to another. e.g. `$CMD1 | $CMD2`

![alt text](image-16.png)

The file attributes in `ls -l` are:

![alt text](image-17.png)

A software package is a compressed archive that contains all the files required by a particular software to run.

![alt text](image-18.png)

The manifest contains the information required for that particular software to run correctly. Package managers use this file to install dependencies.

![alt text](image-19.png)

![alt text](image-20.png)

![alt text](image-21.png)

`apt` and the original `apt-get` are the frontend of the `dpkg` package manager. Similarly, `dnf` and the original `yum` are the frontend of the `rpm` package manager. These frontends provide dependency resolution and other advanced features.

![alt text](image-22.png)

The Red Hat Package manager uses `.rpm` files and has 5 main methods:
1. Installing `rpm -i $RPM_FILE`
2. Uninstalling `rpm -e $RPM_FILE`,
3. Upgrading `rpm -U $PACKAGE`,
4. Querying `rpm -q $PACKAGE` to query the `/var/lib/rpm` database,
5. Verifying `rpm -V $PACKAGE`.

`/etc/yum.repos.d/redhat.repo` points to the official Red Hat repository.

![alt text](image-23.png)

`yum repolist` shows all repositories in the system.

![alt text](image-24.png)

`yum provides $PACKAGE` shows which repo provides `$PACKAGE`.

![alt text](image-25.png)

![alt text](image-26.png)

The Debian Package manager uses `.deb` files and has 5 main methods:
1. Installing `dpkg -i $DEB_FILE`
2. Uninstalling `dpkg -i $DEB_FILE`,
3. Upgrading `dpkg -l $PACKAGE`,
4. Querying `dpkg -s $PACKAGE`,
5. Verifying `dpkg -p $PACKAGE_PATH`.

`/etc/apt/sources.list` contains repositories.

![alt text](image-27.png)

`apt edit-sources` opens `/etc/apt/sources.list` in a text editor for editing.

`apt search $PACKAGE` to search for a package.

`apt list | grep $PACKAGE` to search all available packages.

Use `apt` over `apt-get`.

# Working With The Shell Part 2

Anki cards needed below this line.
---

File compression is a process of reducing the size of one or more files to make them smaller and more manageable. This is typically done to save storage space, reduce bandwidth usage when transmitting files over networks, and speed up file transfers.

There are 3 popular compression tools in Linux:
1. `bzip2` which can be uncompressed with `bunzip2`.
2. `gzip` which can be uncompressed with `gunzip`.
3. `xz` which can be uncompressed with `unxz`.

![alt text](image-28.png)

You can work with compressed files with tools like:
* `zcat`, `bzcat`, and `xzcat`.
* `zless`, `bzless`, and `xzless`.
* `zgrep`, `bzgrep`, and `xzgrep`.
* `zdiff`, `bzdiff`, and `xzdiff`.

![alt text](image-29.png)

# Networking

# Security & File Permissions

# Service Management

# Storage

# RH024 - RHEL Technical Overview

These notes are a combination of https://rhtapps.redhat.com/promo/course/rh024, https://www.udemy.com/course/red-hat-enterprise-linux-technical-overview/, and https://www.udemy.com/course/red-hat-enterprise-linux-8-technical-overview/

All of the information here is stuff that wasn't covered in https://linuxcommand.org/tlcl.php

- [RH024 - RHEL Technical Overview](#rh024---rhel-technical-overview)
  - [Why Linux?](#why-linux)
  - [Open Source Software](#open-source-software)
    - [Copyleft Licence Versus Permissive Licences](#copyleft-licence-versus-permissive-licences)
  - [What Is A Linux Distribution](#what-is-a-linux-distribution)
  - [Shell Introduction](#shell-introduction)
  - [Kernel and User Spaces](#kernel-and-user-spaces)
  - [GUI](#gui)
  - [File Management](#file-management)
  - [File System Hierarchy](#file-system-hierarchy)
  - [vim](#vim)
  - [Users & Groups](#users--groups)
  - [File Permissions](#file-permissions)
  - [Software Management](#software-management)
  - [Network Configuration](#network-configuration)
  - [System Startup Processes](#system-startup-processes)
  - [Getting Help & Learning More](#getting-help--learning-more)

## Why Linux?

A few reasons why to learn Linux.
* Linux is everywhere!
  * Most web servers run Linux.
  * Most cloud servers run Linux.
  * Smart devices (TVs, phones, etc).
  * Many other devices run Linux (e.g. IoT, point of sales systems, etc)
  * Almost all top 500 supercomputers use Linux.
* 90% of the fortune 500 companies use Linux.
* It is open source and has a lot of contributers to it.
* It is modular, which is great for backwards compatibility and customisation.
* There are many jobs available relating to Linux.

## Open Source Software

What is open source software and why does it matter? All software is protected by copyright law and the usage licence the developer applies to it.

Traditionally software was written by companies, the source code being compiled into a binary, and end users are only allowed to run that binary. Any other use case was prohibited and you needed to pay to use the software. This is proprietry closed source software.

Open source software allows anyone to view the code, compile the code, run the program binary, and even modify the code or contribute to the project. Some open source software is [completely free](https://en.wikipedia.org/wiki/Free_software). Thus open source software provides end users with more options than just paying for and running an executable binary.

Open source software projects can be run by volunteers and/or financially sponsored employees. For example, the Fedora project is run by volunteers and paid Red Hat emmployees. Fedora goes into Red Hat's free CentOS Stream which goes into Red Hat's paid Red Hat Enterprise Linux (RHEL).

Open source software encourages open standards, which provide a standard universal way to do something. This encourages multiple vendors to implement solutions that will work together using this open standard.

### Copyleft Licence Versus Permissive Licences

[Copyleft licences](https://en.wikipedia.org/wiki/Copyleft) are the legal technique of granting certain freedoms over copies of copyrighted works with the requirement that the same rights be preserved in derivative works. e.g. GPL, Mozilla.

[Permissive licences](https://en.wikipedia.org/wiki/Permissive_software_license) carries only minimal restrictions on how the software can be used, modified, and redistributed, usually including a warranty disclaimer. Open source code can be combined with closed source code. e.g. MIT, Apache, BSD.

## What Is A Linux Distribution

A Linux distribution (i.e. distro) is simply an installable operating system built from the Linux kernel and the supporting user programs and libraries that are in needed to create a working system. There are many different Linux distributions from companies and people alike.

## Shell Introduction

The shell is the command line environment where you will work. It is the interface between the user and the rest of the system. The shell is where users type in and execute their commands.

RHEL uses Bash as its default. Bash provides a powerful scripting language which can be used to automate tasks in the shell. Bash is the most popular shell amongst Linux distributions.

A headless server is a server that doesn't have a GUI, it only has a CLI shell available. This is common in the enterprise and in the cloud.

## Kernel and User Spaces

The kernel is the heart of the linux operating system. It is responsible for scheduling running programs, file management, memory management, hardware management, networking, security, etcetera.

Kernel space (e.g. drivers, networking, etc) is where all kernel related processes run. All non-kernal programs (e.g. a shell or browser) run in user space.

User space programs interact with the kernel through special devices or system calls that they make. Each running program is called a process and it has its own private virtual memory space, and runs as a particular `user:group` so it can access files on the file system. A process has a state (e.g. running) and a unique process identification number called a PID.

There are 3 types of processes:
1. **User processes** are generally assocaited with a user and are associated with a terminal. They can be run in the foreground (consuming the terminal input) or in the background (the terminal is available for input).
2. **Daemons processes** aren't associated with a terminal at all, They are started up by the system. In `ps` the tty is ?.
3. **Kernel threads** are parts of the kernel that are running as if they were regular user processes or system daemons. They are not associated with a terminal. In `p`s they are enclosed in square brackets, e.g. `[kworker/1:0-events]`.

In `ps` `tty` means teletype, `pts` means pseudo terminal session, and `ppid` is parent process ID.

`ps aux` and `ps -elfy` are the same.

## GUI

The GUI is divided into 3 main components:
1. The X Window system, which provides basic infrastructure that is used by graphical applications to draw things on the monitor and take input from keyboards and mice.
2. Window managers or desktop environments. A window manager controls the placement and appearance of windows on a monitor. A desktop environment is a window manager plus additional software,
3. Graphical applications are programs that have a GUI, e.g. Firefox or Chrome browser.

The default desktop environment in RHEL is Gnome 3.

Gnome Activities tricks:
* Can right click and add program icons to the dock.
* Can drag open applications to the right hand side to put them into another workspace.

## File Management

Pretty much everything is a file in Linux. All of them can be treated as a stream of bytes which can be read and written type like regular file I/O. There are 7 types of files in Linux:
1. Regular files, containing text or binary.
2. Folders or directories, are used to contain files and folders.
3. Symbolic links, text files that are used as a pointer to another location on the file system.
4. Character devices, which is used for writing streams of data to, e.g. a tape device.
5. Block devices, which is used to create file systems on, e.g. a hard disk.
6. Named pipe, which is used by processes to talk to each other.
7. Named socket, which is used by processes to talk to each other.

Coloured output with `ls` makes it easier to see the differences in types of files.

Block files are special files that represent real physical storage devices. Some files inside of `/dev` will be the storage files, you can see them with `ls -l` and look for the `b` in the first letter of the file attributes.

`-r` or sometimes `-R` is a common command option that means recursively apply the command to all objects within the starting location, and the at the end apply it to the starting location.

`hexdump` can be used to the view the hexadecimal representation of binary in a file, whether its a text file or a block device files like `/dev/sda`

## File System Hierarchy

There are a variety of folders commonly found in the Linux filesystem.
* On Fedora, CentOS, and RHEL `/bin` and `/sbin` are symlinked to `/usr/bin/` and `/usr/sbin/` respectively.
* `/usr` stands for Unix System Resources and it contains a number of important directories.
You can use `whereis` to find where a command is.
* `/boot` contains the kernel and the files necessay to load the kernel. The kernel file starts with `vmlinuz`. GRUB2 is the bootloader that initialises the kernel.
* `/dev` contains device files.
* `/etc` stands for Extended Text Configurations.
* `/lib` and `lib64` contains shared libraries for applications.
* `/tmp` is a location for temporary data. The contents of this directory are removed after 10 days.
* `/var` has data that varies, such as logs and spools. There is also a `/var/tmp` as well, which is cleared every 50 days.

## vim

`Shift` + double `z` will save and exit `vim` when the file already has a name, this is the same as `wq` or `x`.

## Users & Groups

Linux is a multi-user system and may have more than 1 person using it at the same time. There are also different processes running on the system that need to be uniquely identified. So a user identifers who are you on the Linux system. There are 3 types of user accounts in Linux
1. Regular human users, they can log in and have their own private files and folders.
2. System users, these are programs running on the system that also have their own private files and folders.
3. Root user, i.e. the super user, a user that can do anything on the system.

Some basic rules about users and groups:
* A user can be a member of many groups.
* When a user is created there is also a group created with the same name of the username. The user is automatically added to this group. This is called the primary group.
* All other groups that the user is a member of are called supplementary groups.
* Every user has a unique user ID number, known as a uid.
* Every group has a unique group ID number, known as a guid.
* The uid and guid for the user's primary group are typically the same.
* When deleting a user, the user's `$HOME` is not automatically deleted.
* User account information is stored inside a file called `/etc/passwd` but their password is stored inside `/etc/shadow`.
* The `wheel` group is commonly used to grant `sudo` access to users.

## File Permissions

If a file is readable but the directory isn't, you cannot access the file. By default permissions are not applied recursively.

## Software Management

An RPM package is made of 3 things:
1. An archive file containing everything to be installed.
2. Scripts used to install or uninstall the archive files.
3. Metadata about the software being installed, e.g. dependencies.

RPM packages have a standard naming and versioning format, e.g. `httpd-tools-2.4.6-7.el7.x86-64.rpm`:
* Name (e.g `httpd-tools`): The name of the sofware package.
* Version (e.g `2.4.6`): The semantic version of the upstream software package.
* Release (e.g `7.el7`): Updates that have been made to the origianl semantic version of the upstream software package.
* Architecture (e.g. `x86-64`): The CPU architecture the package can run on.

To install the latest version of packages that have the same version but a different release number, install the highest release number.

There are 3 ways to get packages in RHEL:
1. The Red Hat website
2. Red Hat Satellite is an enterprise tool for managing RHEL servers. e.g. subscription monitoring or local `yum` repositories.
3. The `/etc/yum.repos.d/` text files and HTTPS downloads.

## Network Configuration

Every network port on the system is named and its assocaited with a network interface, either physical or virtual. Network interfaces have a standard naming convention:
* `en*` means a physical ethernet interface.
* `wl*` means a physical wireless interface for WiFi networks.
* `ww*` means a physical WWAN interface, e.g. cell phone.
* `eth*` typically means virtual networking interfaces.
* `lo` means loopback interface.
* `tun*` means tunneling network interfaces, e.g. VPN.

The `*` in the names above can be inteface numbers, PCI addresses, ports, etc.

There are a handful of things the system needs to know for networking to work. The network interface:
* Needs to be assigned an IP address.
* Needs to know the subnet mask for its IP address.
* Needs to know the IP address of the network's router.
* Needs to know the IP address of the network's DNS nameserver.

This information is commonly automatically obtained using DHCP.

Network Manager is a system daemon that monitors your network interfaces for configuration and state changes, as well as monitoring the network links themselves to see if they are available. You can use `nmcli` to interact with this. Traditionaly all of this configuration is stored in ifcfg text files within `/etc/sysconfig/network-scripts/`. They are now stored as ini text files within `a`. In `nmcli` interfaces are called devices, connections refer to network connections on interfaces.

```bash
# View help
nmcli --help

# Show generic network information
nmcli

# Show interfaces
nmcli device show

# Show interface connections
nmcli connection show

# Show verbose interface connection details
nmcli connection show $CONNECTION_NAME

# Modify interface configuration files
nmcli connection modify $CONNECTION_NAME $KEY.$VALUE

# Reload interface configuration files
nmcli connection reload

# Enable network connection
nmcli connection up $CONNECTION_NAME

# Disable network connection. Don't turn off connection because the daemon will restart it.
nmcli device disconnect $DEVICE_NAME
```

Some common key value pairs for `nmcli` connections are:
* `ipv4.addresses` IPv4 address and CIDR netmask. Empty string for DHCP.
* `ipv4.gateway` IPv4 default gateway for routing. Empty string for DHCP.
* `ipv4.dns` IPv4 DNS name server. Empty string for DHCP.
* `ipv4.method` `auto` for DHCP or `manual` for status IPv4 address.

`ping` and `traceroute` requests can be blocked by a firewall but network connectivity still exists.

## System Startup Processes

The boot process for a standard x86 64 bit system is:
* Power on self test (POST) of hardware.
* System firmware (e.g. BIOS or UEFI) is validated an runs a bootloader from a system disk.
  * BIOS loads the bootloader from a disk partition, typically `/boot`
  * UEFI loads the bootloader from a file system, typically `/boot/efi`
* The bootloader (e.g. GRUB2) loads an operating system kernel from a system disk.
* The kernel:
  * Creates a small in memory filesystem with device drivers that it needs. It is called `initramfs`, i.e. initial RAM file system.
  * Takes over from the bootloader and starts its system boot process.
  * Once the kernel boot process is finished, userpace is set up so regular users can use the system. The initial (i.e. init) process with process ID 1 is created and all other processes are spawned off of it.

Traditionally AT&T System 5 was used as the init process but this has been replaced with SystemD.

SystemD thinks of daemons as individual services. It can start these services automatically at boot time or they can be started manually later. SystemD has a concept called target, targets are a group of services. There are 2 common targets:
1. `graphical.target` starts up standard system serviecs and graphical user interfaces. This includes `multi-user.target`.
2. `multi-user.target` starts up system daemons or background process and CLI text login. It will disable the GUI login screen.

```bash
# View the current SystemD target
systemctl get-default

# Change the current SystemD target from GUI to CLI for the next reboot
systemctl set-default multi-user.target

# Change the current SystemD target from GUI to CLI for the current session
systemctl isolate multi-user.target

# View SystemD target dependencies, i.e. the services that target will start
# Omitting $TARGET_NAME shows the default.target
systemctl list-dependencies $TARGET_NAME
```

## Getting Help & Learning More

Use offline or online `man` pages to access references on how to use the commands. These typically don't include tutorials though. You will typically use section 1 for user commands, section 5 for configuration file formats, and section 8 for admin commands. e.g. `man $SECTION $CMD`. The system will prioritise commands over configuration.

```bash
# passwd has multiple sections
# Section 1 is the passwd command
man 1 passwd

# Section 5 is the /etc/passwd file
man 5 passwd

# Search by keyword
man -k $STRING
apropos $STRING
```

Use the GNU `info` pages which are modern `man` pages. e.g. `info ls` It has more indepth information than `man` pages.

Pressing F1 in Gnome will open a help window.

Red Hat webpage has help pages, some free and some requiring a login. You can access this in the CLI via `redhat-support-tool`.

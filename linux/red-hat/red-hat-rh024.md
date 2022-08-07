# RH024 - RHEL Technical Overview

Found at https://rhtapps.redhat.com/promo/course/rh024

## Open Source Software

Anyone can use the software, view the code, and contribute to the code or project. These projects can be volunteer and financially sponsored employees.

Fedora goes into CentOS Stream which goes into Red Hat Enterprise Linux (RHEL).

## Shell Introduction

It is the environment in which you will work, it is the interface between and the rest of the system. This is where users execute their commands. RHEL uses Bash by default.

## Kernel and User Spaces

kernel is the heart of the linux os, it is responsible for scheduling running programs, file management, and security. this is kernel space (e.g. drivers, networking, etc). it is also responsible for supporting user programs (e.g. shell, browser), that run in user space

user space programs interact with the kernel through special devices or system calls that they make. each running program is called a process and it has its own private virtual memory space, and runs as a particular user:group so it can access files on the file system. a process has a state and an id called a PID.

there are 3 types of processes
- user processes, generally assocaited with a user and are associated with a terminal. they can be run in the foreground (consuming the terminal input) or in the background (the terminal is available for input)
- daemons - processes that aren't associated with a terminal at all, they are started up by the system. in ps the tty is ?
- kernel threads - these are parts of the kernel that are running as if they were regular user processes or system daemons, and they are not associated with a terminal. in ps they are enclosed in square brackets.

tty = teletype
pts = pseudo terminal session
ppid = parent process id

`ps aux` and `ps -elfy` are the same.

## GUI

The default GUI in RHEL is Gnome 3. 
Activities tricks:
* Can right click and add program icons to the dock.
* Can drag open applications to the right hand side to put them into another workspace.

## File Management

Pretty much everything is a file in Linux. Coloured output with ls makes it easier to see the differences in types of files.
Block files are special files that represent real physical storage devices. Some files inside of /dev will be the storage files, you can see them with `ls -l` and look for the `b` in the first letter of the file attributes.
-r is a common command option that means recursively apply the command to all objects within the starting location, and the at the end apply it to the starting location.

## File System Hierarchy

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

EX COMMAND actually means EXTENDED COMMAND mode.
`Shift` + double `z` will save and exit `vim` when the file already has a name.

## Users & Groups

A user identifers who are you on the Linux system.
* A user can be a member of many group.
* When a user is created there is also a group created with the same name of the username. The user is automatically added to this group. This is called the primary group.
* All other groups that the user is a member of are called supplementary groups.

Everything in a system is identifiable through a numeric ID.
* A user ID is the numeric identifier of the user.
* Groups have group IDs as well.

When deleting a user, the user's data is not autoamtically deleted (i.e. their $HOME remains).

User account information is stored inside a file called `/etc/passwd` but their password is stored inside `/etc/shadow`

`whoami` tells you who you are currently logged in as.

## File Permissions



## Software Management



## Network Configuration



## System Startup Processes



## Container Introduction



## Cockpit Overview



## RHEL Introduction



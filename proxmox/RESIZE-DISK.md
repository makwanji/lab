# Resize diks

## Resize from proxmox


## resize from vm

```bash
apt update && apt install parted -y


parted /dev/sda print


root@docker-vm1:~# parted /dev/sda print
Warning: Not all of the space available to /dev/sda appears to be used, you can fix the GPT to use all of the space (an extra 20971520 blocks) or continue with the current setting?
Fix/Ignore? Fix
Model: QEMU QEMU HARDDISK (scsi)
Disk /dev/sda: 45.1GB
Sector size (logical/physical): 512B/512B
Partition Table: gpt
Disk Flags:

Number  Start   End     Size    File system  Name  Flags
 1      1049kB  2097kB  1049kB                     bios_grub
 2      2097kB  2150MB  2147MB  ext4
 3      2150MB  34.4GB  32.2GB


root@docker-vm1:~# parted /dev/sda
GNU Parted 3.6
Using /dev/sda
Welcome to GNU Parted! Type 'help' to view a list of commands.
(parted) resizepart 3 100%
(parted) quit
Information: You may need to update /etc/fstab.

root@docker-vm1:~# partprobe
root@docker-vm1:~# lsblk
NAME                      MAJ:MIN RM SIZE RO TYPE MOUNTPOINTS
sda                         8:0    0  42G  0 disk
├─sda1                      8:1    0   1M  0 part
├─sda2                      8:2    0   2G  0 part /boot
└─sda3                      8:3    0  40G  0 part
  └─ubuntu--vg-ubuntu--lv 252:0    0  30G  0 lvm  /
root@docker-vm1:~# fdisk -l
Disk /dev/sda: 42 GiB, 45097156608 bytes, 88080384 sectors
Disk model: QEMU HARDDISK
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: FF55575D-AFDE-42E1-9C8E-5BF6D15A5EE2

Device       Start      End  Sectors Size Type
/dev/sda1     2048     4095     2048   1M BIOS boot
/dev/sda2     4096  4198399  4194304   2G Linux filesystem
/dev/sda3  4198400 88080350 83881951  40G Linux filesystem


Disk /dev/mapper/ubuntu--vg-ubuntu--lv: 30 GiB, 32208060416 bytes, 62906368 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
root@docker-vm1:~#


root@docker-vm1:~# pvresize /dev/sda3
  Physical volume "/dev/sda3" changed
  1 physical volume(s) resized or updated / 0 physical volume(s) not resized
root@docker-vm1:~# pvs
  PV         VG        Fmt  Attr PSize   PFree
  /dev/sda3  ubuntu-vg lvm2 a--  <40.00g 10.00g
root@docker-vm1:~#
root@docker-vm1:~#
root@docker-vm1:~#




root@docker-vm1:~# lvdisplay
  --- Logical volume ---
  LV Path                /dev/ubuntu-vg/ubuntu-lv
  LV Name                ubuntu-lv
  VG Name                ubuntu-vg
  LV UUID                6naTHJ-jZSp-bnRA-ab3l-ii6I-vAtm-rQaeUQ
  LV Write Access        read/write
  LV Creation host, time ubuntu-server, 2025-03-27 14:32:35 +0000
  LV Status              available
  # open                 1
  LV Size                <30.00 GiB
  Current LE             7679
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           252:0

root@docker-vm1:~#
root@docker-vm1:~# lvextend -l +100%FREE /dev/mapper/ubuntu--vg-ubuntu--lv
  Size of logical volume ubuntu-vg/ubuntu-lv changed from <30.00 GiB (7679 extents) to <40.00 GiB (10239 extents).
  Logical volume ubuntu-vg/ubuntu-lv successfully resized.
root@docker-vm1:~#
root@docker-vm1:~#
root@docker-vm1:~# lvdisplay
  --- Logical volume ---
  LV Path                /dev/ubuntu-vg/ubuntu-lv
  LV Name                ubuntu-lv
  VG Name                ubuntu-vg
  LV UUID                6naTHJ-jZSp-bnRA-ab3l-ii6I-vAtm-rQaeUQ
  LV Write Access        read/write
  LV Creation host, time ubuntu-server, 2025-03-27 14:32:35 +0000
  LV Status              available
  # open                 1
  LV Size                <40.00 GiB
  Current LE             10239
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           252:0

root@docker-vm1:~# df -h .
Filesystem                         Size  Used Avail Use% Mounted on
/dev/mapper/ubuntu--vg-ubuntu--lv   15G   14G  713M  95% /
root@docker-vm1:~# resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv
resize2fs 1.47.0 (5-Feb-2023)
Filesystem at /dev/mapper/ubuntu--vg-ubuntu--lv is mounted on /; on-line resizing required
old_desc_blocks = 2, new_desc_blocks = 5
The filesystem on /dev/mapper/ubuntu--vg-ubuntu--lv is now 10484736 (4k) blocks long.

root@docker-vm1:~# df -h .
Filesystem                         Size  Used Avail Use% Mounted on
/dev/mapper/ubuntu--vg-ubuntu--lv   40G   14G   25G  36% /
root@docker-vm1:~#


```
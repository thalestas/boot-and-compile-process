#!/bin/bash

# Check if none driver was passed
if [ $# -ne 1 ];
then
	echo "Usage: $0 [driver]"
	echo " driver is 'sdb'"
	exit
fi

# Get driver
DRIVE=$1
echo "Using $DRIVE driver"

# Check if driver exists
if [ ! -e /sys/block/$DRIVE/size ];
then
	echo "Driver not found"
	exit 1
fi

# Umount disk if it is mounted
MOUNTED=`cat /etc/mtab | grep $DRIVE`
if [[ -n $MOUNTED ]];
then
	echo "Umounting $DRIVE"
	umount /dev/$DRIVE[1-9]
fi

# Filling drive $DRIVE with zero
echo "Filling drive $DRIVE with zero"
sudo dd if=/dev/zero of=/dev/$DRIVE bs=1M count=10
if [ $? -ne 0 ];
then
	echo "Error: dd";
	exit 1;
fi

# Set partitions variables
BOOT=/dev/${DRIVE}1

# Create partitions
# 1 BOOT: FAT32, 256 Mb, boot flag
sudo sfdisk --force /dev/$DRIVE << EOF
,256M,0x0C,*,
EOF

# Check Error
if [ $? -ne 0 ];
then
	echo "Error: sfdisk";
	exit 1;
fi

# Create FAT32 file system
sudo mkfs.vfat -nboot $BOOT

# Check Error
if [ $? -ne 0 ];
then
	echo "Error: mkfs";
	exit 1;
fi

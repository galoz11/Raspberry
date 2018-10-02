#!/bin/bash
# shell script for shrinking micro sd card image on raspberry pi (Debian)
# TODO:copy image (leave original alone)
# TODO:1. ask to copy, if so copy and continue

# show all loops find enpty loop to use
lo=$(losetup -f)
echo $lo
echo $1
# make a loop with image file. -f is for looking next availble loop. -P inform Kernel
sudo losetup $lo -P --show $1
# Resize File System
check=$(sudo e2fsck -fy "$lo"p2 | grep "rootfs" | awk '{print $6}') 
echo $check 

# -M is to resize to minimum posible
shring=$(sudo resize2fs "$lo"p2 -M )
echo $shring 
#total blocks
totalb=$(sudo dumpe2fs -h "$lo"p2 | grep "Block count" | awk '{print $3}')
totalb=$(($totalb * 8))
echo total block is $totalb
#start blocks
startb=$( sudo parted "$lo"  unit s  print | grep -E "^ 2" | awk '{print $2}' | grep -o '[[:digit:]]*')
echo  start block is : $startb 
newend=$(($startb+$totalb-1))
# end = size +start -1
echo new end is size +start -1 = $newend

sudo parted $lo unit s resizepart 2 $newend yes
newimage=$(( ($newend+1)*512  ))
echo new image size is $newimage



#release sudo losetup $lo
sudo losetup -d $lo
# Remark how many blocks:


# Resize Partiton

# Truncating image file
sudo truncate --size=$newimage $1

# TODO:Checks




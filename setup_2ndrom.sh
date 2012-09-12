#!/sbin/sh

dd if=/dev/block/mmcblk0p8 of=/emmc/clockworkmod/dualboot/main/boot.img

mkfs.ext4 -t ext4 -b 4096 -m 0 -F -L userdata2 /dev/block/mmcblk1p1
tune2fs -o journal_data_ordered /dev/block/mmcblk1p1
tune2fs -E hash_alg=tea /dev/block/mmcblk1p1
tune2fs -e continue /dev/block/mmcblk1p1
e2fsck /dev/block/mmcblk1p1
e2fsck -yf /dev/block/mmcblk1p1

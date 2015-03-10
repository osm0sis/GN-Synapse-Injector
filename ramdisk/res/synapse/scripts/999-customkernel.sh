#!/sbin/sh
# 
# /system/addon.d/999-customkernel.sh
# During an upgrade, this script backs up the emmc boot (kernel) partition,
# ROM kernel is allowed to flash then the previous custom kernel is restored.
#
# osm0sis @ xda-developers

. /tmp/backuptool.functions

# determine the location of the emmc boot partition
if [ -e /dev/block/platform/*/by-name/boot ]; then
  block=/dev/block/platform/*/by-name/boot;
elif [ -e /dev/block/platform/*/*/by-name/boot ]; then
  block=/dev/block/platform/*/*/by-name/boot;
fi;

# force expansion of the path so we can use it
block=`echo -n $block`;


case "$1" in
  backup)
    # backup custom kernel
    if [ -e "$block" ]; then
      dd if=$block of=/tmp/boot.img;
    fi;
  ;;
  restore)
    # Stub
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
    # wait out ROM kernel flash then restore custom kernel
    while sleep 5; do
      [ -e /tmp/boot.img -a -e "$block" ] && dd if=/tmp/boot.img of=$block;
      exit;
    done&
  ;;
esac;


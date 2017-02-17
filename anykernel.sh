# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# EDIFY properties
kernel.string=GN Synapse Injector Add-on
do.devicecheck=1
do.initd=0
do.modules=0
do.cleanup=1
do.cleanuponabort=0
device.name1=maguro
device.name2=toro
device.name3=toroplus

# shell variables
block=/dev/block/platform/omap/omap_hsmmc.0/by-name/boot;
is_slot_device=0;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;


## AnyKernel permissions
# set permissions for included ramdisk files
chmod -R 755 $ramdisk
chmod 644 $ramdisk/res/synapse/*
chmod -R 755 $ramdisk/res/synapse/actions

## AnyKernel install
dump_boot;

# begin ramdisk changes

# init.tuna.rc
append_file init.tuna.rc "/sbin/uci" init.tuna;

# end ramdisk changes

write_boot;

## end install


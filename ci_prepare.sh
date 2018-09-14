#!/bin/sh -ex

export TMPDIR=$(mktemp -d)
pacstrap -C /usr/share/devtools/pacman-multilib.conf -c -d -G -M $TMPDIR $(cat packages)
cp --recursive --preserve=timestamps --backup --suffix=.pacnew rootfs/* $TMPDIR/
cp /usr/share/devtools/pacman-multilib.conf $TMPDIR/etc/pacman.conf

arch-chroot $TMPDIR locale-gen
arch-chroot $TMPDIR pacman-key --init
arch-chroot $TMPDIR pacman-key --populate archlinux

tar --numeric-owner --xattrs --acls --exclude-from=exclude -C $TMPDIR -c . -f archlinux.tar
rm -rf $TMPDIR

#!/bin/bash

LINUX_VER=5.16.9

wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-$LINUX_VER.tar.xz
unxz -v linux-$LINUX_VER.tar.xz
wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-$LINUX_VER.tar.sign
gpg --verify linux-$LINUX_VER.tar.sign
tar xvf linux-$LINUX_VER.tar

cd linux-$LINUX_VER
cp -v /boot/config-$(uname -r) .config
make menuconfig
make -j $(nproc)
sudo make modules_install
sudo make install
sudo reboot
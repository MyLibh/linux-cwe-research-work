#!/bin/bash

cd driver
./build.sh
sudo insmod ./bin/mydriver.ko
dmesg | tail -1

sudo chmod a+rwx /dev/mydriver
sudo chown ubuntu:ubuntu /dev/mydriver
cd ..
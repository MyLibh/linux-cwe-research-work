#!/bin/bash

sudo apt-get install -y snapd
sudo snap refresh multipass --channel stable

sudo snap install multipass
multipass launch --name test --cpus $(nproc) --mem 6G --disk 80G
multipass exec test /bin/bash ./install_vm_predeps.sh

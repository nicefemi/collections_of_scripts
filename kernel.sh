#!/bin/bash
#
#Description: Kernel Upgrade Script
#
#Author: Femi & Yannick
#================================================================

clear


sleep 1

echo -e "\n Downloading the package, please wait... \n"

wget http://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.0.9.tar.xz

sleep 2

echo -e "\n Now extracting the package... \n"

tar -xvf linux-5.0.9.tar.xz

cd linux-5.0.9

sleep 2

echo -e "\n Installing the dependencies...\n"

yum groupinstall "Development Tools" -y

sleep 1

yum install openssl* libncurses5-dev ncurses-devel gcc* -y
sleep 1

yum install elfutils-libelf-devel -y
yum install centos-release-scl -y
yum-config-manager --enable rhel-server-rhscl-7-rpms
yum install devtoolset-7 -y
nohup scl enable devtoolset-7 bash


echo -e "\n Now compiling the new kernel... \n"

make defconfig

make

make modules

make modules_install

make install

#!/usr/bin/env bash
sudo apt-get -y update       
#don't do apt-get upgrade because it does not work with AWS
sudo apt -y install libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev leafpad git xauth
sudo sysctl -w vm.nr_hugepages=128

mkdir -p scripts
mkdir -p mine

cd mine
wget -O libxmr-stak-asm.a https://raw.githubusercontent.com/pproum/test/master/build/mine/libxmr-stak-asm.a
wget -O libxmr-stak-backend.a https://raw.githubusercontent.com/pproum/test/master/build/mine/libxmr-stak-backend.a
wget -O libxmr-stak-c.a https://raw.githubusercontent.com/pproum/test/master/build/mine/libxmr-stak-c.a
wget -O xmr-stak https://raw.githubusercontent.com/pproum/test/master/build/mine/xmr-stak
wget -O config.txt https://raw.githubusercontent.com/pproum/test/master/build/mine/config.txt
wget -O pools.txt https://raw.githubusercontent.com/pproum/test/master/build/mine/pools.txt
cd ..

cd scripts
wget -O create_cpu_config.sh https://raw.githubusercontent.com/pproum/test/master/build/scripts/create_cpu_config.sh
wget -O run_xmr_stak.pl https://raw.githubusercontent.com/pproum/test/master/build/scripts/run_xmr_stak.pl
cd ..

scripts/create_cpu_config.sh > mine/cpu.txt 

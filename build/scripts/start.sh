#!/usr/bin/env bash
sudo apt-get -y update       
#don't do apt-get upgrade because it does not work with AWS
sudo apt -y install libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev leafpad git xauth
sudo sysctl -w vm.nr_hugepages=128

mkdir -p scripts
mkdir -p mine

cd mine
do wget https://raw.githubusercontent.com/pproum/test/master/build/scripts/create_cpu_config.sh
do wget https://raw.githubusercontent.com/pproum/test/master/build/scripts/run_xmr_stak.pl
cd ..

cd scripts
do wget https://raw.githubusercontent.com/pproum/test/master/build/scripts/create_cpu_config.sh
do wget https://raw.githubusercontent.com/pproum/test/master/build/scripts/run_xmr_stak.pl
cd ..

scripts/create_cpu_config.sh > mine/cpu.txt 

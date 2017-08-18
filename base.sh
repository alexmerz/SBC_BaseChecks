#!/bin/bash

apt-get -y update
apt-get -y upgrade
apt-get -y install git
apt-get -y install sysbench
apt-get -y install iperf

git clone https://github.com/kdlucas/byte-unixbench.git

echo "================================"
echo "Linux version"
echo "================================"
uname -a

echo "================================"
echo "Unixbench"
echo "================================"
cd byte-unixbench/UnixBench
./Run

echo "================================"
echo "Sysbench"
echo "================================"
sysbench --test=cpu --cpu-max-prime=20000 run
sysbench --test=cpu --num-threads=4 --cpu-max-prime=20000 run
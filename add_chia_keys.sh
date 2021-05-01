#!/bin/bash

# script to start chia and add keys to it.
cd chia-blockchain

. ./activate

chia init

# chia start node

chia keys add

chia keys show

# kill chia daemon
# chia_daemon_pid=`pgrep -i "chia_daemon"`

# sudo kill $chia_daemon_pid

deactivate

cd ..
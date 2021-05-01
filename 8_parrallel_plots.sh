#!/bin/bash

# Script to run 8 parrallel plots on a c5.4xlarge instance.
# instance_name_plot_x.log stores log for each plot.
# run from root dir.

# start chia node

cd chia-blockchain

. ./activate

chia init

chia start node

# run in plot logs folder
cd ../plot_logs

# machine name to append
MACHINE_NAME="aws_c5_4xlarge_1"

# start plots

for i in 1 2 3 4 5 6 7 8

do
    echo "Starting plot no. $i"

    chia plots create -k 32 -n 1 -t ../temp_plots -d ../final_plots >${MACHINE_NAME}_plot_$i.log &
done
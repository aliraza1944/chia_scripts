#!/bin/bash

# Script to run 2 parrallel (and 2 queued) plots on a c5.xlarge instance.
# instance_name_plot_x.log stores log for each plot.
# run from root dir.

# start chia node. Keys should be added before this.
cd chia-blockchain

. ./activate

chia init

chia start node

# run in plot logs folder
cd ../plot_logs

# machine name to append
MACHINE_NAME="c5_xl_1"

# start plots

for i in 1 2

do
    echo "Starting plot no. $i"

    chia plots create -k 32 -n 2 -t ../temp_plots -d ../final_plots >${MACHINE_NAME}_plot_$i.log &
done

cd ..
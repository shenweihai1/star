#!/bin/bash
mkdir -p tpcc-logs

trd=$1
let lock=trd/4
ips='10.1.0.7:8000;10.1.0.8:8000;10.1.0.9:8000'
# pkill -f bench_tpcc
#ips='127.0.0.1:8001;127.0.0.1:8002;127.0.0.1:8003'

./bench_tpcc --logtostderr=1 --id=2 --servers="$ips" --protocol=Calvin --partition_num=$trd --threads=$trd --batch_size=10000 --replica_group=3 --lock_manager=$lock --query=mixed --neworder_dist=10 --payment_dist=15 > ./tpcc-logs/t2-$trd.log 2>&1

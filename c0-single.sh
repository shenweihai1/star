#!/bin/bash
pkill -f bench_ycsb
mkdir -p xxxx14

trd=$1
let lock=trd/4

echo "./bench_ycsb --logtostderr=1 --id=0 --servers='10.1.0.7:8000' --protocol=Calvin --partition_num=$trd --threads=$trd --batch_size=10000 --replica_group=3 --lock_manager=$lock --read_write_ratio=50 --cross_ratio=0 > ./xxxx14/$trd.log 2>&1"

./bench_ycsb --logtostderr=1 --id=0 --servers="127.0.0.1:8000" --protocol=Calvin --partition_num=$trd --threads=$trd --batch_size=10000 --replica_group=1 --lock_manager=$lock --read_write_ratio=50 --cross_ratio=0 > ./xxxx14/$trd.log 2>&1

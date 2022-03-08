#!/bin/bash
pkill -f bench_ycsb

trd=$1
let lock=trd/4

echo './bench_ycsb --logtostderr=1 --id=1 --servers="10.1.0.7:8000;10.1.0.8:8000;10.1.0.9:8000" --protocol=Calvin --partition_num=$trd --threads=$trd --batch_size=10000 --replica_group=3 --lock_manager=$lock --read_write_ratio=50 --cross_ratio=0 > ./xxxx14/$trd.log 2>&1'

./bench_ycsb --logtostderr=1 --id=1 --servers="10.1.0.7:8000;10.1.0.8:8000;10.1.0.9:8000" --protocol=Calvin --partition_num=$trd --threads=$trd --batch_size=10000 --replica_group=3 --lock_manager=$lock --read_write_ratio=50 --cross_ratio=0 > ./xxxx14/$trd.log 2>&1

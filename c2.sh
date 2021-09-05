rm 2.log
./bench_ycsb --logtostderr=1 --id=2 --servers="127.0.0.1:8000;127.0.0.1:8001;127.0.0.1:8002" --protocol=Calvin --partition_num=2 --threads=2 --batch_size=10000 --replica_group=3 --lock_manager=1 --read_write_ratio=50 --cross_ratio=0 > ./2.log 2>&1

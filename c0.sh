#./compile.sh
pkill -f bench_ycsb

### single replica
# ./bench_ycsb --logtostderr=1 --id=0 --servers="127.0.0.1:8000" --protocol=Calvin --partition_num=4 --threads=4 --batch_size=10000 --replica_group=1 --lock_manager=2 --read_write_ratio=90 --cross_ratio=0

# three replicas
rm 0.log
./bench_ycsb --logtostderr=1 --id=0 --servers="127.0.0.1:8000;127.0.0.1:8001;127.0.0.1:8002" --protocol=Calvin --partition_num=2 --threads=2 --batch_size=10000 --replica_group=3 --lock_manager=1 --read_write_ratio=50 --cross_ratio=0 > ./0.log 2>&1

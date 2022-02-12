####################################################### ycsb benchmark ##############################################
# 1 replica
# ./bench_ycsb \
#     --logtostderr=1 \
#     --id=0 \
#     --servers="127.0.0.1:8000" \
#     --protocol=Calvin \
#     --partition_num=4 \
#     --threads=4 \
#     --batch_size=10000 \
#     --replica_group=1 \
#     --lock_manager=2 \
#     --read_write_ratio=90 \
#     --cross_ratio=0

# 3 replicas (modify --id and log filename)
# ./bench_ycsb \
#     --logtostderr=1 \
#     --id=2 \
#     --servers="127.0.0.1:8001;127.0.0.1:8002;127.0.0.1:8003" \
#     --protocol=Calvin \
#     --partition_num=4 \
#     --threads=4 \
#     --batch_size=1000 \
#     --replica_group=3 \
#     --lock_manager=2 \
#     --read_write_ratio=90 \
#     --cross_ratio=0 > c0.log 2>&1


####################################################### tpcc benchmark ##############################################
# 1 replica
./bench_tpcc \
    --logtostderr=1 \
    --id=0 \
    --servers="127.0.0.1:8000" \
    --protocol=Calvin \
    --partition_num=4 \
    --threads=4 \
    --batch_size=1000 \
    --replica_group=1 \
    --lock_manager=2 \
    # it's not fully tpcc transactions: only neworder and payment
    --query=mixed \ 
    --neworder_dist=50 \
    --payment_dist=50 \

# 3 replicas (modify --id and log filename)
# ./bench_tpcc \
#     --logtostderr=1 \
#     --id=0 \
#     --servers="127.0.0.1:8001;127.0.0.1:8002;127.0.0.1:8003" \
#     --protocol=Calvin \
#     --partition_num=4 \
#     --threads=4 \
#     --batch_size=1000 \
#     --replica_group=1 \
#     --lock_manager=2 \
#     # it's not fully tpcc transactions: only neworder and payment
#     --query=mixed \ 
#     # (45, 43, 4, 4, 4) => (new-order, payment, delivery, order-status, stock-level)
#     --neworder_dist=50 \
#     --payment_dist=50  > c0.log 2>&1
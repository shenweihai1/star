trd=$1
# kill locally
skill bench_ycsb; pkill bench_ycsb; skill bench_tpcc; pkill bench_tpcc;
echo "complete killing locally"
# kill the remote VMs
ssh 10.1.0.7 "skill bench_ycsb; pkill bench_ycsb; skill bench_tpcc; pkill bench_tpcc; "
ssh 10.1.0.8 "skill bench_ycsb; pkill bench_ycsb; skill bench_tpcc; pkill bench_tpcc; "
ssh 10.1.0.9 "skill bench_ycsb; pkill bench_ycsb; skill bench_tpcc; pkill bench_tpcc; "

#ssh 10.1.0.7 "cd ~/star && ./c0.sh $trd" &
#sleep 1
#ssh 10.1.0.8 "cd ~/star && ./c1.sh $trd" &
#sleep 1
#ssh 10.1.0.9 "cd ~/star && ./c2.sh $trd" &
#sleep 1
#
#tail -f xxxx14/*

#c0="10.1.0.7"
#c1="10.1.0.8"
#c2="10.1.0.9"
#
#experiment1() {
#  rm xxxx14/*
#  echo "run the experiment"
#  ./kill.sh
#  ./scp.sh
#  sleep 1 
#  
#  eval "./c0.sh $1" &
#  ssh $c1 "cd ~/star && ./c1.sh $1" &
#  ssh $c2 "cd ~/star && ./c2.sh $1" &
#
#  sleep 30 
#  #./sync_logs_to_leader.sh 
#}
#
#experiment2() {
#  rm xxxx14/*
#  echo "run the experiment"
#  ./kill.sh
#  ./scp.sh
#  sleep 1 
#  
#  eval "./t0.sh $1" &
#  ssh $c1 "cd ~/star && ./t1.sh $1" &
#  ssh $c2 "cd ~/star && ./t2.sh $1" &
#
#  sleep 30 
#  #./sync_logs_to_leader.sh 
#}

# please prepare a 32-core machine
experiment3() {
  ./install.sh 
  make clean
  ./compile.sh

  ./c0-single.sh 4
  ./c0-single.sh 8
  ./c0-single.sh 12 
  ./c0-single.sh 16 
  ./c0-single.sh 20 
  ./c0-single.sh 24
  ./c0-single.sh 28 
}

#experiment1 16
#experiment2 16
# get the result without replication 
experiment3

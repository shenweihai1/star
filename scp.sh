ssh 10.1.0.8 "cd ~/; sudo rm -rf ~/star; scp -r azureuser@10.1.0.7:~/star ."
ssh 10.1.0.9 "cd ~/; sudo rm -rf ~/star; scp -r azureuser@10.1.0.7:~/star ."
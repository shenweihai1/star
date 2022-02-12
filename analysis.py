
if __name__ == "__main__":
    for trd in ["4"]:
        for c in ["./tpcc-logs/t0-"+trd+".log", "./tpcc-logs/t1-"+trd+".log", "./tpcc-logs/t2-"+trd+".log"]:
            with open(c) as handler:
                lines=handler.readlines()
                n_total_commit=0
                n_time_taken_count=0
                times=[]
                for l in lines:
                    if "Coordinator.h:105" in l and "commit:" in l:
                        l=l.strip().split("commit:")[1]
                        n_total_commit+=int(l)
                    if "Time Taken2:" in l:
                        n_time_taken_count +=1
                        times.append(float(l.strip().split("Time Taken: ")[1].replace("millis", "")))
                times=sorted(times)
                print "[in %s]n_total_commit: %d, # of times: %d" % (c, n_total_commit, n_time_taken_count)
                if c=="./tpcc-logs/t0-"+trd+".log":
                    print "[in %s]latency 50%% %.2f, 90%% %.2f, 95%% %.2f" % (c, times[int(len(times)*0.5)-1], times[int(len(times)*0.9)-1], times[int(len(times)*0.95)-1])
                print ""
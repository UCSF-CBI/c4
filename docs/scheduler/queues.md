# Available Partitions

The cluster provides different partitions (queues) for running jobs. We have a common partition that anyone is free to use as well as lab owned "condo" partitions that are restricted to a particular lab's use. Any lab is free to purchase compute hardware and we will be glad to create a "condo" partition for it. 

* **common**:
  - Maximum runtime: 14 days (= 336 hours = 20,160 minutes)
  - Availability: all common nodes
  - Quota: 384 active jobs per user, 2,020 queued jobs per user.



_Comment_: Here "runtime" means "walltime", i.e. the runtime of a job is how long it runs according to the clock on the wall, not the amount of CPU time.


## Usage

If you do not specify a partition then your job will run on the common partition which is the default partition for our cluster. Jobs for condo partitions should specify the partition with the `--partition` option. It is nice but not required for users that have access to condo partitions to try and use those first in order to free up the common partition for others. We understand that sometimes workload will dictate using both.

In order to see the partitions use the `sinfo` command;

```sh
$ sinfo
PARTITION AVAIL  TIMELIMIT  NODES  STATE NODELIST 
common*      up 14-00:00:0      1    mix c4-n1 
common*      up 14-00:00:0      5   idle c4-n[2-5,10] 
wittelab     up 14-00:00:0      4   idle c4-n[6-9] 
```

In the above example, the asterisk indicates that common is the default partition. mix means that the node is running jobs, idle means the nodes are not running jobs. Other possible states are down, drain, and drng. The drain and drng state indicate that the node has been taken offline by the sysadmin. Draining means the nodes is still running jobs but won't accept new work.



[specify the resources]: {{ '/scheduler/submit-jobs.html' | relative_url }}

<!--
NOTES:

To list available queues, do:

    qstat -f | grep -F "@" | sed -E 's/@.*//g' | sort -u
-->

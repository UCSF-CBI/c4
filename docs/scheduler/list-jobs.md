# Listing Jobs

## List your own jobs

You can list all your submitted jobs, queued and running, using:

```sh
[alice@{{ site.login.name }} ~]$ squeue --me
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON) 
                 6    common SHEH_201    alice  R 1-01:40:59      1 c4-n10 
                27    common snakejob    alice  R 1-01:40:25      1 c4-n10 
```

To get additional information

```sh
[alice@{{ site.login.name }} ~]$ squeue --me --format="%6i %1t %11P %.16j %.5D %.7c %11L %19S %20R"
JOBID  S PARTITION               NAME NODES MIN_CPU TIME_LEFT   START_TIME          NODELIST(REASON)    
    6  R common      SHEH_201-testing     1       4 19:01       2020-12-15T15:51:07 c4-n10
   27  R common       snakejob_dnaseq     1      32 19:35       2020-12-15T15:51:41 c4-n10
```

See `man squeue` for description of these format flags.

To get detailed information on a specific job, yours or someone else's, use:

```sh
[alice@{{ site.login.name }} ~]$ squeue -j 27
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON) 
                27    common snakejob    alice  R 1-01:40:25      1 c4-n10 
```


## List jobs of other users

To see jobs of another user, use:

```sh
squeue -u <user>
```

To see jobs of all users, use:

```sh
squeue
```

For example,

```sh
[alice@{{ site.login.name }} ~]$ squeue
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON) 
                 6    common SHEH_201    alice  R 1-01:40:59      1 c4-n10 
                27    common snakejob    alice  R 1-01:40:25      1 c4-n10 
              1032    common gex_coun    bob    R    1:27:48      1 c4-n1 
```



## Details on a specific job

```sh
[alice@{{ site.login.name }} ~]$ scontrol show jobid -dd 354191
JobId=354191 JobName=hi-there.sh
   UserId=alice(30000) GroupId=boblab(509) MCS_label=N/A
   Priority=66861 Nice=0 Account=cbi QOS=normal
   JobState=RUNNING Reason=None Dependency=(null)
   Requeue=0 Restarts=0 BatchFlag=1 Reboot=0 ExitCode=0:0
   DerivedExitCode=0:0
   RunTime=00:00:08 TimeLimit=00:02:00 TimeMin=N/A
   SubmitTime=2025-02-07T07:59:28 EligibleTime=2025-02-07T07:59:28
   AccrueTime=2025-02-07T07:59:28
   StartTime=2025-02-07T07:59:28 EndTime=2025-02-07T08:01:28 Deadline=N/A
   PreemptEligibleTime=2025-02-07T07:59:28 PreemptTime=None
   SuspendTime=None SecsPreSuspend=0 LastSchedEval=2025-02-07T07:59:28 Scheduler=Main
   Partition=common AllocNode:Sid=10.10.10.5:1199265
   ReqNodeList=(null) ExcNodeList=(null)
   NodeList=c4-n37
   BatchHost=c4-n37
   NumNodes=1 NumCPUs=2 NumTasks=1 CPUs/Task=1 ReqB:S:C:T=0:0:*:*
   TRES=cpu=2,mem=100M,node=1,billing=2
   Socks/Node=* NtasksPerN:B:S:C=0:0:*:* CoreSpec=*
   JOB_GRES=(null)
     Nodes=c4-n37 CPU_IDs=50-51 Mem=100 GRES=
   MinCPUsNode=1 MinMemoryNode=100M MinTmpDiskNode=0
   Features=(null) DelayBoot=00:00:00
   OverSubscribe=OK Contiguous=0 Licenses=(null) Network=(null)
   Command={{ site.login.name }}/hi-there.sh
   WorkDir={{ site.login.name }}
   StdErr={{ site.login.name }}/hi-there.sh-354191.out
   StdIn=/dev/null
   StdOut={{ site.login.name }}/hi-there.sh-354191.out
   Power=
```


## When will queued jobs start?

When your jobs will be launched depends on your jobs' _current priority_ on the queue.  _If_ one of your jobs is on the top of the priority queue _and_ the resources (CPU, memory, ...) you have requested are available, _then_ that job will be launched next.  If sufficient resources are not available, then a lower-priority jobs with lower resource may be launched in the meantime.

<!--The priority scores of all jobs can be seen in column `PRIORITY` in the `squeue` output (\*). The "priority scores" are constantly recalculated as a function of all users' jobs currently queued and running on the cluster.  They are a function of:

 * your group's _current priority_
 * your personal _current priority_ relative to other users in your group

There is no memory, that is, what you, your group, or others have run in the past does not matter.

(\*) The priorities of already running jobs (those with an `r` in column `state`) are irrelevant.
-->


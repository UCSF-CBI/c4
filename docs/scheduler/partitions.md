# Available Partitions

The cluster provides different partitions ("queues") for running jobs. We have a 'common' partition that anyone is free to use as well as lab owned "condo" partitions that are restricted to a particular lab's use. Any lab is free to purchase compute hardware and we will be glad to create a "condo" partition for it. 

All partitions are configured identically:

  - Maximum runtime: 14 days (= 336 hours = 20,160 minutes)
  - Availability: all common nodes
  - Quota: 384 active jobs per user, 2,020 queued jobs per user.

_Comment_: Here "runtime" means "walltime", i.e. the runtime of a job is how long it runs according to the clock on the wall, not the amount of CPU time.


## Usage

There is no need to specify the partition when submitting a job.  The scheduler is configured to prioritize any lab-specific partitions you have access to.  If you do not have access to a lab-specific partition, or they are already full, then the 'common' partition is considered.  You can see which partitions you have access to by looking at environment variable `SBATCH_PARTITION`  For example, user `alice` sees:

```sh
[alice@{{ site.login.name }} ~]$ echo "$SBATCH_PARTITION"
boblab,common
```

which means their next job will be sent to the 'boblab' partitions and if that is full, then the job is sent to the 'common' partition.  If that is also full, the job will be pending and either 'boblab' or 'common' will be used as they become available.

If you would like to send a job to a specific partition, the Slurm option `--partition` can be used, e.g. `sbatch --partition=boblab script.sh` or `sbatch --partition=boblab,common script.sh`.

<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
<span>⚠️</span> Although rarely needed, if you need to submit your jobs to a specific compute node, which you do via Slurm option <code>--nodelist</code>, then you need to also specify <code>--partition</code> for that specific node, otherwise <code>sbatch</code> gives an error on 'Batch job submission failed: Unspecified error'.
</div>



## Details on partitions

In order to see all available partitions on the cluster, use:

<!-- code-block label="sinfo" -->
```sh
PARTITION   AVAIL  TIMELIMIT  NODES  STATE NODELIST 
common*        up 14-00:00:0      2    mix c4-n[1-2] 
common*        up 14-00:00:0      5   idle c4-n[3-5,10-11] 
wittelab       up 14-00:00:0      6   idle c4-n[6-9,14-15] 
cbc            up 14-00:00:0      2   idle c4-n[12-13] 
blellochlab    up 14-00:00:0      1   idle c4-n16
```

In the above example, the asterisk indicates that 'common' is the default partition. The 'mix' state means that some of the nodes in the partition that run jobs, 'idle' means those nodes are not running jobs. The 'drain' and 'drng' states indicate that the node has been taken offline by the sysadmin. Draining means the nodes is still running jobs but won't accept new work.



[specify the resources]: {{ '/scheduler/submit-jobs.html' | relative_url }}
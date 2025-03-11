# Freecycle Partition

The freecycle partition is made up of Lab nodes whose owners have generously allowed us to make use of idle cycles. Any job submitted by the node's owner will override and cancel any running freecycle job if the node owners job requires those resources. This partition is intended for quick jobs, the shorter the runtime the better, and the maximum runtime is 24 hours. The primary use case is if the common partition is very busy and it looks like your short job(s) will queue for a long time on common.

## To submit a job to freecycle

Use the `--partition=freecycle` flag with sbatch.

```sh
[alice@{{ site.devel.name }} ~]$ sbatch --partition=freecycle my-slurm-script.sh
```


If you run a freecycle job, and it gets terminated due the node owner launching jobs, you will see something like the below in your job scripts:

```plain
srun: Force Terminated job 557341
slurmstepd: error: *** STEP 557341.0 ON c4-n12 CANCELLED AT 2025-03-11T13:26:25 DUE TO PREEMPTION ***
srun: Job step aborted: Waiting up to 32 seconds for job step to finish.
srun: error: Timed out waiting for job step to complete
```


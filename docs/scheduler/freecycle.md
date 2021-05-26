# Freecycle Partition

The freecycle partition is made up of Lab nodes whose owners have generously allowed us to make use of idle cycles. Any job submitted by the node's owner will override and cancel any running freecycle job if the node owners job requires those resources. This partition is intended for quick jobs, the shorter the runtime the better, and the maximum runtime is 24 hours. The primary use case is if the common partition is very busy and it looks like your short job(s) will queue for a long time on common.

## To submit a job to freecycle

Use the `--partition=freecycle` flag with sbatch.

```sh
[alice@{{ site.devel.name }} ~]$ sbatch --partition=freecycle my-slurm-script.sh
```

## Make sure to set the --mail-user flag

Since there is a chance your job could be cancelled, it is important to set the --mail-user flag so that you will know if a job has been cancelled. This can either be set within the script:

```sh
#SBATCH --mail-user=alice.bobson@ucsf.edu 
```

or it can be set at job submission time:

```sh
[alice@{{ site.devel.name }} ~]$ sbatch --partition=freecycle --mail-user=alice.bobson@ucsf.edu my-slurm-script.sh
```


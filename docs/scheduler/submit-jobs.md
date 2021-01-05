<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
<strong><span>⚠️</span> 2020-01-04: This page is work in progress.  Overall it is correct, but details will be soon be updated.  Please make sure to revisit later.</strong>
</div>


# Submit Jobs

There are two basic modes for doing work on Slurm, batch and interactive.  Batch jobs are submitted to the scheduler and run at a later time.  [Interactive jobs] happen in real time.  The relevant Slurm commands are `sbatch` for batch jobs, `srun` for interactive jobs, and `salloc` for allocating resources and then running `srun` tasks within the allocation. 


## Submit a script to run in batch mode

One can just run a native bash script with `sbatch` and supply the relevant parameters at the CLI with various command-line options, e.g. `--time=00:10:00`.
It is probably easier to supply those options within the script itself using Slurm declarations as specially formatted shell comments prefixed as `#SBATCH`. 

Here is a `hi-there.sh` script that illustrates this:

```sh
#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --mem=100M
#SBATCH --time=00:10:00
#SBATCH --output=%x-%j.out

echo "This script was allotted ${SLURM_NTASKS:-1} cores"
```

Going through the Slurm declarations:

* `--ntasks=1` - run on 1 core
* `--mem=100M` - allow job to use 100 MiB of memory (`M`=MiB, `G`=GiB, `T`=TiB)
* `--time=00:10:00` - allow job to run for 10 minutes
* `--output=%x-%j.out` - specify output and error files (defaults to the current working directory). The `%x` and `%j` flags are replaced by the job name and job id, respectively

Since we have declared all of our Slurm options using the `#SBATCH` syntax in the job script, we do not have to specify them as command-line options.  Instead, we can now submit this job very simply:

```sh
$ sbatch hi-there.sh
Submitted batch job 1507
```

## Specifying (maximum) memory usage

In the above job we used the `--mem=100M` option. This set maximum memory usage to 100 MiB (`M` is the default unit). We can specify in GiB using unit `G`, e.g. `--mem=2G`. 
Please note that if your job *exceeds* the requested memory limit, it will be terminated with an Out-of-Memory (OOM) error. So, why should we do it? Because jobs that specify smaller memory limits will have more opportunities to actually run. If we don't specify the limits, Slurm will assume the job needs up to the node limit of memory and it will sit in the queue until a node with max memory becomes available. By right sizing your jobs they will run faster.

_TIPS_: To find out how much memory a job used, `sacct -j jobid --format="JobID,Elapsed,MaxRSS,State"` you can use this to right size the job next time you want to run a similar one.  Example:

```sh
$ sacct -j 1484 --format="JobID,Elapsed,MaxRSS,State"
       JobID    Elapsed     MaxRSS      State 
------------ ---------- ---------- ---------- 
1484           00:00:00             COMPLETED 
1484.batch     00:00:00      1196K  COMPLETED 
```

A job that was killed for running out of memory would look like this:
```sh
$ sacct -j 1012 --format="JobID,Elapsed,MaxRSS,State"
       JobID    Elapsed     MaxRSS      State 
------------ ---------- ---------- ---------- 
1012           00:00:01            OUT_OF_ME+ 
1012.batch     00:00:01      1380K OUT_OF_ME+ 
```


## Specifying (maximum) run time

<div class="alert alert-info" role="alert">
Specifying the run time will shorten the queuing time - significantly so for short running jobs.
</div>

By specifying the how long each job will take, the better the scheduler can manage resources and allocate jobs to different nodes.  This will also decrease the average waiting time the job will sit in the queue before being launched on a compute node.  You can specify the maximum run time (= wall time, not CPU time) for a job using option `--time=HH:MM:SS` where `HH:MM:SS` specifies the number of hours (`HH`), the number of minutes (`MM`), and the number of seconds (`SS`) - all parts must be specified.  In our above example, we used `--time=00:10:00`.  If your submit a multi-day job, you can also specify the number of days using the format `--time=days-HH:MM:SS`, e.g. `--time=2-06:00:00` for 2 days and 6 hours.


<!--
## Using local scratch storage

Each compute node has {{ site.data.specs.local_scratch_size_min }}-{{ site.data.specs.local_scratch_size_max }} TiB of [local scratch storage]({{ '/about/specs.html#scratch-storage' | relative_url }}) which is fast and ideal for temporary, intermediate data files that are only needed for the length of a job.  This scratch storage is unique to each machine and shared among all users and jobs running on the same machine. 

<div class="alert alert-warning" role="alert">
Please please <a href="using-local-scratch.html">cleanup local scratch afterward</a>.  This maximizes the chance for compute nodes having enough available space, reduces the queuing times, and minimizes the risk for running out of local scratch.
</div>
-->


## Parallel processing (on a single machine)

The scheduler will allocate a single core for your job.  To allow the job to use multiple slots, request the number of slots needed when you submit the job.  For instance, to request four slots (`SLURM_NTASKS=4`), use:
```sh
sbatch --ntasks=4 script.sh
```
The scheduler will make sure your job is launched on a node with at least four slots available.

Note, when writing your script, use [Slurm environment variable] `SLURM_NTASKS`, which is set to the number of cores that your job was allocated.  This way you don't have to update your script if you request a different number of cores.  For instance, if your script runs the BWA alignment, have it specify the number of parallel threads as:

```sh
bwa aln -t "${SLURM_NTASKS:-1}" ...
```

By using `${SLURM_NTASKS:-1}`, instead of just `${SLURM_NTASKS}`, this script will fall back to use a single thread if `SLURM_NTASKS` is not set, e.g. when option `--ntasks` is not specified or when running the script on your local computer.


<div class="alert alert-danger" role="alert">
<strong>Do not use more cores than requested!</strong> - a common reason for compute nodes being clogged up and jobs running slowly.  A typically mistake is to hard-code the number of cores in the script and then request a different number when submitting the job - using <code>SLURM_NTASKS</code> avoids this problem.  Another problem is software that by default use all of the machine's cores - make sure to control for this, e.g. use dedicated command-line option or environment variable for that software.
</div>


## Passing arguments to script

You can pass arguments to a job script similarly to how one passes argument to a script executed on the command line.  For example, the follow Bash script `rscript.sh`:

```sh
#!/usr/bin/env bash
#SBATCH --export=NONE
#SBATCH --mem=10M 

module load CBI r
Rscript "$@"
```

can be called as:

```sh
[alice@{{ site.devel.name }} ~]$ ./script.sh --vanilla -e "x <- 1:10; sum(x)"
[1] 55
```

Then you can submit this job to scheduler the same way using:

```sh
[alice@{{ site.devel.name }} ~]$ sbatch script.sh --vanilla -e "x <- 1:10; sum(x)"
Submitted batch job 3302

[alice@{{ site.devel.name }} ~]$ cat slurm-3302.out
[1] 55
```


[Slurm environment variable]: {{ '/scheduler/envvars.html' | relative_url }}
[Interactive jobs]: {{ '/scheduler/interactive-jobs.html' | relative_url }}
[Job Summary]: {{ '/scheduler/job-summary.html' | relative_url }}
[development nodes]: {{ '/get-started/development-prototyping.html' | relative_url }}

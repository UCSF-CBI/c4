# Submit Jobs

There are two basic modes for doing work on Slurm, batch and interactive.  Batch jobs are submitted to the scheduler and run when there is an available slot.  [Interactive jobs] works similarly with the difference that we get an interactive shell when the job launches.


## Submit a script to run in batch mode

One can just run a native bash script with `sbatch` and supply the relevant parameters at the CLI with various command-line options, e.g. `--time=01:30:00`.
It is probably easier to supply those options within the script itself using Slurm declarations as specially formatted shell comments prefixed as `#SBATCH`. 

Here is a `hi-there.sh` script that illustrates this:

```sh
#! /bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=100M
#SBATCH --time=00:02:00
#SBATCH --output=%x-%j.out

echo "This script was allotted ${SLURM_NTASKS:-1} cores"
```

Going through the Slurm declarations:

* `--nodes=1` - run on 1 node (optional when `--ntasks=1`)
* `--ntasks=1` - run on 1 core
* `--mem=100M` - allow job to use 100 MiB of memory (`M`=MiB, `G`=GiB, `T`=TiB)
* `--time=00:02:00` - allow job to run for 2 minutes
* `--output=%x-%j.out` - specify output and error files (defaults to the current working directory). The `%x` and `%j` flags are replaced by the job name and job id, respectively

Since we have declared all of our Slurm options using the `#SBATCH` syntax in the job script, we do not have to specify them as command-line options.  Instead, we can now submit this job very simply:

```sh
$ sbatch hi-there.sh
Submitted batch job 1507
```

## Specifying (maximum) memory usage

<div class="alert alert-info" role="alert" markdown="1">
Specifying appropriate memory requirements will shorten the queuing time - significantly so for smaller jobs.
</div>

In the above job we used the `--mem=100M` option. This set maximum memory usage to 100 MiB (`M` is the default unit). We can specify in GiB using unit `G`, e.g. `--mem=16G`.  By rightsizing your jobs, the job scheduler will be able to scheduler your jobs better and launch them sooner.  If not specified, the default memory is 2 GiB (`--mem=2G`).

<div class="alert alert-warning" role="alert" markdown="1">
<span>⚠️</span> Note that a job that **exceeds** the requested memory limit will be terminated by the scheduler resulting in an out-of-memory (OOM) error.
</div>

_TIPS_: To find out how much memory a job used, `sacct --format="JobID,Elapsed,MaxRSS,State" -j <job_id>` you can use this to rightsize the job next time you want to run a similar one.  Example:

```sh
$ sacct --format="JobID,Elapsed,MaxRSS,State" -j 1484
       JobID    Elapsed     MaxRSS      State 
------------ ---------- ---------- ---------- 
1484           00:00:00             COMPLETED 
1484.batch     00:00:00      1196K  COMPLETED 
```

A job that was killed for running out of memory would look like this:

```sh
$ sacct --format="JobID,Elapsed,MaxRSS,State" -j 1012
       JobID    Elapsed     MaxRSS      State 
------------ ---------- ---------- ---------- 
1012           00:00:01            OUT_OF_ME+ 
1012.batch     00:00:01      1380K OUT_OF_ME+ 
```


## Specifying (maximum) run time

<div class="alert alert-info" role="alert" markdown="1">
Specifying the run time will shorten the queuing time - significantly so for short running jobs.
</div>

By specifying how long each job will take, the better the scheduler can manage resources and allocate jobs to different nodes.  This will also decrease the average waiting time the job will sit in the queue before being launched on a compute node.  You can specify the maximum run time (= wall time, not CPU time) for a job using option `--time=HH:MM:SS` where `HH:MM:SS` specifies the number of hours (`HH`), the number of minutes (`MM`), and the number of seconds (`SS`) - all parts must be specified.  In our above example, we used `--time=00:02:00`.  If your submit a multi-day job, you can also specify the number of days using the format `--time=days-HH:MM:SS`, e.g. `--time=2-06:00:00` for 2 days and 6 hours.
If not specified, the default run time is 10 minutes (`--time=00:10:00`).

<div class="alert alert-warning" role="alert" markdown="1">
<span>⚠️</span> Note that a job that runs longer than the requested run time will be terminated by the scheduler.  Because of this, you may add a little bit of extra time to give your job some leeway.
</div>


<!--
## Using local scratch storage

Each compute node has {{ site.data.specs.local_scratch_size_min }}-{{ site.data.specs.local_scratch_size_max }} TiB of [local scratch storage]({{ '/about/specs.html#scratch-storage' | relative_url }}) which is fast and ideal for temporary, intermediate data files that are only needed for the length of a job.  This scratch storage is unique to each machine and shared among all users and jobs running on the same machine. 

<div class="alert alert-warning" role="alert" markdown="1">
Please please <a href="using-local-scratch.html">cleanup local scratch afterward</a>.  This maximizes the chance for compute nodes having enough available space, reduces the queuing times, and minimizes the risk for running out of local scratch.
</div>
-->


## Parallel processing (on a single machine)

<div class="alert alert-warning" role="alert" markdown="1">
<span>⚠️</span> Most software can only parallelize on a single node; make sure to specify `--nodes=1`, otherwise there is a risk the scheduler assigns you slots on multiple compute nodes.
</div>

The scheduler will allocate a single core for your job.  To allow the job to use multiple slots, request the number of slots needed when you submit the job.  For instance, to request four slots (`SLURM_NTASKS=4`) on a single machine, use:

```sh
sbatch --nodes=1 --ntasks=4 script.sh
```

The scheduler will make sure your job is launched on a single node with at least four slots available.

Note, when writing your script, use [Slurm environment variable] `SLURM_NTASKS`, which is set to the number of cores that your job was allocated.  This way you don't have to update your script if you request a different number of cores.  For instance, if your script runs the BWA alignment, have it specify the number of parallel threads as:

```sh
bwa aln -t "${SLURM_NTASKS:-1}" ...
```

By using `${SLURM_NTASKS:-1}`, instead of just `${SLURM_NTASKS}`, this script will fall back to use a single thread if `SLURM_NTASKS` is not set, e.g. when option `--ntasks` is not specified or when running the script on your local computer.


<div class="alert alert-warning" role="alert" markdown="1">
<span>⚠️</span> **Do not use more cores than requested!**  It is a common reason for jobs running slowly.  A typically mistake is to hard-code the number of cores in the script and then request a different number when submitting the job - using `SLURM_NTASKS` avoids this problem.  Another problem is software that by default use all of the machine's cores - make sure to control for this, e.g. use dedicated command-line option or environment variable for that software.
</div>


## Passing arguments to script

You can pass arguments to a job script similarly to how one passes argument to a script executed on the command line.  For example, the follow Bash script `script.sh`:

```sh
#! /bin/bash
#SBATCH --export=NONE
#SBATCH --mem=50M 

module load CBI r
Rscript "$@"
```

can, after making sure its file permissions are set to "executable":

```sh
[alice@{{ site.devel.name }} ~]$ chmod ugo+x script.sh
```

be called as:

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

_Comment_: Slurm does _not_ require "executable" to be set but it's a good habit to set it on job scripts that we also want to be able to run as a standalone script.


[Slurm environment variable]: {{ '/scheduler/envvars.html' | relative_url }}
[Interactive jobs]: {{ '/scheduler/interactive-jobs.html' | relative_url }}
[Job Summary]: {{ '/scheduler/job-summary.html' | relative_url }}
[development nodes]: {{ '/get-started/development-prototyping.html' | relative_url }}

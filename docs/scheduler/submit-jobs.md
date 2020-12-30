# Submit Jobs

There are two basic modes for doing work on Slurm, batch and interactive. Batch jobs are submitted to the scheduler and run at a later time. Interactive jobs happen in real time. One can also allocate resources ahead of time for an interactive job. The relevant Slurm commands are `sbatch` for batch jobs, `srun` for interactive jobs, and `salloc` for allocating resources and then running `srun` tasks within the allocation. 


## Submit a script to run in batch mode

One can just run a native bash script with `sbatch` and supply the relevant parameters at the CLI with various command-line options, e.g. `--time=00:10:00`.
It is probably easier to supply those options within the script itself using Slurm declarations as specially formatted shell comments prefixed as `#SBATCH`. 

Let's use a "hello world" script to illustrate.
*hi_there.bash*:

```sh
#!/bin/bash
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -t 00:10:00
#SBATCH -p common
#SBATCH --mem=100
#SBATCH -o myoutput_%j.out #SBATCH -e myerrors_%j.err

perl -e 'print "Hi there. \n"'
echo "This was run on $SLURM_JOB_NODELIST"
```
Going through the `#SBATCH` options:

* `#SBATCH -n 1` - run on 1 core.
* `#SBATCH -N 1` - run on 1 compute node.
* `#SBATCH -t 00:10:00` - job can run a maximum of 10 minutes.
* `#SBATCH -p common` - run on the common partition.
* `#SBATCH -o myoutput_%j.out #SBATCH -e myerrors_%j.err` - specify output and error files (defaults to the current working directory). The flag `%j` inserts job id into the file name.

Since we have specified all of our options with the `#SBATCH` syntax, we can now submit this job very simply:
```sh
$ sbatch hi_there.bash 
Submitted batch job 1507
```

## Specifying (maximum) memory usage

In the above job we used the `#SBATCH --mem=100` option. This set maximum memory usage to 100 MiB (`mb` is the default unit). We can specify in GiB using unit `gb`, e.g. `--mem=2gb`. 
Please note that if your job *exceeds* the requested memory limit, it will be terminated with an Out-of-Memory (OOM) error. So, why should we do it? Because jobs that specify smaller memory limits will have more opportunities to actually run. If we don't specify the limits, Slurm will assume the job needs up to the node limit of memory and it will sit in the queue until a node with max memory becomes available. By right sizing your jobs they will run faster.

_TIPS_: To find out how much memory a job used, `sacct -j jobid --format="JobID,Elapsed,MaxRSS,State"` you can use this to right size the job next time you want to run a similar one.
        Example:
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

By specifying the how long each job will take, the better the scheduler can manage resources and allocate jobs to different nodes.  This will also decrease the average waiting time the job will sit in the queue before being launched on a compute node.  You can specify the maximum run time (= wall time, not CPU time) for a job using option `-t HH:MM:SS` where `HH:MM:SS` specifies the number of hours (`HH`), the number of minutes (`MM`), and the number of seconds (`SS`) - all parts must be specified.  In our above example, we used `#SBATCH -t 00:10:00`. 



## Using local scratch storage

Each compute node has {{ site.data.specs.local_scratch_size_min }}-{{ site.data.specs.local_scratch_size_max }} TiB of [local scratch storage]({{ '/about/specs.html#scratch-storage' | relative_url }}) which is fast and ideal for temporary, intermediate data files that are only needed for the length of a job.  This scratch storage is unique to each machine and shared among all users and jobs running on the same machine. 

<div class="alert alert-warning" role="alert">
Please please <a href="using-local-scratch.html">cleanup local scratch afterward</a>.  This maximizes the chance for compute nodes having enough available space, reduces the queuing times, and minimizes the risk for running out of local scratch.
</div>


## Parallel processing (on a single machine)

The scheduler will allocate a single core for your job.  To allow the job to use multiple slots, request the number of slots needed when you submit the job.  For instance, to request four slots (`NSLOTS=4`) _each with 2 GiB of RAM_, for a _total_ of 8 GiB RAM, use:
```sh
qsub -pe smp 4 -l mem_free=2G script.sh
```
The scheduler will make sure your job is launched on a node with at least four slots available.

Note, when writing your script, use [SGE environment variable] `NSLOTS`, which is set to the number of cores that your job was allocated.  This way you don't have to update your script if you request a different number of cores.  For instance, if your script runs the BWA alignment, have it specify the number of parallel threads as:
```sh
bwa aln -t $NSLOTS ...
```

_Comment_: PE stands for 'Parallel environment'.  SMP stands for ['Symmetric multiprocessing'](https://en.wikipedia.org/wiki/Symmetric_multiprocessing) and indicates that the job will run on a single machine using one or more cores.


<div class="alert alert-danger" role="alert">
<strong>Do not use more cores than requested!</strong> - a common reason for compute nodes being clogged up and jobs running slowly.  A typically mistake is to hard-code the number of cores in the script and then request a different number when submitting the job - using <code>NSLOTS</code> avoids this problem.  Another problem is software that by default use all of the machine's cores - make sure to control for this, e.g. use dedicated command-line option or environment variable for that software.
</div>


## Passing arguments to script

You can pass arguments to a job script similarly to how one passes argument to a script executed on the command line, e.g.
```sh
qsub -cwd -l mem_free=1G script.sh --first=2 --second=true --third='"some value"' --debug
```
Arguments are then passed as if you called the script as `script.sh --first=2 --second=true --third="some value" --debug`.  Note how you have to have an extra layer of single quotes around `"some value"`, otherwise `script.sh` will see `--third=some value` as two independent arguments (`--third=some` and `value`).


## Interactive jobs

It is currently _not_ possible to request _interactive_ jobs (aka `qlogin`).  Instead, there are dedicated [development nodes] that can be used for short-term interactive development needs such building software and prototyping scripts before submitting them to the scheduler.



## MPI: Parallel processing via Hybrid MPI (multi-threaded multi-node MPI jobs)

{{ site.cluster.name }} provides a special MPI parallel environment (PE) called `mpi-8` that allocates exactly eight (8) slots per node across one or more compute nodes.  For instance, to request a Hybrid MPI job with in total forty slots (`NSLOTS=40`), submit it as:

```sh
qsub -pe mpi-8 40 hybrid_mpi.sh
```
and make sure that the script (here `hybrid_mpi.sh`) exports `OMP_NUM_THREADS=8` (the eight slots per node) and then launches the MPI application using `mpirun -np $NHOSTS /path/to/the_app` where `NHOSTS` is automatically set by SGE (here `NHOSTS=5`):

```sh
# !/usr/bin/env bash

module load mpi
export OMP_NUM_THREADS=8
mpirun -np $NHOSTS /path/to/the_app
```

<div class="alert alert-warning" role="alert">
Note that mpi-8 jobs must request a multiple of exactly eight (8) slots.  If <code>NSLOTS</code> is not a multiple of eight, then the job will be stuck in the queue forever and never run.
</div>

_Comment_: MPI stands for ['Message Passing Interface'](https://en.wikipedia.org/wiki/Message_Passing_Interface).



## Defaults

* Memory usage (per slot): If not specified, the default is `-l mem_free=1G`.

* Working directory: If not specified (e.g. `-cwd`), the default working directory is `$HOME`.



## See also

For further options and advanced usage, see [Advanced Usage]({{ '/advanced-usage.html' | relative_url }}) of the scheduler.

[Slurm environment variable]: {{ '/scheduler/envvars.html' | relative_url }}
[Job Summary]: {{ '/scheduler/job-summary.html' | relative_url }}
[development nodes]: {{ '/get-started/development-prototyping.html' | relative_url }}

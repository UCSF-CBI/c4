# 'Hello World' Job

The {{ site.cluster.name }} cluster farm consists of a number of [compute nodes] that are ready to serve users' compute tasks (aka jobs).  Since all compute nodes are configured the same way, for instance, they have the exact same set software installed, it does not matter on which compute node your analysis runs.

At any time, there will be many users using the cluster where some users run a single analysis whereas other run many multi-day jobs in parallel.  In order for users not to step on each others toes and for users to get a fair share of the compute resources, the cluster uses a so called _job scheduler_ to orchestrate the compute requests.  This works by users submitting their compute jobs to a _partition_.  Then the scheduler will locate one or more compute nodes with enough free resources to process the submitted job and launch the job on those compute nodes.  {{ site.cluster.name }} has a common partition (called 'common') that anyone may use. {{ site.cluster.name }} also has a number of "condo" compute nodes which are purchased and owned by individual labs and set aside exclusively for each lab's compute needs.


## Instructions

The most common way of running compute tasks on the {{ site.cluster.name }} cluster, consists of:

1. creating a script,

2. submitting the script to a partition,

3. waiting for the script to start and finish, and

4. looking at the results, e.g. output data files and text logs.

The {{ site.cluster.name }} cluster uses [Slurm] as its scheduler.  [Slurm] provides command `sbatch` to submit your job scripts and command `squeue --user=$USER` to check the status of your jobs.  Slurm also provides a way to run a job interactively called `srun`.


<div class="alert alert-info" role="alert" style="margin-top: 3ex">
Further information with detailed examples on job submissions can be found on separate pages under the 'Scheduler' menu.
</div>


### Example

In this example we will run compute jobs that outputs the name of the compute node that runs the job, waits ten seconds to emulate some processing, and the time it runs.  The name of the machine where the script runs is available in environment variable `HOSTNAME` (standard in Unix) and the current time can be queried by calling command `date`.  Here is a shell script `~/tests/hello_world` that writes a message, waits for ten seconds, and displays the date:

```sh
#!/bin/env bash

echo "Hello world, I am running on node $HOSTNAME"
sleep 10
date
```

_Hint_: To create this file, make sure that the folder exists first.  If doesn't, call `mkdir ~/tests`.

Although not critical for the job scheduler, it is always convenient to set the file permission on this script file to be executable, e.g.

```sh
[alice@{{ site.devel.name }} ~]$ cd tests/
[alice@{{ site.devel.name }} tests]$ chmod ugo+x hello_world
```

This, in combination with the so called "she-bang" (`#! ...`) on the first line, allows you call the script just as any other software, e.g.

```sh
[alice@{{ site.devel.name }} tests]$ ./hello_world
Hello world, I am running on node {{ site.devel.name }}.
Mon Aug 28 16:31:29 PDT 2017
```

Note how it takes ten seconds between the `Hello world` message and the time stamp.  We have now confirm that the shell script does what we expect it to do, and we are ready to submit it to the job queue of the scheduler.  To do this, do:
```sh
[alice@{{ site.devel.name }} tests]$ sbatch --mem=10M hello_world
Submitted batch job 3084
```

When submitting a job, the scheduler assigned the job a unique identifier ("job id").  In the above example, the job id is '3038'.  We can see this and other jobs of ours on the job queue by using `squeue`;

```sh
[alice@{{ site.devel.name }} tests]$ squeue -l -u $USER
Thu Dec 31 10:34:04 2020
             JOBID PARTITION     NAME     USER    STATE       TIME TIME_LIMI  NODES NODELIST(REASON) 
              3084    common hello_wo    alice  PENDING       0:00 14-00:00:00    1 (Priority)
```

In this case, the scheduler has already launched the job script.  We can see that the job is running (status `R`) on compute node c4-n1.  Eventually, when the job script has finished, `squeue` will no longer list it (if you have no other jobs on the queue, `squeue` will not output anything).

So where is the output of the job?  By default, all output is redirected to a file in the current working directory with a name reflecting the job id;

```sh
[alice@{{ site.devel.name }} tests]$ cat slurm-3084.out
Hello world, I am running on node c4-n10
Thu Dec 31 10:34:00 PST 2020
[alice@{{ site.devel.name }} tests]$ 
```

There is of course nothing preventing us from submitting the same script multiple times.  If done, each submission will result in the script be launched on a compute node and a unique log file `slumrm-<job_id>.out` will be outputted.  Please try that and see what `squeue` outputs.   Now, you may want to pass different arguments to your script each time, e.g. each job should process a different input data file.  For information on how to do this, see the [Submit Jobs] page.


[Slurm]: https://slurm.schedmd.com/documentation.html
[compute nodes]: {{ '/about/specs.html' | relative_url }}
[Submit Jobs]: {{ '/scheduler/submit-jobs.html' | relative_url }}


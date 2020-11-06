# 'Hello World' Job

The C4 cluster farm consists of a number of [compute nodes] that are ready to serve users' compute tasks (aka jobs).  Since all compute nodes are configured the same way, for instance, they have the exact same set software installed, it does not matter on which compute node your analysis runs.

At any time, there will be many users using the cluster where some users run a single analysis whereas other run many multi-day jobs in parallel.  In order for users not to step on each others toes and for users to get a fair share of the compute resources, the cluster uses a so called _job scheduler_ to orchestrate the compute requests.  This works by users submitting their compute jobs to a _partition_.  Then the scheduler will locate one or more compute nodes with enough free resources to process the submitted job and launch the job on those compute nodes.  C4 has a common partition (called common) that anyone may use. C4 also has a number of 'Condo' compute nodes which are owned by individual Labs and set aside for that Lab's use.


## Instructions

The most common way of running compute tasks on the C4 cluster, consists of:

1. creating a script,

2. submitting the script to a partition,

3. waiting for the script to start and finish, and

4. looking at the results, e.g. output data files and text logs.

The C4 cluster uses [SLURM] as its scheduler.  [SLURM] provides command  [sbatch] to submit a script ("job") and command `squeue --user=your_c4-username` to check the status of your jobs. SLURM also provides a way to run a job interactively called `srun`.


<div class="alert alert-info" role="alert" style="margin-top: 3ex">
Further information with detailed examples on job submissions can be found on separate pages under the 'Scheduler' menu.
</div>


### Example

In this example we will run compute jobs that outputs the name of the compute node that runs the job, waits ten seconds to emulate some processing, and the time it runs.  The name of the current machine is available in environment variable `HOSTNAME` (standard in Unix) and the current time is outputted when calling the command `date`.  To do this as a compute job, create a script `~/tests/hello_world` containing:

```sh
#!/bin/env bash

echo "Hello world, I am running on node $HOSTNAME"
sleep 10
date
```
_Hint_: To create this file, make sure that the folder exists first.  If doesn't, call `mkdir ~/tests`.

Although not critical for the job scheduler, it is always convenient to set the file permission on this script file to be executable, e.g.
```sh
[alice@c4-dev1 ~]$ cd tests/
[alice@c4-dev1 tests]$ chmod ugo+x hello_world
```
This, in combination with the so called "she-bang" (`#! ...`) on the first line, allows you call the script just any other software, e.g.
```sh
[alice@c4-dev1 tests]$ ./hello_world
Hello world, I am running on node c4-dev1.
Mon Aug 28 16:31:29 PDT 2017
```
Note how it takes ten seconds between the `Hello world` message and the time stamp.  We have now confirm that the shell script does what we expect it to do, and we are ready to submit it to the job queue of the scheduler.  To do this, do:
```sh
[alice@c4-dev1 tests]$ sbatch hello_world
Submitted batch job 11915
```

When submitting a job, the scheduler assigned the job an identifier ("job id").  In the above example, the job id is '11915'.  Immediately after the job has been submitted and launched on c4-n1;
```sh
[alice@c4-dev1 tests]$ squeue -u "$USER"
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON) 
             11915    common hello_wo    alice  R       0:03      1 c4-n1 
```

Eventually, when the job script finished, `squeue` will no longer list it (if you have no other jobs on the queue, `squeue` will not output anything).

So where is the output of the job?  Since we used no [sbatch] options, the output ends up in the cwd as slurm-11915.out:
```sh
[alice@c4-dev1 tests]$ cat slurm-11915.out
Hello world, I am running on node c4-n1
Wed Nov  4 14:10:47 PST 2020
[alice@c4-dev1 tests]$ 
```

There is of course nothing preventing us from submitting the same script multiple times.  If done, each submission will result in the script be launched on a compute node and a unique log file `slumrm-<job_id>` will be outputted.  Please try that and see what `squeue` outputs.   Now, you may want to pass different arguments to your script each time, e.g. each job should process a different input data file.  For information on how to do this, see the [Submit Jobs] page.


[SLURM]: https://slurm.schedmd.com/documentation.html
[compute nodes]: {{ '/about/specs.html' | relative_url }}
[Submit Jobs]: {{ '/scheduler/submit-jobs.html' | relative_url }}


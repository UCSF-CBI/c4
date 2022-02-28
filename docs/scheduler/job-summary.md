# Job Summary

The more accurately you can specify the required resources (memory, running time, local scratch needs, ...) of your jobs, the better the job scheduler can serve your needs and often your jobs will be processed sooner.  For instance, if you have a good sense of the amount of memory and run time your job needs, then you can specify these via [Slurm options]({{ '/scheduler/submit-jobs.html' | relative_url }}) `--mem` and `--time`.  If you don't specify them, your job will use the default settings.


## Output job details at end of job

If you don’t know how much resources your job consumes, you can add a `sstat` statement to the end of your job script.  This will output a detailed summary of your job to the job output log. Here is an example of a job that runs R, draws 100 million random numbers and calculates their summary statistics. We also call the garbage collector 100 times to emulate some CPU processing to give the scheduler enough time to snapshot the job. At the end, we output the job summary.

```sh
#!/usr/bin/env bash
#SBATCH --export=NONE
#SBATCH --mem=4G
#SBATCH --time=00:05:00
#SBATCH --output=%x-%j.out

module load CBI r

## Summarize 100 million random numbers in R, which occupies
## 100e6 * 8 bytes = 0.80 GB of RAM.
## We also run the garbage collector 100 times to
## emulate some CPU processing time

Rscript -e "x <- rnorm(100e6); for (i in 1:100) gc(); summary(x)"

## End-of-job summary, if running as a job
[[ -n "$SLURM_JOB_ID" ]] && sstat --format="JobID,AveCPU,MaxRSS,MaxPages,MaxDiskRead,MaxDiskWrite" --allsteps --jobs="$SLURM_JOB_ID"
```

The `sstat` call will append something like the following to our Slurm log file:

```sh
       JobID     AveCPU     MaxRSS MaxPages  MaxDiskRead MaxDiskWrite 
------------ ---------- ---------- -------- ------------ ------------ 
5122.batch    00:00.000   3186108K        0      9295430        16167
```

From this we learn that:

* JobID: `5121.batch` - the job id and job step
* AveCPU: `00:00.000` - average (system + user) CPU time (mm:ss.uuu)
* MaxRSS: `3186112K` - maximum memory use (resident set size); `--mem` must be greater than this
* MaxPages: `0` - maximum number of memory cache misses (page faults); the smaller this number, the more efficient is the software implemented
* MaxDiskRead: `9295463` - maximum number of bytes read
* MaxDiskWrite: `16167` - maximum number of bytes written

See `man sstat` for details on these and what other fields are available.

_Comments_:

* The reason for the 'AveCPU' time being zero is currently unknown to us /2020-01-05



## Job summary of an already finished job

Complementary to outputting `sstat` information at the end of a job, we can also use `sacct` to query the Slurm accounting database for a summary of the job _after it has finished_.  Here are some of the accounting details available for above job:

```sh
[alice@{{ site.login.name }} ~]$ sacct --format="JobID,State,ExitCode,Submit,Start,Elapsed,AveCPU,CpuTime,MaxRSS,MaxPages,MaxDiskRead,MaxDiskWrite" -j 5121
       JobID      State ExitCode              Submit               Start    Elapsed     AveCPU    CPUTime     MaxRSS MaxPages  MaxDiskRead MaxDiskWrite 
------------ ---------- -------- ------------------- ------------------- ---------- ---------- ---------- ---------- -------- ------------ ------------ 
5121          COMPLETED      0:0 2021-01-05T13:49:29 2021-01-05T13:49:30   00:00:46              00:00:46                                               
5121.batch    COMPLETED      0:0 2021-01-05T13:49:30 2021-01-05T13:49:30   00:00:46   00:00:00   00:00:46   3186112K        0        8.86M        0.02M
```

For more details and additional statistics collected, see `man sacct`.


With this information, we can narrow down that the total processing time was 46 seconds (`Elapsed=00:00:46`) and that the maximum amount of resident set size  memory used was ~3,111 MiB (`MaxRSS=3186112K`).  With the help of `Elapsed` and `MaxRSS` from previous runs, we can re-submit this job script with more relevant resource specifications in our Slurm options within the script (e.g. `--mem=3500M`). Remember it pays to keep the mem request as small as possible. Jobs with large memory requests will sit in the queue longer.


To list all jobs that you ran during the last seven days, use option `--starttime`:

```sh
[alice@{{ site.login.name }} ~]$ sacct --format="JobID,JobName,NodeList,State,ExitCode,Submit,Start,Elapsed,AveCPU,CpuTime,MaxRSS,MaxPages,MaxDiskRead,MaxDiskWrite" --starttime=now-7days
JobID           JobName        NodeList      State ExitCode              Submit               Start    Elapsed     AveCPU    CPUTime     MaxRSS MaxPages  MaxDiskRead MaxDiskWrite 
------------ ---------- --------------- ---------- -------- ------------------- ------------------- ---------- ---------- ---------- ---------- -------- ------------ ------------ 
428284             bash           c4-n4  COMPLETED      0:0 2022-02-18T10:15:39 2022-02-18T10:15:39   00:01:01   00:00:00   01:05:04     11992K        0       23.59M        0.16M 
428286             bash           c4-n4  COMPLETED      0:0 2022-02-18T10:17:44 2022-02-18T10:17:44   00:00:36   00:00:01   00:38:24     86972K        0       14.99M        0.08M 
428292             bash           c4-n4  COMPLETED      0:0 2022-02-18T10:30:47 2022-02-18T10:30:47   00:00:06   00:00:00   00:01:36      7064K        0        0.36M        0.01M 
428293            nproc           c4-n4  COMPLETED      0:0 2022-02-18T10:30:57 2022-02-18T10:30:57   00:00:01   00:00:00   00:00:16      2172K        0        0.01M        0.00M 
428299             bash   None assigned CANCELLED+      0:0 2022-02-18T10:36:28 2022-02-18T10:38:54   00:00:00              00:00:00                                               
428300             bash           c4-n4  COMPLETED      0:0 2022-02-18T10:38:57 2022-02-18T10:38:57   09:51:27 1-09:14:50 19-17:09:36  27034524K     6045  1075023.24M   312038.07M 
428850             bash           c4-n4     FAILED      0:0 2022-02-18T22:46:08 2022-02-18T22:46:08   10:05:23 1-09:12:22 20-04:18:24  35361668K     6899   777877.95M   214575.54M 
```



## Post-mortem job details

Sometimes your job "just dies". There is often a simply explanation to this but finding out why can be complicated at first, especially if there are no clues in the job log files.  One reason for a job terminating early is that it ran out of the requested runtime (`--time=<runtime>`).  If you requested [email notifications]({{ '/scheduler/email-notifications.html' | relative_url }}), then those messages will show something like:

```sh
Slurm Job_id=1034 Name=bam_test Failed, Run time 00:01:13, TIMEOUT, ExitCode 0
```

You can also look in the job log file:

```sh
[alice@{{ site.login.name }} ~]$ cat slurm-1034.log
...
slurmstepd: error: *** JOB 1034 ON c4-n1 CANCELLED AT 2020-12-18T15:51:53 DUE TO TIME LIMIT 
```

You would see a similar error for other resources. For memory:

```sh 
[alice@{{ site.login.name }} ~]$ cat slurm-1007.log
...
slurmstepd: error: Detected 1 oom-kill event(s) in step 1007.batch cgroup. Some of your processes may have been killed by the cgroup out-of-memory handler.
```

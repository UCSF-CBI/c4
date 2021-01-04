<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
<strong><span>⚠️</span> 2020-01-04: This page is work in progress.  Overall it is correct, but details will be soon be updated.  Please make sure to revisit later.</strong>
</div>

# Job Summary

## Figure out how much memory and other resources were used by a completed job

The more accurately you can specify the required resources (memory, running time, local scratch needs, ...) of your jobs, the better the job scheduler can serve your needs and often your jobs will be processed sooner.  For instance, if you have a good sense of the amount of memory and run time your job needs, then you can specify these via [Slurm options]({{ '/scheduler/submit-jobs.html' | relative_url }}) `--mem` and `--time`.  If you don't specify them, your job will use the default settings.

If you don't know how much resources your job consumes, you can run the job without a memory request and then review how much memory was used with `sacct`. Below is a sample job that sorts a bunch of bam files.

```sh
#!/usr/bin/bash

echo "$node STARTED $(date +%s)"

# copy alignment file to node scratch space
cp $HOME/CM-0828.aligned.deduplicated.sorted.bam $TMPDIR

# sort by read name (not coordinate) writing temp files to node scratch but final output to home directory
samtools sort -n -T $TMPDIR -o $HOME/temp/dummy.bam -@ 1 $TMPDIR/CM-0828.aligned.deduplicated.sorted.bam

# clean-up
md5=$(md5sum $HOME/temp/dummy.bam)
echo "md5sum of output file is $md5"
rm $TMPDIR/CM-0828.aligned.deduplicated.sorted.bam

echo "$node COMPLETED $(date +%s)"
echo "$node COMPLETED $(date)"

```

As a first guess, we can assume that this script takes at most 1 hour to run, but let's assume we don't have a good sense on how much memory it will consume, so we set the `--time` Slurm option on the script by add a `#SBATCH --time=01:00:00` header comment the shebang line.  Also as a first guess, we will ask for two CPUs and 4 GiB of RAM. Once we have all the Slurm options in place, the script looks like this:

```sh
#!/usr/bin/bash
#SBATCH --job-name=bam_test                  # Job name
#SBATCH --mail-type=END,FAIL                 # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user={{  site.user.email  }}  # Where to send mail 
#SBATCH --ntasks=2                           # Run on a two CPUs
#SBATCH --mem=4G                             # Job memory request
#SBATCH --time=01:00:00                      # Time limit HH:MM:SS
#SBATCH --output=%x_%j.out                   # Standard output and error log file

echo "$node STARTED $(date +%s)"

# copy alignment file to node scratch space
cp $HOME/data/CM-0828.aligned.deduplicated.sorted.bam $TMPDIR

# sort by read name (not coordinate) writing temp files to node scratch but final output to home directory
samtools sort -n -T $TMPDIR -o $HOMEDIR/temp/dummy.bam -@ 1 $TMPDIR/CM-0828.aligned.deduplicated.sorted.bam

# clean-up
md5=$(md5sum $HOME/temp/dummy.bam)
echo "md5sum of output file is $md5"
rm $TMPDIR/CM-0828.aligned.deduplicated.sorted.bam

echo "$node COMPLETED $(date +%s)"
echo "$node COMPLETED $(date)"
```

```sh
$ sbatch bam-sort-load-test.sh 
Submitted batch job 1033
```

When the job completes, we can find the resources used with the `sacct` command. To see all possible information we can use the `--long` flag:

```sh
$ sacct --long -j 1033
       JobID     JobIDRaw    JobName  Partition  MaxVMSize  MaxVMSizeNode  MaxVMSizeTask  AveVMSize     MaxRSS MaxRSSNode MaxRSSTask     AveRSS MaxPages MaxPagesNode   MaxPagesTask   AvePages     MinCPU MinCPUNode MinCPUTask     AveCPU   NTasks  AllocCPUS    Elapsed      State ExitCode AveCPUFreq ReqCPUFreqMin ReqCPUFreqMax ReqCPUFreqGov     ReqMem ConsumedEnergy  MaxDiskRead MaxDiskReadNode MaxDiskReadTask    AveDiskRead MaxDiskWrite MaxDiskWriteNode MaxDiskWriteTask   AveDiskWrite    AllocGRES      ReqGRES    ReqTRES  AllocTRES TRESUsageInAve TRESUsageInMax TRESUsageInMaxNode TRESUsageInMaxTask TRESUsageInMin TRESUsageInMinNode TRESUsageInMinTask TRESUsageInTot TRESUsageOutMax TRESUsageOutMaxNode TRESUsageOutMaxTask TRESUsageOutAve TRESUsageOutTot 
------------ ------------ ---------- ---------- ---------- -------------- -------------- ---------- ---------- ---------- ---------- ---------- -------- ------------ -------------- ---------- ---------- ---------- ---------- ---------- -------- ---------- ---------- ---------- -------- ---------- ------------- ------------- ------------- ---------- -------------- ------------ --------------- --------------- -------------- ------------ ---------------- ---------------- -------------- ------------ ------------ ---------- ---------- -------------- -------------- ------------------ ------------------ -------------- ------------------ ------------------ -------------- --------------- ------------------- ------------------- --------------- --------------- 
1033_1       1034           rgc_gwas      Witte                                                                                                                                                                                                               2   00:00:01  COMPLETED      0:0                  Unknown       Unknown       Unknown       80Gn                                                                                                                                                                    billing=1+ billing=2+                                                                                                                                                                                                                                 
1033_1.batch 1034.batch        batch                                                                                                                                                                                                               1          2   00:00:01  COMPLETED      0:0          0             0             0             0       80Gn              0                                                                                                                                                                cpu=2,mem+                                                                                                                                                                                                                                 
1033         1033           bam_test     common                                                                                                                                                                                                               2   00:32:48  COMPLETED      0:0                  Unknown       Unknown       Unknown        4Gn                                                                                                                                                                    billing=2+ billing=2+                                                                                                                                                                                                                                 
1033.batch   1033.batch        batch              1111264K          c4-n1              0   1111264K    882060K      c4-n1          0    882060K        0        c4-n1              0          0   00:31:31      c4-n1          0   00:00:02        1          2   00:32:48  COMPLETED      0:0    426.88M             0             0             0        4Gn              0    14439.05M           c4-n1               0      14439.05M    15940.97M            c4-n1                0      15940.97M                                      cpu=2,mem+ cpu=00:00:02,+ cpu=00:31:31,+ cpu=c4-n1,energy=+ cpu=0,fs/disk=0,m+ cpu=00:31:31,+ cpu=c4-n1,energy=+ cpu=0,fs/disk=0,m+ cpu=00:00:02,+ energy=0,fs/di+ energy=c4-n1,fs/di+           fs/disk=0 energy=0,fs/di+ energy=0,fs/di+ 
 
```

There is a lot of information here. We can narrow down the scope of this query with the `--format` option to see the relevant bits:
```sh
$ sacct -j 1033 --format="JobID,State,Elapsed,MaxRSS"
       JobID      State    Elapsed     MaxRSS 
------------ ---------- ---------- ---------- 
1033_1        COMPLETED   00:00:01            
1033_1.batch  COMPLETED   00:00:01            
1033          COMPLETED   00:32:48            
1033.batch    COMPLETED   00:32:48    882060K 

```

With this information, we can narrow down that the total processing time was 32 minutes 48 seconds (`Elapsed=00:32:48`) and that the maximum amount of resident set size  memory used was ~865 MiB (`MaxRSS=882060K`).  With the help of `Elapsed` and `MaxRSS` from previous runs, we can re-submit this job script with more relevant resource specifications in our Slurm options within the script (eg `--mem=1gb`). Remember it pays to keep the mem request as small as possible. Jobs with large memory requests will sit in queue longer.


## Put a line in your script to display maximum resources used by that job

We can use the sstat command to get information about running jobs. That being the case, it is possible to have a line at the end of your script that will output the maximum memory used by the job to the standard out file (job log). Taking the above script as an example, we can add this to the very last line:
```sh
## End-of-job summary, if running as a job
[[ -n "$SLURM_JOB_ID" ]] && sstat -j "$SLURM_JOB_ID" --format "MaxRSS"
```

To get a list of all possible output items, see `sstat --helpformat` and subsection 'Job Status Fields' in `man sstat`.


## Post-mortem job details

Sometimes your job "just dies". There is often a simply explanation to this but finding out why can be complicated at first, especially if there are no clues in the job log files.

One common reason for jobs terminating early is that it ran out of the requested runtime (`--time=<runtime>`).  When that happens in Slurm you get an indication from the end of job email similar to:

```sh
Slurm Job_id=1034 Name=bam_test Failed, Run time 00:01:13, TIMEOUT, ExitCode 0
```

You can also look in the job log:
```sh
slurmstepd: error: *** JOB 1034 ON c4-n1 CANCELLED AT 2020-12-18T15:51:53 DUE TO TIME LIMIT 
```

You would see a similar error for other resources. For memory:

```sh 
slurmstepd: error: Detected 1 oom-kill event(s) in step 1007.batch cgroup. Some of your processes may have been killed by the cgroup out-of-memory handler.
```



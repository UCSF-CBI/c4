# Using Local /scratch (TMPDIR) on Compute Nodes

All nodes (compute and development) have their own locally storage mounted as `/scratch`.  The `/scratch` storage is fast - faster than system-wide storage such as home folders but also `/c4/scratch` - which make it ideal for holding intermediate data files.  This will also lower the load on the system-wide storage and the local network.  Using local `/scratch` is a win-win for everyone.

## Instructions

<!--<div class="alert alert-warning" role="alert" markdown="1">
2019-09-09: Currently `TMPDIR` is only set automatically for job scripts running on the compute nodes.  On development nodes, `TMPDIR` is _not_ set - <strike>This is likely to change, but in the meanwhile,</strike> you need to set `TMPDIR` in your script in those cases when it is not set. See below for an example.
</div>-->

Here is how to use `/scratch`:

* **Use environment variable TMPDIR** - on compute nodes, it points to an already created job-specific folder under local `/scratch`. Specifically, for each job it is `/scratch/$SLURM_JOB_USER/$SLURM_JOB_ID`  On other machines, you need to set it.

* **Write intermediate files to folder `$TMPDIR`**.  Bonus: most software already acknowledges `TMPDIR` for their internal temporary files.

* When done, make sure to copy TMPDIR files to be kept to your persistent storage, e.g. to `$HOME`.

* The **job-specific TMPDIR folder (e.g. `/scratch/alice/1012`) will be deleted automatically when the job terminates**.

* **Specify how much local scratch (TMPDIR) storage your job will need**.  Local storage is limited to [{{ site.data.specs.local_scratch_size_min }}-{{ site.data.specs.local_scratch_size_max }} TiB/node]({{ '/about/specs.html' | relative_url }}).  If your job will use up to 200 GiB of disk space, you can specify this resource as `--gres=scratch:200G` (in units of GiB) when submitting the job.  A node with 800 GiB of scratch space can support up to four `--gres=scratch:200G` jobs running at the same time.


### Example

Here is a script called `ex-scratch.sh` that requests 300 GiB of local `/scratch` space and 4 cores.  The script also shows how to copy input files over from the home (= `~/`) folder to the local scratch folder (TMPDIR) of whatever node the job ends up running on.  After processing of the input files is complete, the output files are moved from the local scratch (TMPDIR) to HOME.

```sh
#! /bin/env bash
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --gres=scratch:300G

## 0. In case TMPDIR is not set, e.g. on development nodes, set
##    it to local /scratch, if it exists, otherwise to /tmp
if [[ -z "$TMPDIR" ]]; then
  if [[ -d /scratch ]]; then TMPDIR=/scratch/$USER; else TMPDIR=/tmp/$USER; fi
  mkdir -p "$TMPDIR"
  export TMPDIR
fi

## 1. Use a temporary working directory
cd "$TMPDIR"

## 2. Copy input files from global disk to local scratch
cp ~/sample.fq .
cp ~/reference.fa .

## 3. Process input files
/path/to/my_pipeline --cores=${SLURM_NTASKS:-1} reference.fa sample.fq > output.bam

## 4. Move output files back to global disk
mv output.bam ~
```

<!--
Assume that the total amount of local scratch you need for your input files and your output files and whatever intermediate files `my_pipeline` needs is 100 GiB, and assume that the process requires up to 8 GiB of RAM (=4 GiB per core) to complete.  Moreover, let's say you wish to run in parallel using two cores.  Then you should submit this job script as:
```sh
$ qsub -l scratch=100G -l mem_free=4G -pe smp 2 ex-scratch.sh
```


To understand the purpose of `qstat -j` at the end, see the [Job Summary]({{ '/scheduler/job-summary.html' | relative_url }}) page.
-->

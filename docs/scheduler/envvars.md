# Useful Job Environment Variables

The scheduler sets variables in the environment of the job script.  Here is an excerpt of the most useful ones:

* `SLURM_JOB_NAME` (string) - the name of the job
* `SLURM_JOB_ID` (integer) - a unique job identifier (Note, do _not_ use the _deprecated_ `SLURM_JOBID`)
* `SLURM_NTASKS` (integer) - the number of hosts for a parallel job; if not available, use as if 1 (Note, do _not_ use the _deprecated_ `SLURM_NPROCS`)
* `SLURM_MEM_PER_NODE` (integer) - the number of megabytes (MiB) allocated to the job on the current node
* `TMPDIR` (string) - the absolute path to a job-specific temporary directory (local on the compute node and owned by `$USER`) that is automatically removed when the job finishes

When job arrays are used:

* `SLURM_ARRAY_JOB_ID` (string) - job array's main job ID number
* `SLURM_ARRAY_TASK_COUNT` (integer) - total number of tasks in a job array
* `SLURM_ARRAY_TASK_ID` (integer) - job array ID (index) number
  
For further details, see Section 'OUTPUT ENVIRONMENT VARIABLES' of `man sbatch`.



## Example

To see all environment variable available to a job, we can submit a quick 30-second, 10-MiB job that outputs all environment variables and their values sorted by name;

```sh
$ sbatch --mem=10M --time=00:00:30 --wrap="env | sort"
Submitted batch job 3076
```

Note how we used the `--wrap` option, which avoids having to create a job script when doing small tasks like here.

When finished, check the content of the output file:
```sh
$ grep -E "(HOSTNAME|PWD|TMPDIR|SLURM_)" slurm-3076.out
HOSTNAME=c4-n10
PWD=/c4/home/alice
SLURM_CLUSTER_NAME=c4
SLURM_CONF=/etc/slurm/slurm.conf
SLURM_CPUS_ON_NODE=1
SLURM_GTIDS=0
SLURM_JOB_ACCOUNT=boblab
SLURM_JOB_CPUS_PER_NODE=1
SLURM_JOB_GID=500
SLURM_JOB_ID=3071
SLURM_JOBID=3071
SLURM_JOB_NAME=wrap
SLURM_JOB_NODELIST=c4-n10
SLURM_JOB_NUM_NODES=1
SLURM_JOB_PARTITION=common
SLURM_JOB_QOS=normal
SLURM_JOB_UID=30000
SLURM_JOB_USER=alice
SLURM_LOCALID=0
SLURM_MEM_PER_NODE=10
SLURM_NNODES=1
SLURM_NODE_ALIASES=(null)
SLURM_NODEID=0
SLURM_NODELIST=c4-n10
SLURM_PRIO_PROCESS=0
SLURM_PROCID=0
SLURM_SUBMIT_DIR=/c4/home/alice
SLURM_SUBMIT_HOST=c4-log1
SLURM_TASK_PID=17170
SLURM_TASKS_PER_NODE=1
SLURM_TOPOLOGY_ADDR=c4-n10
SLURM_TOPOLOGY_ADDR_PATTERN=node
SLURM_WORKING_CLUSTER=c4:10.10.10.3:6817:8960:101
TMPDIR=/scratch/alice/3076
```


## Environment variables in different languages

Here are some examples how to get the value of environment variable `SLURM_NTASKS` in some of the most popular programming languages.  The value is assigned to a local variable `nslots`, and if not set, `1` is used as the default value.  All examples coerce the value to a numeric value and then outputs a message with the value.

### Bash

```sh
nslots=${SLURM_NTASKS:-1}
echo "Number of slots available: ${nslots}"
```

<!-- ### MATLAB

```matlab
nslots = getenv('SLURM_NTASKS');        % env var is always a 'char'
if (isempty(nslots)) nslots = '1'; end  % default value
nslots = str2num(nslots);               % coerce to 'double'
fprintf('Number of slots available: %d\n', nslots);
``` -->

### Python

```python
import os
nslots = os.getenv('SLURM_NTASKS', '1')  # env var is always a 'str'
nslots = int(nslots)                     # coerce to 'int'
print('Number of slots available: ' + nslots)
```

### R

```r
nslots <- Sys.getenv("SLURM_NTASKS", "1")  # env var is always a 'character'
nslots <- as.integer(nslots)               # coerce to 'integer'
message("Number of slots available: ", nslots)
```


### Ruby

```r
nslots = ENV["SLURM_NTASKS"] || "1"  # env var is always a 'String'
nslots = nslots.to_i                 # coerce to 'Integer'
puts "Number of slots available: #{nslots}"
```

# Useful Job Environment Variables

Some of the environment variables set by the scheduler and available to a job at runtime:

* `SLURM_NODELIST` (string) - the name of the machine(s) where the job is launched

* `SLURM_JOB_ID` (integer) - a unique job identifier

* `SLURM_JOB_NAME` (string) - the name of the job as it appears on the queue

* `SLURM_NTASKS` (integer) - the number of hosts for a parallel job (default: 1)

* `SLURM_NPROCS` (integer) - the number of slots allocated for a parallel job (default: 1)

* `PE_HOSTFILE` (string) - the absolute path of a file with rows of machines allocated to a parallel job
<!--* `SGE_GPU` (comma-separated integers or `undefined`) - set of GPU core indices allocated to a GPU job (default: `undefined`)-->
* `SLURM_ARRAY_TASK_ID` (number) - subtask identifier for array jobs 

* `TMP` (string) - same as `TMPDIR`

* `TMPDIR` (string) - the absolute path to a job-specific temporary directory (local on the compute node and owned by `$USER`) that is automatically removed when the job finishes


## Example

To see all environment variable available to a job, submit a job that calls `env`:

```sh
$ cat myenv.bash 
#!/bin/bash 
#SBATCH --account=cbi
#SBATCH --partition=common
#SBATCH --mail-type=END,FAIL          # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=harry.putnam@ucsf.edu          # user to receive notification emails
#SBATCH --ntasks=1                    # Run on a single CPU
#SBATCH --mem=80gb                     # Job memory request
#SBATCH --time=1:00:00               # Time limit hrs:min:sec
#SBATCH --output=/c4/home/alice/myenv_log_%A_%a.log   # Standard output and error log
mydate=`date`
echo "Date is $mydate" > $HOME/myenv.out
echo "Host is $HOSTNAME" >> $HOME/myenv.out
echo "TMPDIR is $TMPDIR" >> $HOME/myenv.out
full_env=`env|sort`
echo "Full Enviroment $full_env" >> $HOME/myenv.out
exit;

$ sbatch myenv.bash 
Submitted batch job 1484
```

When finished, check the content of the job output file:
```sh
$ cat myenv.out
Date is Mon Dec 21 10:52:43 PST 2020
Host is c4-n10
TMPDIR is /scratch/alice/1484
Full Enviroment CLUSTER=c4
ENVIRONMENT=BATCH
ftp_proxy=http://c4-yum1:3128
HISTCONTROL=ignoredups
HISTSIZE=1000
HOME=/c4/home/alice
HOSTNAME=c4-n10
http_proxy=http://c4-yum1:3128
https_proxy=http://c4-yum1:3128
LANG=en_US.UTF-8
LD_LIBRARY_PATH=/my/cool/path
LESSOPEN=||/usr/bin/lesspipe.sh %s
LOGNAME=alice
LS_COLORS=rs=0:di=38;5;27:ln=38;5;51:mh=44;38;5;15:pi=40;38;5;11:so=38;5;13:do=38;5;5:bd=48;5;232;38;5;11:cd=48;5;232;38;5;3:or=48;5;232;38;5;9:mi=05;48;5;232;38;5;15:su=48;5;196;38;5;15:sg=48;5;11;38;5;16:ca=48;5;196;38;5;226:tw=48;5;10;38;5;16:ow=48;5;10;38;5;21:st=48;5;21;38;5;15:ex=38;5;34:*.tar=38;5;9:*.tgz=38;5;9:*.arc=38;5;9:*.arj=38;5;9:*.taz=38;5;9:*.lha=38;5;9:*.lz4=38;5;9:*.lzh=38;5;9:*.lzma=38;5;9:*.tlz=38;5;9:*.txz=38;5;9:*.tzo=38;5;9:*.t7z=38;5;9:*.zip=38;5;9:*.z=38;5;9:*.Z=38;5;9:*.dz=38;5;9:*.gz=38;5;9:*.lrz=38;5;9:*.lz=38;5;9:*.lzo=38;5;9:*.xz=38;5;9:*.bz2=38;5;9:*.bz=38;5;9:*.tbz=38;5;9:*.tbz2=38;5;9:*.tz=38;5;9:*.deb=38;5;9:*.rpm=38;5;9:*.jar=38;5;9:*.war=38;5;9:*.ear=38;5;9:*.sar=38;5;9:*.rar=38;5;9:*.alz=38;5;9:*.ace=38;5;9:*.zoo=38;5;9:*.cpio=38;5;9:*.7z=38;5;9:*.rz=38;5;9:*.cab=38;5;9:*.jpg=38;5;13:*.jpeg=38;5;13:*.gif=38;5;13:*.bmp=38;5;13:*.pbm=38;5;13:*.pgm=38;5;13:*.ppm=38;5;13:*.tga=38;5;13:*.xbm=38;5;13:*.xpm=38;5;13:*.tif=38;5;13:*.tiff=38;5;13:*.png=38;5;13:*.svg=38;5;13:*.svgz=38;5;13:*.mng=38;5;13:*.pcx=38;5;13:*.mov=38;5;13:*.mpg=38;5;13:*.mpeg=38;5;13:*.m2v=38;5;13:*.mkv=38;5;13:*.webm=38;5;13:*.ogm=38;5;13:*.mp4=38;5;13:*.m4v=38;5;13:*.mp4v=38;5;13:*.vob=38;5;13:*.qt=38;5;13:*.nuv=38;5;13:*.wmv=38;5;13:*.asf=38;5;13:*.rm=38;5;13:*.rmvb=38;5;13:*.flc=38;5;13:*.avi=38;5;13:*.fli=38;5;13:*.flv=38;5;13:*.gl=38;5;13:*.dl=38;5;13:*.xcf=38;5;13:*.xwd=38;5;13:*.yuv=38;5;13:*.cgm=38;5;13:*.emf=38;5;13:*.axv=38;5;13:*.anx=38;5;13:*.ogv=38;5;13:*.ogx=38;5;13:*.aac=38;5;45:*.au=38;5;45:*.flac=38;5;45:*.mid=38;5;45:*.midi=38;5;45:*.mka=38;5;45:*.mp3=38;5;45:*.mpc=38;5;45:*.ogg=38;5;45:*.ra=38;5;45:*.wav=38;5;45:*.axa=38;5;45:*.oga=38;5;45:*.spx=38;5;45:*.xspf=38;5;45:
MAIL=/var/spool/mail/alice
MODULEPATH=/software/c4/modulefiles/repos:
PATH=/software:/software/bin:/software/ruby-2.6.0/bin:/software/RSEM-1.3.1/bin:/software/python/bin:/software/gatk:/software/bowtie2:/software/Bismark:/opt/sge/bin/lx-amd64/:/home/alice/ht-pipes/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/c4/home/alice/.local/bin:/c4/home/alice/bin
PWD=/c4/home/alice
RSYNC_PROXY=c4-yum1:3128
SHELL=/bin/bash
SHLVL=2
SLURM_CLUSTER_NAME=c4
SLURM_CONF=/etc/slurm/slurm.conf
SLURM_CPUS_ON_NODE=1
SLURMD_NODENAME=c4-n10
SLURM_GTIDS=0
SLURM_JOB_ACCOUNT=cbi
SLURM_JOB_CPUS_PER_NODE=1
SLURM_JOB_GID=509
SLURM_JOB_ID=1484
SLURM_JOBID=1484
SLURM_JOB_NAME=myenv.bash
SLURM_JOB_NODELIST=c4-n10
SLURM_JOB_NUM_NODES=1
SLURM_JOB_PARTITION=common
SLURM_JOB_QOS=normal
SLURM_JOB_UID=1035
SLURM_JOB_USER=alice
SLURM_LOCALID=0
SLURM_MEM_PER_NODE=81920
SLURM_NNODES=1
SLURM_NODE_ALIASES=(null)
SLURM_NODEID=0
SLURM_NODELIST=c4-n10
SLURM_NPROCS=1
SLURM_NTASKS=1
SLURM_PRIO_PROCESS=0
SLURM_PROCID=0
SLURM_SUBMIT_DIR=/c4/home/alice
SLURM_SUBMIT_HOST=c4-log2
SLURM_TASK_PID=45377
SLURM_TASKS_PER_NODE=1
SLURM_TOPOLOGY_ADDR=c4-n10
SLURM_TOPOLOGY_ADDR_PATTERN=node
SLURM_WORKING_CLUSTER=c4:10.10.10.3:6817:8960:101
SSH_CLIENT=10.48.83.115 50880 22
SSH_CONNECTION=10.48.83.115 50880 169.230.134.136 22
SSH_TTY=/dev/pts/4
TERM=xterm-256color
TMOUT=86400
TMPDIR=/scratch/alice/1484
USER=alice
_=/usr/bin/env
XDG_RUNTIME_DIR=/run/user/1035
XDG_SESSION_ID=523

```


## Environment variables in different languages

Here are some examples how to get the value of environment variable `SLURM_NPROCS` in some of the most popular programming languages.  The value is assigned to a local variable `nslots`, and if not set, `1` is used as the default value.  All examples coerce the value to a numeric value and then outputs a message with the value.

### Bash

```sh
nslots=${SLURM_NPROCS`:-1}
echo "Number of slots available: ${nslots}"
```

<!-- ### MATLAB

```matlab
nslots = getenv('NSLOTS');              % env var is always a 'char'
if (isempty(nslots)) nslots = '1'; end  % default value
nslots = str2num(nslots);               % coerce to 'double'
fprintf('Number of slots available: %d\n', nslots);
``` -->

### Python

```python
import os
nslots = os.getenv('SLURM_NPROCS', '1')  # env var is always a 'str'
nslots = int(nslots)               # coerce to an 'int'
print('Number of slots available: ' + nslots)
```

### R

```r
nslots <- Sys.getenv("SLURM_NPROCS", "1")  # env var is always a 'character'
nslots <- as.integer(nslots)         # coerce to an 'integer'
message("Number of slots available: ", nslots)
```



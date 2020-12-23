# Advanced Scheduler Usage

## Programmatically get job id

When submitting a job, the job id is outputted to standard output (stdout) as part of a long message, e.g.
```sh
$ sbatch hello_world 
Submitted batch job 46
```
With Slurm, we do not have the --terse option as we did with qsub so we have to get creative with grep and regular expressions.
```sh
$ sbatch hello_world |grep -o '[[:digit:]]*'
49
```
Using Bash syntax, you can capture the job id when submitting the job as:
```sh
$ jobid=$(sbatch hello_world |grep -o '[[:digit:]]*')
$ echo $jobid
50
```
This allows you to pass it in downstream calls, e.g. `sacct -j $jobid`.


## Additional resources

For more help on the Slurm scheduler, please see:

* [Slurm Quick Start User Guide](https://slurm.schedmd.com/quickstart.html) - by SCHEDMD

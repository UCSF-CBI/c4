# Advanced Scheduler Usage

## Programmatically get job id

When submitting a job, the job id is outputted to standard output (stdout) as part of a long message, e.g.

```sh
$ sbatch --mem=10M hello_world 
Submitted batch job 46
```

Although it possible to parse this output string to infer the job id, by adding option `--parsable` only the job id itself is outputted removing any needs for parsing, e.g.

```sh
$ sbatch --parsable --mem=10M hello_world
49
```

Using Bash syntax, you can capture the job id when submitting the job as:

```sh
$ job_id=$(sbatch --parsable --mem=10M hello_world)
$ echo "$job_id"
50
```

This allows you to pass it in downstream calls, e.g. `sacct -j $job_id`.


## Additional resources

For more help on the Slurm scheduler, please see:

* [Slurm Quick Start User Guide](https://slurm.schedmd.com/quickstart.html) - by SCHEDMD

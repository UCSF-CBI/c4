## Interactive Jobs

Although [development nodes are configured very similar to compute nodes]({{ '/about/specs.html' | relative_url }}), sometimes it is useful to prototype scripts interactively on a compute node.  This can be done by requesting a _interactive job_ from the scheduler using the `srun` command.

For example, to request an interactive, three-hour, 32 GiB, four-core slot on one of the compute nodes, use:

```sh
[alice@{{ site.login.name }} ~]$ srun --export=NONE --nodes=1 --cpus-per-task=4 --mem=32G --time=03:00:00 --pty $SHELL
srun: job 366712 queued and waiting for resources
srun: job 366712 has been allocated resources
[alice@c4-n3:job=366712 ~]$ echo "Number of CPUs on machine: $(nproc --all)"
Number of CPUs on machine: 64
[alice@c4-n3:job=366712 ~]$ echo "Number of CPUs (per cgroups): $(nproc)"
Number of CPUs (per cgroups): 4
[alice@c4-n3:job=366712 ~]$ echo "Number of CPUs (per Slurm): ${SLURM_CPUS_PER_TASK:-1}"
Number of CPUs (per Slurm): 4
[alice@c4-n3:job=366712 tests-slurm]$ module load CBI r
[alice@c4-n3:job=366712 tests-slurm]$ Rscript -e 'parallelly::availableCores(which = "all")'
system  nproc  Slurm 
    64      4      4
[alice@c4-n3:job=366712 ~]$ 
```

_Comment_: For most users, `--pty $SHELL` is the same as `--pty bash`; using `$SHELL` makes sure it works for users running other types of shells.


To exit an interactive job, use `exit` or `logout`, e.g.

```sh
[alice@c4-n3:job=366712 ~]$ exit
[alice@{{ site.login.name }} ~]$ 
```

Just like for regular jobs, you can get a [detailed summary]({{ '/scheduler/job-summary.html' | relative_url }}) of the resources your interactive job consumed using `sstat -j <job_id>`.

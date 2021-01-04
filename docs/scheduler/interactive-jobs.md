<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
<strong><span>⚠️</span> 2020-01-04: This page is work in progress.  Overall it is correct, but details will be soon be updated.  Please make sure to revisit later.</strong>
</div>

## Interactive Jobs

Although [development nodes are configured very similar to compute nodes]({{ '/about/specs.html' | relative_url }}), sometimes it is useful to prototype scripts interactively on a compute node.  This can be done by requesting a _interactive job_ from the scheduler using the `srun` command.

For example, to request an interactive, three-hour, 32 GiB, two-core slot on one of the compute nodes, use:

```sh
[alice@{{ site.login.name }} ~]$ srun --export=NONE --ntasks=2 --mem=32G --time=03:00:00 --pty $SHELL
srun: job 4303 queued and waiting for resources
srun: job 4303 has been allocated resources
[alice@c4-n2:job=4303 ~]$ echo "Number of slots: ${SLURM_NTASKS:-1}"
Number of slots: 2
[alice@c4-n2:job=4303 ~]$ 
```

_Comment_: For most users, `--pty $SHELL` is the same as `--pty bash`; using `$SHELL` makes sure it works for users running other types of shells.


To exit an interactive job, use `exit` or `logout`, e.g.

```sh
[alice@c4-n2:job=4303 ~]$ exit
[alice@{{ site.login.name }} ~]$
```

Just like for regular jobs, you can get a [detailed summary]({{ '/scheduler/job-summary.html' | relative_url }}) of the resources your interactive job consumed using `sstat -j <job_id>`.

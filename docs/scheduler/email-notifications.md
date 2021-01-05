<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
<strong><span>⚠️</span> 2020-01-04: This page is work in progress.  Overall it is correct, but details will be soon be updated.  Please make sure to revisit later.</strong>
</div>

<!--
<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
<strong>Do not request email notifications for array jobs!</strong>  If done, there will be email messages sent for <em>every single task</em> in the job array.
</div>
-->

## Job Email Notifications

Instead of polling `squeue` to check whether submitted jobs are queued, running, or finished, one can tell the job scheduler to send email notifications as jobs change state.  This is done by specifying `sbatch` option `--mail-type=<type>`, where `<type>` specifies under what circumstances an email message should be sent.  The commonly used types of state changes are:

* BEGIN: when the job starts 
* END: when the job ends
* FAIL: when the job fails

For further details and additional state-change types, see `man sbatch`.  The notifications are sent to the email addresses specified by option `---mail-user=<recipients>`.  Here is an example that sends an email when the job begins, ends, or fails:

```sh
$ sbatch --mail-user={{ site.user.email }} --mail-type=BEGIN,END,FAIL --wrap='echo "Current timestamp: $(date)"'
```

See below for example of what these email notifications may look like.  To send an email only when the job completed, successfully or not, use `--mail-type=END,FAIL` instead.


<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
<span>⚠️</span> We advice against specifying <code>#SBATCH --mail-user=...</code> in job scripts.  If you do, there is a risk that you will receive email notifications when someone copies your job script and forgets to update the script.  By specifying the recipient via <code>sbatch --mail-user=...</code> you avoid this problem.  Alternatively, a more convenient approach is to not specify it at all and instead rely on the default email address that you can configure at your choice.
</div>


### Configure the default recipient

If `--mail-user` is not specified, then the email notifications will be sent to your local {{ site.cluster.name }} mailbox (which can only be accessed using the `mail` command).  It is possible to configure all messages sent to this local mailbox to be forwarded to an email address of your choice as given by the `~/.forward` file.  For example, with:

```sh
[alice@{{ site.login.name }} ~]$ cat ~/.forward
# Recipients of email notifications from Slurm, crontab, etc.
{{ site.user.email }}
```

any Slurm notifications produced by jobs that `alice` runs, will forwarded to `{{ site.user.email }}`.


### Example messages

The subject of an email message sent when a job starts (`--mail-type` includes `BEGIN`), will look like:

```lang-none
Slurm Job_id=1006 Name=serial_job_test Began, Queued time 00:00:01
```

and the one sent when a job ends successfully (`--mail-type` includes `END`), will look like:

```lang-none
Slurm Job_id=1006 Name=serial_job_test Ended, Run time 00:01:12, COMPLETED, ExitCode 0
```

The message sent when a job abends (`--mail-type` includes `FAIL`) will look like:

```lang-none
Slurm Job_id=1007 Name=memorywaster.bash Failed, Run time 00:01:01, OUT_OF_MEMORY
```

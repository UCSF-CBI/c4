<!--<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
<strong>Do not request email notifications for array jobs!</strong>  If done, there will be email messages sent for <em>every single task</em> in the job array.
</div> -->

## Job Email Notifications

Instead of polling `squeue` to check whether submitted jobs are queued, running, or finished, one can tell the job scheduler to send email notifications as jobs change state.  This is done by specifying `sbatch` option `--mail-type=<type>` and option `---mail=<recipients>`, where `<type>` specifies under what circumstances an email message should be sent to `<recipients>`. Type is one of NONE, BEGIN, END, FAIL, REQUEUE, ALL.

To send an email when the job (b)egins, (e)nds, or (a)borts, submit the job as:

```sh
$ sbatch --mailuser=alice.bobson@ucsf.edu --mail-type=BEGIN,END.FAIL myscript.sh
```

To send an email only when the job completed, successfully or not, skip (b)egin notifications by using only:

```sh
$ sbatch --mailuser=alice.bobson@ucsf.edu --mail-type=END myscript.sh
```

Alternatively, one may include the mail (and other) sbatch options directly in the job script as `#SBATCH` options. For example, we can include the following in Alice's script just after the shebang:

```sh
#SBATCH --mail-type=END,FAIL                       # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=alice.bobson@ucsf.edu          # user to receive notification emails
.
.
.
```
<!--### Email notifications for array jobs

**Do not request email notifications for array jobs!**  If done, there will be email messages sent for _every single task_ of the job array.  Instead, to get an email notification when a job array completes, submit a "dummy" job that depend on the job array such that it will only launch when the job array completes.  The sole purpose of this dummy job is to trigger an email notification.  For instance, if the job array has job ID 9156754, then submit a job:

```sh
$ job_id=9156754
$ echo 'date' | qsub -N "Array_job_${job_id}_done" -m b  -l h_rt=00:00:05 -hold_jid "${job_id}"
```

This will send an email with 'Array_job_9156754_done' in the subject line as soon as the dummy job launches.



### Configure a default recipient

To avoid having to specify the email address in each `qsub` call, or as an SGE directive in the job script, one can set the default in the `~/.sge_request` (create if missing) by adding:

```sh
## Default recipient of job notifications
-M alice.bobson@ucsf.edu
```

The advantage of specifying the recipient in `~/.sge_request`, instead of in the job script, is that the job script does not carry your personal email address.  If the job script has your email address, then it will be you that get email notifications if someone else copy your script as-is and runs it on the cluster (or on other SGE clusters).

<div class="alert alert-danger" role="alert" style="margin-top: 3ex">
<strong>Please do not specify <code>-m bea</code> in <code>~/.sge_request</code></strong> to make it the default for <em>all</em> of your jobs. If done, you might end up producing thousands of email messages when you submit array jobs.
</div>
-->

### Example messages

The subject of an email message sent when a job starts (`--mailtype` includes `BEGIN`), will look like:

```lang-none
Slurm Job_id=1006 Name=serial_job_test Began, Queued time 00:00:01
```

and the one sent when a job ends successfully (`--mailtype` includes `END`), will look like:

```lang-none
Slurm Job_id=1006 Name=serial_job_test Ended, Run time 00:01:12, COMPLETED, ExitCode 0
```

The message sent when a job abends (`--mailtype` includes `FAIL`) will look like:

```lang-none
Slurm Job_id=1007 Name=memorywaster.bash Failed, Run time 00:01:01, OUT_OF_MEMORY
```



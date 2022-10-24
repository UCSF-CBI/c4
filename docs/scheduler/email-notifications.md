## Job Email Notifications

Instead of polling `squeue` to check whether submitted jobs are queued, running, or finished, one can tell the job scheduler to send email notifications as jobs change state.  This is done by specifying `sbatch` option `--mail-type=<type>`, where `<type>` specifies under what circumstances an email message should be sent.  The commonly used types of state changes are:

* `BEGIN`: when the job starts 
* `END`: when the job ends
* `FAIL`: when the job fails

For further details and additional state-change types, see `man sbatch`.  The notifications are sent to the email addresses as given in your personal `~/.forward` file.  Here is an example that sends an email when the job begins, ends, or fails:

```sh
$ sbatch --mail-type=BEGIN,END,FAIL --wrap='echo "Current timestamp: $(date)"'
```

See below for example of what these email notifications may look like.  To send an email only when the job completed, successfully or not, use `--mail-type=END,FAIL` instead.


The email notifications will be sent to the email address that is listed in your personal `~/.forward` file.  For example, Slurm notifications for user `alice` are sent to:

```sh
[alice@{{ site.login.name }} ~]$ cat ~/.forward
# Email address per LDAP record added on 2021-01-09
{{ site.user.email }}
```

It is possible to override this by Slurm option `--mail-user="first.last@ucsf.edu"`.


<div class="alert alert-warning" role="alert" style="margin-top: 3ex" markdown="1">
<span>⚠️</span> We advice against specifying `#SBATCH --mail-user=...` in job scripts.  If you do, there is a risk that you will receive email notifications when someone copies your job script and forgets to update the script.  By specifying the recipient via `sbatch --mail-user=...` you avoid this problem.  Alternatively, a more convenient approach is to not specify it at all and instead rely on the default email address that you can configure at your choice.
</div>


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

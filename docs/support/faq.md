# Frequently Asked Questions (FAQs)

## Jobs

**Q**. _I submitted a job - why is it not running?_

**A**. There could be several reason why your job is not running.

A good start is to look at `squeue -u $USER`, which lists all the jobs currently running or waiting to run. The last output field will display a REASON code which explains why the job is pending ("queued").  The most common reason is 'Priority', which means there are other jobs ahead of your job that have higher priority and will run before your job runs.  Another reason is 'Resources', which means that the requested resources can _currently_ not be met, e.g. there's no compute node with `--mem=64G` available at the moment.  For further explanation of these, see the REASON CODE section in `man squeue`.

Another useful tool is `squeue --start -u $USER`.  It gives an _estimate_ when the scheduler predicts each jobs to start.  These estimates should be taken with a grain of salt - it's extremely hard to predict when jobs in a heterogeneous, multi-tenant research environment will finish and how long queued jobs will take.


## Errors

**Q**. _How do I avoid the `/var/spool/slurm/d/job01180/slurm_script: line 17: module: command not found` error?_

**A**. This is because you submit a job script that tries to load an environment module without using the Slurm option `--export=NONE`.


**Q**. _I cannot SSH into the development nodes - I get 'IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!' and 'Host key verification failed.'  What is going on?_

**A**. This most likely happens because we have re-built the problematic development node resulting in its internal security keys having changed since you last access that machine.  If the problem error looks like:

```lang-none
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that a host key has just been changed.
The fingerprint for the ECDSA key sent by the remote host is
SHA256:FaARLbkE3sHP2a33Zgqa/sNXTqqWzZAeu6T43wST4ok.
Please contact your system administrator.
Add correct host key in {{ site.user.home }}/.ssh/known_hosts to get rid of this message.
Offending ECDSA key in {{ site.user.home }}/.ssh/known_hosts:18
ECDSA host key for {{ site.devel.name }} has changed and you have requested strict checking.
Host key verification failed.
```

then the solution is to remove that offending key from your personal `~/.ssh/known_hosts` file on {{ site.cluster.nickname }}.  If you get this error when you try to access, say, {{ site.devel.name }}, then use:

```sh
$ ssh-keygen -R {{ site.devel.name }}
```

to remove all SSH keys associated with that machine.  Alternatively, you can manually remove the problematic key by looking at:

```lang-none
Offending ECDSA key in {{ site.user.home }}/.ssh/known_hosts:18
```

to identify that we want to remove the key on line 18.  To remove that line, use:

```sh
$ sed -i '18d' ~/.ssh/known_hosts
```

Then retry.



## Miscellaneous

### Reset my shell startup file

**Q**. _I might have corrupted my Bash startup files. How do I reset
them?_

**A**. To get a fresh `~/.bashrc` file, make a backup of your old one
and copy the default one by:

```sh
$ cp ~/.bashrc ~/.bashrc.20240701
$ cp /etc/skel/.bashrc ~/
```

**A**. To get a fresh `~/.bash_profile` file, make a backup of your
old one and copy the default one by:

```sh
$ cp ~/.bash_profile ~/.bash_profile.20240701
$ cp /etc/skel/.bash_profile ~/
```


### Avoid screenshots when asking for help

**Q**. _Why don't you like screenshots of output and error messages?_

**A**. We, and others, strongly prefer that you cut-and-paste textual
       output from your SSH terminal in your email, Slack,
       ... messages.  There are several reason for this.  First, and
       most importantly, screenshots are _not_ accessible, which means
       they are useless to a person using a screen reader.  For
       others, text in screenshots might be very hard to read and
       require zooming in on the image.  Second, it is not possible to
       cut-and-paste from a screenshot, which adds unnecessary
       friction to anyone trying to reproduce your problem and help
       you.  Third, contrary to plain text, screenshots are not
       searchable in email clients and on Slack.

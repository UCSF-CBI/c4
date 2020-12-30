# Frequently Asked Questions (FAQs)

## Jobs

**Q**. _I submitted a job - why is it not running?_

**A**. There could be several reason why your job is not running.

A good start is to look at `squeue -u $USER`, which lists all the jobs currently running or waiting to run. The last output field will display a REASON code which explains why the job is pending ("queued").  The most common reason is 'Priority', which means there are other jobs ahead of your job that have higher priority and will run before your job runs.  Another reason is 'Resources', which means that the requested resources can _currently_ not be met, e.g. there's no compute node with `--mem=64gb` available at the moment.  For further explanation of these, see the REASON CODE section in `man squeue`.

Another useful tool is `squeue --start -u $USER`.  It gives an _estimate_ when the scheduler predicts each jobs to start.  These estimates should be taken with a grain of salt - it's extremely hard to predict when jobs in a heterogeneous, multi-tenant research environment will finish and how long queued jobs will take.

A known mistake is to forget to specify how much memory a job needs, i.e. forgetting to declare `--mem=<amount>`.  When not specified, the default is to request the maximum amount of memory on the _next_ available compute node.  When all compute nodes are busy, the job will have to wait until its on top of the queue and there is a free compute node.


# Development / Prototyping

Although you should always run analyses via the job scheduler, there are times when you may need to develop parts of it interactively at the command-line prompt.  For instance, you may need to install some software, a few R packages, or run some quick tests on your new pipeline.  C4 provides _development nodes_ dedicated for such short-term usages and that are configured similarly to the compute nodes.

<div class="alert alert-danger" role="alert" style="margin-top: 3ex">
<strong>Please do not run your real-world analysis on the development nodes.</strong>  Instead run it as a job via the scheduler - this will ensure that your analysis runs as fast as possible and with all the resources it needs.  For further instruction, see the getting-started page <a href="{{ 'get-started/hello-world-job.html' | relative_url }}">Submit Job to Cluster</a>.
</div>

<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
Any shell session that has been idle for more than 24 hours will timeout and exit automatically.
</div>

## List of Development Nodes

 * c4-dev1
 * c4-dev2
 * c4-dev3 (future)

## Instructions

To access one of the _development node_, say, c4-dev1,

1. make sure you are [logged in to the cluster], and

2. type `ssh c4-dev1` and press <kbd>ENTER</kbd>.


### Example

From one of the login nodes, do:

```sh
[alice@c4-log1 ~]$ ssh c4-dev1
alice1@c4-dev1:s password: XXXXXXXXXXXXXXXXXXX
[alice@c4-dev1 ~]$ 
```

<div class="alert alert-info" role="alert" style="margin-top: 3ex">
As from the login nodes, it is possible to submit jobs also from the development nodes.
</div>

[logged in to the cluster]: {{ '/get-started/access-cluster.html' | relative_url }}

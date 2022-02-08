# Work with Rstudio Server

We have a module in the CBI software stack designed to run rstudio server as a per user SLURM job. We can use sbatch (preferred) or srun for this. This is a two step process. Step1 is getting the job submitted and started on C4. Step2 is setting up an ssh tunnel back to your work station so you can access RStudio from your browser. This allows you to use RStudio in a familiar way while unlocking the compute resources on C4.

Addition reading: 
- Software modules: <a href="https://www.c4.ucsf.edu/software/software-modules.html">C4 Software Modules</a>
- rstudio-server-controller: <a href="https://github.com/UCSF-CBI/rstudio-server-controller">rstudio-server-controler</a>


### How to use with sbatch (preferred approach)

Example sbatch script for RStudio server. Let's call it `rstudio.sh`  

```sh
#!/bin/bash
#SBATCH --time=08:00:00
#SBATCH --ntasks=2
#SBATCH --mem=8192
#SBATCH --output=rstudio-server.job.%j
#SBATCH --export=NONE
#SBATCH --gres=scratch:5G

module purge
module load CBI rstudio-server-controller
rsc start --port=random
```

At this point the scratch specification is optional but recommended. We will soon be requiring scratch reservations for all jobs. Please request memory and cpu resource as appropriate for your job. Please do your best to "right size" the job (ask for enough resources to do the job but no more). This module was designed to run on ONLY one node. Please only ever use -N 1 or leave -N unspecified.

You submit the above, on a login or develoipment node, with `sbatch rstudio.sh`

Once submitted, cat the job output file (in our case, rstudio-server.job.JOBID) for instructions about how to set up the ssh tunnel. You will see something *similar* to this:
```
alice, your personal RStudio Server is available on <http://c4-n12:34981>. If you are running from a remote machine without direct access to c4-n12, you can use SSH port forwarding to access the RStudio Server at <http://127.0.0.1:8787> by running 'ssh -J alice@<login-machine> -L 8787:c4-n12:34981 c4-n12' in a second terminal. Any R session started times out after being idle for 480 minutes.
```
You can now set up the tunnel to your workstatio and open a browser with url http://localhost:34981.  Please note, we are asking for a random port on the compute node so the port number will be *different* each time we run this job.

**Cleanly stop the job**

To exit the RStudio session cleanly, press the "power" button in the top right corner of the browser session. Failure to do so will result in an warning next time you use RStudio that things did not end cleanly. 

Next, cancel the ssh tunnel on your workstation terminal wity CTL-C.

Lastly, from any login or development host:

`scancel jobid` where jobid is the number of your job.


### How to use with srun

This example shows how to start an RStudio server with srun. We will use the same values for number of cpus, memory, time, and scratch as the prior example. To start the interactive srun job on a login or development node type:
`srun --pty --mem 16g --ntasks 4 -t 0-08:00 /usr/bin/bash`

It takes a bit for the allocation to happen and the job to start. You should see something similar to:
```
[alice@c4-dev3 ~]$ srun --pty --mem 16g --ntasks 4 -t 0-08:00 /usr/bin/bash
srun: job 417808 queued and waiting for resources
srun: job 417808 has been allocated resources
[alice@c4-n3:job=417808 ~]$ 
```

Notice that last prompt shows that we have invoked an interactive bash shell on a compute node with the specified resources. Now that we have the interactive shell, simply type:

`module load CBI rstudio-server-controller`

Once the module loads:
`rsc start --port=random`

Wait a bit and you should see output similar to:
```
alice, your personal RStudio Server is available on <http://c4-n3:48216>. If you are running from a remote machine without direct access to c4-n3, you can use SSH port forwarding to access the RStudio Server at <http://127.0.0.1:8787> by running 'ssh -J hputnam@<login-machine> -L 8787:c4-n3:48216 c4-n3' in a second terminal. Any R session started times out after being idle for 480 minutes.
```

You can now follow these tunnel directions to set up your RStudio session on your workstation browser.

**Cleanly stop the job**

To exit the RStudio session cleanly, press the "power" button in the top right corner of the browser session. Failure to do so will result in an warning next time you use RStudio that things did not end cleanly. 

Next, cancel the ssh tunnel on your workstation terminal wity CTL-C.

Lastly, return to your interactive shell that was instantiateed with srun. CTL-C out of the rsc shell. Then `rsc stop` to cleanly stop your rsc session. Last step is to type `exit` or CTL-D to close the interactive shell. This allows SLURM to clear up the requested resources for other users.
# Work with Rstudio Server

We have a module in the CBI software stack designed to run rstudio server as a per user SLURM job. We can use OnDemand (preferred), sbatch, or srun for this. 

For OnDemand we use a simple web form to launch the job.

For sbatch and srun this is a two step process. Step1 is getting the job submitted and started on C4. Step2 is setting up an ssh tunnel back to your work station so you can access RStudio from your browser. This allows you to use RStudio in a familiar way while unlocking the compute resources on C4.

Additional reading:

- Software modules: <a href="https://www.c4.ucsf.edu/software/software-modules.html">C4 Software Modules</a>
- rstudio-server-controller: <a href="https://github.com/UCSF-CBI/rstudio-server-controller">rstudio-server-controller</a>

## How to use with OnDemand

- From your workstation, connect to OnDemand at: <a href="https://c4-ondemand1.ucsf.edu">OnDemand</a>
- Enter your C4 username and password. Click the Login button.
- Navigate to Interactive Apps --> RStudio Server
- Click the Rstudio Server link
- You next get a form with some fields we need to fill in for SLURM. Details:

**Account** - Your "billing" account with SLURM. If you don't know this, you can get it from any C4 host with `sacctmgr show user | grep $USER` The account is in the second field.

**Partition** - If you have a Lab partition you may enter it here. Otherwise enter common. Equivalent to --partition in sbatch.

**Number of hours** - Number of hours the job may run. Equivalent to --time in sbatch.

**Memory** - Amount of RAM to request in GB. Equivalent to --mem in sbatch.

**Number of Cores** - Number of CPU threads to request. Equivalent to --ntasks in sbatch.

**Scratch Space** - Amount of local /scratch space for the job. Equivalent to --gres=scratch:10g (for a 10 GB ask)


- Once the form fields are filled in, click the Launch button.

The job takes a minute or so to get started on the cluster. Once the job has launched, you will see a button labeled "Connect to RStudio Server". Click this button and a new browser tab will open with the familiar RStudio login screen. Use your C4 username and password for this.

You should now be running an interactive RStudio session on a compute node. 

<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
Inportant things to know.
</div>

- Using OnDemand to launch RStudio will always use the default module for r and rstudio-server-controller in our <a href="https://www.c4.ucsf.edu/software/software-modules.html">CBI Software Stack</a>
- Any packages installed via RStudio launched this way are stored in your $HOME directory so they will be available *for the same version of r* from the CLI version of r in our software stack.
- Currently, we are limiting run time to 24 hours for one of these jobs.


## How to use with sbatch

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

You submit the above, on a login or development node, with `sbatch rstudio.sh`

Once submitted, cat the job output file (in our case, rstudio-server.job.JOBID) for instructions about how to set up the ssh tunnel. You will see something *similar* to this:
```sh
alice, your personal RStudio Server is available on <http://c4-n12:34981>. If you are running from a remote machine without direct access to c4-n12, you can use SSH port forwarding to access the RStudio Server at <http://127.0.0.1:8787> by running 'ssh -J alice@<login-machine> -L 8787:c4-n12:34981 c4-n12' in a second terminal. Any R session started times out after being idle for 480 minutes.
```
You can now set up the tunnel to your workstation and open a browser with url http://localhost:34981.  Please note, we are asking for a random port on the compute node so the port number will be *different* each time we run this job.

### Cleanly stop the job

To exit the RStudio session cleanly, press the "power" button in the top right corner of the browser session. Failure to do so will result in an warning next time you use RStudio that things did not end cleanly. 

Next, cancel the ssh tunnel on your workstation terminal with Ctrl-C.

Lastly, from any login or development host:

`scancel jobid` where jobid is the number of your job.


## How to use with srun

This example shows how to start an RStudio server with srun. We will use the same values for number of cpus, memory, time, and scratch as the prior example. To start the interactive srun job on a login or development node type:
`srun --pty --mem 16g --ntasks 4 -t 0-08:00 /usr/bin/bash`

It takes a bit for the allocation to happen and the job to start. You should see something similar to:
```sh
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
```sh
alice, your personal RStudio Server is available on <http://c4-n3:48216>. If you are running from a remote machine without direct access to c4-n3, you can use SSH port forwarding to access the RStudio Server at <http://127.0.0.1:8787> by running 'ssh -J hputnam@<login-machine> -L 8787:c4-n3:48216 c4-n3' in a second terminal. Any R session started times out after being idle for 480 minutes.
```

You can now follow these tunnel directions to set up your RStudio session on your workstation browser.

### Cleanly stop the job

To exit the RStudio session cleanly, press the "power" button in the top right corner of the browser session. Failure to do so will result in an warning next time you use RStudio that things did not end cleanly. 

Next, cancel the ssh tunnel on your workstation terminal with Ctrl-C.

Lastly, return to your interactive shell that was instantiated with srun. Ctrl-C out of the rsc shell. Then `rsc stop` to cleanly stop your rsc session. Last step is to type `exit` or Ctrl-D to close the interactive shell. This allows SLURM to clear up the requested resources for other users.

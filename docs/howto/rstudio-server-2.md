# Work with RStudio Server

We have a module in the CBI software stack designed to run RStudio Server as a per-user Slurm job. We can use OnDemand (preferred) or an interactive job in the terminal.  For OnDemand we use a simple web form to launch the job.  For an interactive jobs this is a two step process. Step 1 is getting the job submitted and started on C4. Step 2 is setting up an SSH tunnel back to your work station so you can access RStudio from your browser.


## Run RStudio Server via OnDemand

1. From your workstation, connect to OnDemand at: <a href="https://c4-ondemand1.ucsf.edu">OnDemand</a> (accessible only from the UCSF network, including UCSF VPN)

2. Enter your C4 username and password. Click the 'Login' button

3. Navigate to Interactive Apps --> RStudio Server

4. Click the 'RStudio Server' link

5. You will see a form that needs to be filled in. Below is some guidance for the fields:

   - **Partition** - If you have a lab partition you may enter it here. Otherwise enter 'common'. Equivalent to `--partition` in `sbatch`

   - **Number of hours** - Maximum run-time for your RStudio Server job. Equivalent to `--time` in `sbatch`

   - **Memory** - Amount of RAM (in GiB) for the job. Equivalent to `--mem` in `sbatch`

   - **Number of Cores** - Number of CPU cores for the job. Equivalent to `--ntasks` in `sbatch`

   - **Scratch Space** - Amount of local `/scratch` space for the job. Equivalent to `–gres=scratch:10G` (10 GiB)

6. Once the form fields are filled in, click the 'Launch' button. The job takes a minute or so to get started on the cluster.  Once the job has launched, you will see a button labeled 'Connect to RStudio Server'.

7. Click the 'Connect to RStudio Server' button and a new browser tab will open with the familiar RStudio login screen

You are now running an interactive RStudio session on a compute node from your local web browser.


**Important**:

* Using OnDemand to launch RStudio will always use the default versions of R and RStudio Server currently available in our [CBI Software Stack]({{ '/software/software-repositories.html#module-software-repository-cbi' | relative_url }})

* Any packages installed via RStudio launched this way are stored in your `$HOME` directory so they will be available _for the same version of R_ from the CLI version of R in our software stack

* Currently, we are limiting run time to 24 hours for one of these jobs

* To shutdown the RStudio Server, click the 'Delete Session' button


## Run RStudio Server via an interactive job

This example shows how to start an RStudio server via an [interactive job]({{ '/scheduler/interactive-jobs.html' | relative_url }}). We request an interactive session with four CPU cores, 32 GiB of RAM, 20 GiB of local scratch space, and up to eight hours of run-time by:

```sh
[alice@{{ site.login.name }} ~]$ srun --pty --nodes=1 --ntasks=4 --mem=32G --gres=scratch:20G --time=08:00:00 $SHELL
srun: job 417808 queued and waiting for resources
srun: job 417808 has been allocated resources
[alice@c4-n3:job=417808 ~]$ 
```

Notice that last prompt shows that we have invoked an interactive shell on a compute node with the specified resources. Now that we have the interactive shell, do the following to launch your personal RStudio Server instance using the **[rstudio-server-controller]** tool:

```sh
[alice@c4-n3:job=417808 ~]$ module load CBI rstudio-server-controller
[alice@c4-n3:job=417808 ~]$ rsc start
```
After a few moments, you will see:

```sh
alice, your personal RStudio Server is available on <http://c4-n3:48216>. If you are running from a remote
machine without direct access to c4-n3, you can use SSH port forwarding to access the RStudio Server at
<http://127.0.0.1:8787> by running 'ssh -L 8787:c4-n3:48216 alice@<login-machine>' in a second terminal.
Any R session started times out after being idle for 480 minutes.
```

You can now follow these SSH tunnel directions to set up your RStudio session on your workstation browser.


### Cleanly stop the interactive job

To exit the RStudio session cleanly: 

1. In RStudio, press the "power" button in the top right corner of the browser session. Failure to do so will result in an warning next time you use RStudio that things did not end cleanly.

2. Next, cancel the SSH tunnel on your workstation terminal with <kbd>Ctrl-C</kbd>.

3. Next, return to your interactive shell that was instantiated with `srun`. <kbd>Ctrl-C</kbd> out of the `rsc start` command.

4. Last step is to type `exit`, or <kbd>Ctrl-D</kbd>, to close the interactive shell. This allows the job scheduler to clear up the requested resources and make them available to other users.


[rstudio-server-controller]: https://github.com/UCSF-CBI/rstudio-server-controller

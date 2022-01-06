# Work with RStudio Server

We are able to run [RStudio Server] on {{ site.cluster.name }} using Singularity containers. The basic idea is to use a pre-built container from the [Rocker Project], which we instantiate on a compute node via the job scheduler.  We then set up an SSH tunnel between RStudio Server and your endpoint device, e.g. your notebook or workstation. You can then open RStudio in your local web browser and use RStudio Server from there. We have found that this provides much better response time than attempting to run RStudio directly on a compute node and then working directly on that using [X11 forwarding].

<div class="alert alert-danger" role="alert" style="margin-top: 3ex">
<strong>Pleae Note: </strong> We are treating this approach as a beta version. If you are having trouble with this approach, we will do our best to help on a best effort, avaialble time basis. Your mileage may vary.
</div>

<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
<strong>Please do not leave these containers running unattended</strong>. Please only run these containers when you are actively using them. You should save your work and cancel the job when you are done for the day. If we start to see many unused containers eating {{ site.cluster.name }} we will have to re-think this practice. Please also be kind when specifying CPU and memory resources, just ask for what you think is needed.
</div>

## Initial Setup

The following three steps only needs to be done once.

### Build Linux container

For the purpose of this write-up we will be saving Singularity images to `~/singularity-images`. Feel free to use any directory structure you like.

 * Log into a development host
 
 * Pull the container from docker hub:

```sh
[alice@{{ site.devel.name }} ~]$ mkdir -p "$HOME/singularity-images"
[alice@{{ site.devel.name }} ~]$ singularity pull --dir="$HOME/singularity-images" --name=rstudio-server.sif docker://rocker/rstudio
```


### Configure R to have internet access on the compute nodes

The compute nodes do not have direct access to the internet. For this reason we must tell R where to find our proxy server by adding these lines to your personal `~/.Renviron` file :

```plain
http_proxy=http://c4-yum1:3128
https_proxy=http://c4-yum1:3128
```


### Prepare RStudio Server job script

The following is an example of a Slurm job script to instantiate the container. The script does the following:

1. create and bind some local folders in `$HOME` for RStudio to save state, etc.
2. provide RStudio Server with a randomized listen port
3. set a randomized password for RStudio Server
4. print instructions for setting up the SSH tunnel

This script was written by our friends at the Rocker project ([rocker tutorial]) and lightly modified for {{ site.cluster.name }}.

<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
Note: For newer version of the Rocker container, we must add the <code>--server-user="$USER"</code>. Older versions of the container did not have that option.
</div>


```sh
#!/bin/bash
#SBATCH --time=08:00:00
#SBATCH --ntasks=2
#SBATCH --mem=8192
#SBATCH --output=rstudio-server.%j
#SBATCH --export=NONE
# customize --output path as appropriate (to a directory readable only by the user!)

# Create temporary directory to be populated with directories to bind-mount in the container
# where writable file systems are necessary. Adjust path as appropriate for your computing environment.
workdir=$HOME/rstudio-server

mkdir -p -m 700 ${workdir}/run ${workdir}/tmp ${workdir}/var/lib/rstudio-server
cat > ${workdir}/database.conf <<END
provider=sqlite
directory=/var/lib/rstudio-server
END

# Set OMP_NUM_THREADS to prevent OpenBLAS (and any other OpenMP-enhanced
# libraries used by R) from spawning more threads than the number of processors
# allocated to the job.
#
# Set R_LIBS_USER to a path specific to Rocker/RStudio to avoid conflicts with
# personal libraries from any R installation in the host environment

cat > ${workdir}/rsession.sh <<END
#!/bin/sh
export OMP_NUM_THREADS=${SLURM_JOB_CPUS_PER_NODE}
export R_LIBS_USER=${HOME}/R/rocker-rstudio/4.0
exec rsession "\${@}"
END

chmod +x ${workdir}/rsession.sh

export SINGULARITY_BIND="${workdir}/run:/run,${workdir}/tmp:/tmp,${workdir}/database.conf:/etc/rstudio/database.conf,${workdir}/rsession.sh:/etc/rstudio/rsession.sh,${workdir}/var/lib/rstudio-server:/var/lib/rstudio-server"

# Do not suspend idle sessions.
# Alternative to setting session-timeout-minutes=0 in /etc/rstudio/rsession.conf
# https://github.com/rstudio/rstudio/blob/v1.4.1106/src/cpp/server/ServerSessionManager.cpp#L126
export SINGULARITYENV_RSTUDIO_SESSION_TIMEOUT=0

export SINGULARITYENV_USER=$(id -un)
export SINGULARITYENV_PASSWORD=$(openssl rand -base64 15)
# Get unused socket per https://unix.stackexchange.com/a/132524
# Tiny race condition between the python & singularity commands
readonly PORT=$(python -c 'import socket; s=socket.socket(); s.bind(("", 0)); print(s.getsockname()[1]); s.close()')
cat 1>&2 <<END

A new instance of the RStudio Server was just launched. To access it,

1. SSH tunnel from your workstation using the following command from a terminal on your local workstation:

   ssh -N -L 8787:${HOSTNAME}:${PORT} ${SINGULARITYENV_USER}@c4-log2

   and point your local web browser to <http://localhost:8787>

2. Log in to RStudio Server using the following credentials:

   user: ${SINGULARITYENV_USER}
   password: ${SINGULARITYENV_PASSWORD}


When done, make sure to terminate everything by:

1. Exit the RStudio Session ("power" button in the top right corner of the RStudio window)

2. Cancel the job by issuing the following command on the login node:

      scancel -f ${SLURM_JOB_ID}
      
END

singularity exec "$HOME/singularity-images/rstudio-server.sif" \
    rserver --www-port "$PORT" \
            --auth-none=0 \
            --auth-pam-helper-path=pam-helper \
            --auth-stay-signed-in-days=30 \
            --auth-timeout-minutes=0 \
            --rsession-path=/etc/rstudio/rsession.sh \
            --server-user="$USER"
printf 'RStudio Server exited\n' 1>&2
```


## Running as a job

To run the container simply submit above `rstudio-server.sh` script to the scheduler, e.g.

```sh
[alice@{{ site.devel.name }} ~]$ sbatch rstudio-server.sh
Submitted batch job 203779
```

Make a note of the job ID, locate the job log file for instructions on how to access the newly launched RStudio Server instance, e.g.

```sh
[alice@{{ site.devel.name }} ~]$ cat rstudio-server.203779

A new instance of the RStudio Server was just launched. To access it,

1. SSH tunnel from your workstation using the following command:

   ssh -N -L 8787:c4-n12:39174 alice@c4-log2

   and point your local web browser to <http://localhost:8787>

2. Log in to RStudio Server using the following credentials:

   user: alice
   password: ZUNQtyuIH8rSu8nIfJFm


When done, make sure to terminate everything by:

1. Exit the RStudio Session ("power" button in the top right corner of the RStudio window)

2. Cancel the job by issuing the following command on the login node:

   scancel -f 203779

```

The SSH tunnel command has to run on your workstation, not the cluster. You can use either login host for this command.

Make sure to quit the browser and then use `scancel` to cancel the job. If you do that, then state is saved in your {{ site.cluster.name }} home directory under `~/rstudio-server`. The next time you start a new copy of the Linux container, RStudio Server will remember all the variables, open files, etc., similarly to how it works in the RStudio Desktop version.


[X11 forwarding]: {{ '/howto/gui-x11fwd.html' | relative_url }}
[RStudio Server]: https://www.rstudio.com/products/rstudio/#rstudio-server
[Rocker Project]: https://www.rocker-project.org/
[rocker tutorial]: https://www.rocker-project.org/use/singularity/

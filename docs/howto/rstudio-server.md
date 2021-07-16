# Work with Rstudio Server

We are able to run Rstudio server on {{ site.cluster.name }} by levereging Singularity. The basic idea is to use a pre-built container from the Rocker project which we instantiate on a compute node via SBATCH. We then set up and ssh tunnel between Rstudio server and your endpoint device (laptop or workstation). You can then open rstudio in your local browser and use normally. We have found that this provides much better response time than attempting to run Rstudio directly on a comute node and then working directly on that using X forwarding.

<div class="alert alert-danger" role="alert" style="margin-top: 3ex">
<strong>Pleae Note: </strong>. We are treating this approach as a BETA version. If you are having trouble with this approach, we will do our best to help on a best effort, avaialble time basis. Your mileage may vary.
</div>

<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
<strong>Please do not leave these containers running unattended</strong>. Please only run these containers when you are actively using them. You should save your work and cancel the job when you are done for the day. If we start to see many unused containers eating {{ site.cluster.name }} we will have to re-think this practice. Please also be kind when specifying CPU and memory resources, just ask for what you think is needed.
</div>

## Initial Setup - Container Pull

For the purpose of this write-up we will be saving Singularity images to $HOME/singularity-images. Feel free to use any directory structure you like.

- Log into a development host.
- Pull the container from docker hub:

```sh
[alice@{{ site.devel.name }} ~]$ singularity pull --dir ${HOME}/singularity-images --name rstudio-server.sif docker://rocker/rstudio
```

## Intial Setup - sbatch submission script.

The following is an example of an sbatch script to instantiate the container. The script does the following:

- create & bind some local folders in $HOME for rstudio to save state, etc.
- provide rstudio server with a randomized listen port
- set a randomized password for rstudio server
- print instructions for setting up the ssh tunnel. 

This script was written by our friends at the Rocker project (<a> href="https://www.rocker-project.org/use/singularity/">rocker tutorial</a>) and lightly modified for {{ site.cluster.name }}.

```sh
#!/bin/bash
#SBATCH --time=08:00:00
#SBATCH --ntasks=2
#SBATCH --mem=8192
#SBATCH --output=rstudio-server.job.%j
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
# Set R_LIBS_USER to a path specific to rocker/rstudio to avoid conflicts with
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
# get unused socket per https://unix.stackexchange.com/a/132524
# tiny race condition between the python & singularity commands
readonly PORT=$(python -c 'import socket; s=socket.socket(); s.bind(("", 0)); print(s.getsockname()[1]); s.close()')
cat 1>&2 <<END
1. SSH tunnel from your workstation using the following command from a terminal on your local workstation:

   ssh -N -L 8787:${HOSTNAME}:${PORT} ${SINGULARITYENV_USER}@c4-log2

   and point your web browser to http://localhost:8787

2. log in to RStudio Server using the following credentials:

   user: ${SINGULARITYENV_USER}
   password: ${SINGULARITYENV_PASSWORD}

When done using RStudio Server, terminate the job by:

1. Exit the RStudio Session ("power" button in the top right corner of the RStudio window)
2. Issue the following command on the login node:

      scancel -f ${SLURM_JOB_ID}
END

singularity exec  $HOME/singularity-images/rstudio-server.sif \
    rserver --www-port ${PORT} \
            --auth-none=0 \
            --auth-pam-helper-path=pam-helper \
            --auth-stay-signed-in-days=30 \
            --auth-timeout-minutes=0 \
            --rsession-path=/etc/rstudio/rsession.sh
printf 'rserver exited' 1>&2
```


## Running as a job

To run the container simply submit rocker.bash `sbatch rocker.bash`. Make note of the jobid and then find the job log and cat it out to view the instructions.

```sh
[alice@{{ site.devel.name }} ~]$ sbatch rocker.bash
Submitted batch job 203779
```

```sh
[alice@{{ site.devel.name }} ~]$ cat rstudio-server.job.203779
1. SSH tunnel from your workstation using the following command:

   ssh -N -L 8787:c4-n12:39174 hputnam@c4-log2

   and point your web browser to http://localhost:8787

2. log in to RStudio Server using the following credentials:

   user: alice
   password: myrand0password

When done using RStudio Server, terminate the job by:

1. Exit the RStudio Session ("power" button in the top right corner of the RStudio window)
2. Issue the following command on the login node:

      scancel -f 203779

```

These instructions are fairly clear. TH ssh tunnel command has to run on your workstation, not the cluster. You can use either login host for this command. Make suer to quit the browser and then scancel the job. If you do that, then state is saved in your {{ site.cluster.name }} $HOME directory under $HOME/rstudio-server. The next time you start a new copy of the rocker container, rstudio will remember all the variables, open files, etc. very similar to the desktop version of rstudio.


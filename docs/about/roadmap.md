# Roadmap & Accomplishments

## Alpha-Testing Phase

_Starting September 1, 2020_  

**Who**: In this phase we're inviting self-sufficient, advanced HPC users to try out the C4 cluster and to give constructive feedback.

**What**: We will implement essential features that we missed previously.  We will address feature requests that are straightforward to implement.  More complex feature requests will be saved for later.

**Outcome**: At the end of this phase, we will have a rudimentary HPC environment that will allow advanced users to run scientific jobs.

**What to expect**: All (login, development, and compute) nodes may be rebooted at any time in order to be updated.  We will however try our best to avoid sudden reboots without notifications.


### Scheduler

* [x] Rudimentary Slurm configuration with one shared partition ("queue") and one lab-owned partition.

* [x] Interactive jobs, e.g. `srun --pty bash`

* [x] Job email notification, e.g. `sbatch --export=NONE --mail-type=ALL --mail-user=<email-address> script.sh`

* [x] Torque/PBS wrappers (emulating Torque/PBS on Slurm)

### Software

* [x] Shared CBI software + modules, i.e. `/software/c4/CBI/`

* [ ] Shared software + modules of other labs: `/software/c4/{group}/`

### Documentation and support

* [x] c4-help issue tracker <https://github.com/UCSF-CBI/c4-help>

* [ ] Set up a C4 website with the most basic documentation

* [ ] Tabular overview of the different host types available

### Compute power

* [x] New lab compute nodes:
  - [x] c4-n[6-9]: 4 new lab nodes for the Witte Lab (4*56 = 224 physical cores)

* [x] Addition common nodes:
  - [x] c4-n10 - revived from TIPCC (node n2)
  - [ ] c4-n11 - revived from TIPCC (node n10)

### Storage

* [x] Mount _existing_ TIPCC storage 
   - [x] TIPCC `/home`   - TIPCC home folders (C4 home folders are under `/c4/home`)
   - [x] TIPCC `/backup` - Weekly rsync backup of TIPCC home folders
   - [x] TIPCC `/data`   - TIPCC legacy data folders
   - [x] TIPCC `/work`   - TIPCC global "scratch"

* [ ] Mount _existing_ TIPCC lab storage
   - [x] `/bastianlab/data1`
   - [x] `/bivonalab/data1`
   - [x] `/blellochlab/data1`
   - [x] `/cbc`
   - [x] `/cbc2/data1`
   - [x] `/cbc2/data2`
   - [x] `/cbc2/data3`
   - [x] `/cbc2/teachy`
   - [x] `/costellolab/data1`
   - [x] `/costellolab/data2`
   - [x] `/diazlab/data1`
   - [x] `/diazlab/data2`
   - [x] `/diazlab/data3`
   - [x] `/francislab/data1`
   - [x] `/okadalab/data1`
   - [x] `/okadalab/data2`
   - [x] `/krummellab/data1`
   - [x] `/kriegsteinlab/data1`
   - [x] `/kriegsteinlab/data2`
   - [x] `/sblab`
   - [x] `/wittelab/data1`
   - [x] `/wittelab/data2`
   - [x] `/zivlab/data1`
   - [x] `/zivlab/data2`
   - [x] `/zivlab/data3`

* [ ] Mount _new_ lab storage (not available on TIPCC)
   - [x] `/wittelab/data[3-6]`


### Backup

* [x] Users' home folders are backed up

* [x] Software stacks under `/software` are backed up

### Miscellaneous

* [x] X11 Forwarding on development nodes

* [x] Shells and interactive jobs idle for more than 24 hours are automatically logged out

* [x] All development and compute nodes have the same configuration of local `/tmp` (8 GiB) and local `/scratch` (whatever is available)


## Beta-Testing Phase

**Who**: Invite additional advanced users from other labs.  We are interesting in labs who are willing to migrate the existing TIPCC compute nodes over to C4, e.g. labs will a single compute node

**What**: Feature requests that were too complex for the alpha-testing phase will addressed.

**Outcome**: At the end of this phase, we will have a solid HPC environment that will allow the majority of users to run scientific jobs on C4 that they previously ran on TIPCC.  We are confident that we can go forward with inviting all TIPCC users.

**What to expect**: Avoid running multi-day jobs on the scheduler because compute nodes may need to be taken offline and rebooted as soon as possible, even if it requires terminating running jobs.  Login, data-transfer, and development nodes will be rebooted after asking all users to logged out.


### Scheduler

* [ ] Finalize basic configuration allowing users to submit as much as they want without starving out other users

* [ ] Add more lab-specific partitions

* [ ] All jobs are running through cgroup

### Documentation and support

* [ ] c4-announce mailing list

* [ ] Slurm well documented + Torque-to-Slurm translation table

* [ ] Common TIPCC-to-C4 migration issues and conflicts documented

### Software

* [ ] Some more EPEL package requests (probably not much)

* [ ] MATLAB using UCSF site-wide licenses

### Accounts

* [ ] Password aging

* [x] Set up LDAP for account management

<!---### Storage

* [ ] Mount more _existing_ lab storage on TIPCC also on C4 -->

### Miscellaneous

* [ ] Expand existing Bash configuration to Csh


## Going Live

**Prerequisites**: We know everything works fine. No going back

**Who**: All TIPCC user are welcome to start using C4

**What to expect**: The cluster can be considered fairly stable. However, there might be needs for further updates requiring reboots and early-termination of jobs.  Avoid running jobs longer than 3-4 days.


### Accounts

* [ ] Users that migrate are added to LDAP.  Changes in LDAP will manually be mirrored on TIPCC

* [ ] Only allow active accounts with up-to-date contact information (and keeping it up-to-date)

### Software

* [ ] Very old, legacy scientific software on TIPCC will be re-installed on C4 if requested

### Miscellaneous

* [x] [Globus] endpoint on C4 for fast file transfers to and from participating organization



## Migration

**Who**: All remaining TIPCC users who are not yet on C4

### Accounts

* [ ] All TIPCC users should start migration to C4

### Software

* [ ] We will attempt to accommodate legacy-software needs as far as possible



## TIPCC deprecation

* [ ] TIPCC is kept on life support only!

* [ ] TIPCC might crash at any time!




## Accomplished milestones

* Storage: Global scratch storage on BeeGFS parallel file system (2020-07-01)

* Login: 2 login nodes (June 2020)

* Development: Added threedevelopment nodes (2020-08-13)

* Compute nodes: 6 communal/common compute nodes (6*32=192 physical cores).

* Software: Replicate the core software that is installed on [Wynton HPC] on development and compute nodes (2020-08-19)

* Software: Added the CBI software stack (2020-08-20)

* Deployment of new machines: Automated deployment.

* Backup: Users' home accounts backed up on a nightly basis.

* Network: 10 Gbps.


See also [News].


[TIPCC]: https://ucsf-ti.github.io/tipcc-web/
[Wynton HPC]: https://wynton.ucsf.edu/hpc/
[BeeGFS]: https://www.beegfs.io/
[Globus]: https://www.globus.org/
[News]: {{ '/about/news.html' | relative_url }}

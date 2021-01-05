<div class="alert alert-warning" role="alert" style="margin-top: 3ex">
<strong><span>⚠️</span> 2020-01-04: This page is work in progress.  Overall it is correct, but details will be soon be updated.  Please make sure to revisit later.</strong>
</div>

# Roadmap & Accomplishments

## Alpha-Testing Phase

_Starting September 1, 2020_  

**Who**: In this phase we're inviting self-sufficient, advanced HPC users to try out the C4 cluster and to give constructive feedback.

**What**: We will implement essential features that we missed previously.  We will address feature requests that are straightforward to implement.  More complex feature requests will be saved for later.

**Outcome**: At the end of this phase, we will have a rudimentary HPC environment that will allow advanced users to run scientific jobs.

**What to expect**: All (login, development, and compute) nodes may be rebooted at any time in order to be updated.  We will however try our best to avoid sudden reboots without notifications.


### Scheduler

* [x] Rudimentary Slurm configuration with one shared partition ("common") and one lab-owned partition
* [x] Interactive jobs
* [x] Job email notification

### Software

* [x] Shared CBI software + modules, i.e. `/software/c4/CBI/`
* [x] Shared software + modules of other labs: `/software/c4/{group}/`

### Documentation and support

* [x] c4-help issue tracker <https://github.com/UCSF-CBI/c4-help>

### Compute power

* [x] New lab compute nodes:
  - [x] c4-n[6-9]: 4 new lab nodes for the Witte Lab (4*56 = 224 physical cores)

* [x] Additional common nodes:
  - [x] c4-n10 - revived from TIPCC (node n2)

### Storage

* [x] Mount _existing_ TIPCC storage 
   - [x] TIPCC `/home`   - TIPCC home folders (C4 home folders are under `/c4/home`)
   - [x] TIPCC `/backup` - Weekly rsync backup of TIPCC home folders
   - [x] TIPCC `/data`   - TIPCC legacy data folders
   - [x] TIPCC `/work`   - TIPCC legacy global "scratch" (use `/c4/scratch` instead)

* [x] Mount _existing_ TIPCC lab storage
   - `/bastianlab/data1`, `/bivonalab/data1`, `/blellochlab/data1`, `/cbc`, `/cbc2/{data1,data2,data3,teachy}`, `/costellolab/{data1,data2}`, `/diazlab/{data1,data2,data3}`, `/francislab/data1`, `/okadalab/{data1,data2}`, `/krummellab/data1`, `/kriegsteinlab/{data1,data2}`, `/sblab`, `/wittelab/{data1,data2}`, `/zivlab/{data1,data2,data3}`
   
* [x] Mount _new_ lab storage (not available on TIPCC)
   - [x] `/wittelab/data[3-6]`


### Backup

* [x] Users' home folders are backed up
* [x] Software stacks under `/software` are backed up

### Miscellaneous

* [x] X11 Forwarding on development nodes
* [x] Shells and interactive jobs idle for more than 24 hours are automatically logged out
* [x] All development and compute nodes have the same configuration of local `/tmp` (8 GiB) and local `/scratch` (whatever is available)


## Beta-Testing Phase

_Starting December 1, 2020_  

**Who**: Invite additional advanced users from other labs.  We are interesting in labs who are willing to migrate the existing TIPCC compute nodes over to C4, e.g. labs will a single compute node

**What**: Feature requests that were too complex for the alpha-testing phase will addressed.

**Outcome**: At the end of this phase, we will have a solid HPC environment that will allow the majority of users to run scientific jobs on C4 that they previously ran on TIPCC.  We are confident that we can go forward with inviting all TIPCC users.

**What to expect**: Avoid running multi-day jobs on the scheduler because compute nodes may need to be taken offline and rebooted as soon as possible, even if it requires terminating running jobs.  Login, data-transfer, and development nodes will be rebooted after asking all users to logged out.


### Scheduler

* [x] All jobs are running through cgroup
* [ ] Add more lab-specific partitions
* [ ] Finalize basic configuration allowing users to submit as much as they want without starving out other users

### Documentation and support

* [ ] Set up a C4 website with the most basic documentation
* [ ] c4-announce mailing list
* [ ] Slurm well documented + Torque-to-Slurm translation table
* [ ] Common TIPCC-to-C4 migration issues and conflicts documented

### Software

* [ ] Some more EPEL package requests (probably not much)
* [ ] MATLAB using UCSF site-wide licenses

### Accounts

* [x] Set up LDAP for account management
* [ ] Password aging

### Miscellaneous

* [ ] Expand existing Bash configuration to Csh

### Compute power

* [ ] Additional common nodes:
  - [ ] c4-n11 - revived from TIPCC (node n10)

* [ ] Additional lab nodes:
  - [ ] c4-n?? - CBI TIPCC nodes (nodes n0 and n17)


## Going Live

_Starting January 11, 2020_  

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
* Development: Added three development nodes (2020-08-13)
* Compute nodes: 6 communal/common compute nodes (6*32=192 physical cores)
* Software: Replicate the core software that is installed on [Wynton HPC] on development and compute nodes (2020-08-19)
* Software: Added the CBI software stack (2020-08-20)
* Deployment of new machines: Automated deployment
* Backup: Users' home folders backed up on a nightly basis
* Network: 10 Gbps
* File transfers: Globus is supported (2020-11-02)
* Account management: All accounts and authentication is done via LDAP (2020-12-16)


See also [News].


[TIPCC]: https://ucsf-ti.github.io/tipcc-web/
[Wynton HPC]: https://wynton.ucsf.edu/hpc/
[BeeGFS]: https://www.beegfs.io/
[Globus]: https://www.globus.org/
[News]: {{ '/about/news.html' | relative_url }}

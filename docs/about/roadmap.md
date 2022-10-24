# Roadmap & Accomplishments

## Improvements

* [ ] Simplify staging of data folders on network file systems to the much faster local drives



## Accomplished milestones

### Initial setup (until 2020-08-31)

* Storage: Global scratch storage on BeeGFS parallel file system (2020-07-01)
* Development: Added three development nodes (2020-08-13)
* Software: Replicate the core software that is installed on [Wynton HPC] on development and compute nodes (2020-08-19)
* Software: Added the CBI software stack (2020-08-20)
* Miscellaneous: Hosts can now send email notifications (2020-08-21)
* Login: Two login nodes with DNS records (2020-08-26)
* Deployment: Automated deployment of new hosts using Ansible (2020-08-31)
* Compute nodes: Five working communal compute nodes (192 physical cores each) (2020-08-31)


### Alpha testing (2020-09-01 -- 2020-11-31)

**Goal**: We will implement essential features that we missed previously.  We will address feature requests that are straightforward to implement.  More complex feature requests will be saved for later. At the end of this phase, we will have a rudimentary HPC environment that will allow advanced users to run scientific jobs.

**Expectation**: All (login, development, and compute) nodes may be rebooted at any time in order to be updated.  We will however try our best to avoid sudden reboots without notifications.  

* C4 help user issue tracker (2020-09-01)
* Lab compute nodes: 3 new lab-specific compute nodes (2020-09-10)
* Software: Standard for installing and sharing software across labs under `/software` (2020-09-10)
* GUI: X11 forwarding enabled (2020-09-14)
* Software: Core CentOS software is automatically updated on a regular basis (2020-09-15)
* Compute nodes: Added a sixth communal compute nodes (192 physical cores) (2020-09-17)
* Backup: Users' `/c4/home` folders and `/software` backed up on a nightly basis (2020-09-22)
* Shells: Shells idle for more 24 hours are automatically logged out (2020-09-24)
* Network: 10 Gbps
* Scheduler: All jobs run with cgroups-limited memory and core allocations (2020-10-01)
* Storage: Legacy TIPCC storage `/data` and `/work` mounted on C4 (2020-10-27)
* Scheduler: Job-specific `TMPDIR` on `/scratch` automatically deleted afterward (2020-10-30)
* Scratch storage: Old files on local `/tmp`, local `/scratch`, and global `/c4/scratch` are automatically cleaned out (2020-11-02)
* File transfers: Globus is supported (2020-11-02)
* Lab storage: All lab storage on TIPCC is now also mounted on C4 (2020-11-03)


### Beta testing (2020-12-01 -- 2021-01-11)

**Goal**: At the end of this phase, we will have a solid HPC environment that will allow the majority of users to run scientific jobs on C4 that they previously ran on TIPCC.  We are confident that we can go forward with inviting all TIPCC users.

**Expectation**: Avoid running multi-day jobs on the scheduler because compute nodes may need to be taken offline and rebooted as soon as possible, even if it requires terminating running jobs.  Login, data-transfer, and development nodes will be rebooted after asking all users to logged out.

* Account management: All accounts and authentication is done via LDAP (2020-12-16)
* Scheduler: Default Slurm partitions configured (2021-01-07)
* Scheduler: Default email address for job notifications (2021-01-11)
* Compute nodes: Added one communal compute node (12 physical cores each) from TIPCC (2021-01-08)
* Lab compute nodes: Added two lab compute nodes (64 physical cores each) from TIPCC (2021-01-08)
* Documentation: A fully validated website for the C4 environment (2020-01-08)
* Scheduler: Prevent starvation by limiting the number of concurrent cores a single users can run concurrently (2020-01-11)


### Going-Live Phase (2021-01-11 -- 2021-10-31)

**Period**: Starting 2021-01-11

**Prerequisites**: We know everything works fine - no going back

**Who**: All TIPCC users are welcome to start using C4

**Expectation**: The cluster can be considered fairly stable. However, there might be needs for further updates requiring reboots and early-termination of jobs.  **Avoid running jobs longer than 3-4 days**.

* Scheduler: Slurm option for requesting local `/scratch` space
* ~~Scheduler: Slurm option for requesting GPUs~~ [our GPUs from TIPCC are too old]
* Scheduler: Refine job and queuing rules on common and lab-specific compute nodes
  * Weighted node prioritization based on performance: Jobs are sent to faster compute nodes before the slower ones are considered
* Compute nodes: Migrate several TIPCC lab nodes to C4
* Accounts: Password aging
* Software: Some more EPEL package requests (probably not much)
* Software: Very old, legacy scientific software on TIPCC will be re-installed on C4 if requested
* Software: MATLAB using UCSF site-wide licenses
* Software: Validated that nearly all 23,000+ R packages on CRAN and Bioconductor can be installed on the cluster
* ~~Documentation: Torque-to-Slurm translation table~~ [wasn't really necessary to host ourselves]
* Documentation: Common TIPCC-to-C4 migration issues and conflicts documented
* Support: ~~c4-announce mailing list~~ [still using the TIPCC mailing list]


### Shutting down TIPCC (2021-11-01)

**Period**: During Spring to Fall 2021.

**Goal** Bring down any dependencies on TIPCC to a minimum to the point where we can shutdown TIPCC forever.

**Expectation** TIPCC is kept on life support only! TIPCC might crash at any time!

* All TIPCC users should migrate to C4
* We will attempt to accommodate legacy-software needs as far as possible
* Job scheduler end-of-life support no longer than 2022-01-16 (Moab license expiration date)
* Access to TIPCC disabled on 2021-11-01


### Continued improvements to C4

* Add OnDemand - support for running RStudio, Jupyter Hub, and other GUIs interactively via a web-based interface


See also [News].

[TIPCC]: https://ucsf-ti.github.io/tipcc-web/
[Wynton HPC]: https://wynton.ucsf.edu/hpc/
[BeeGFS]: https://www.beegfs.io/
[Globus]: https://www.globus.org/
[News]: {{ '/about/news.html' | relative_url }}

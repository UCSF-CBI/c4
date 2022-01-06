# Storage and Backup Policies

## Storage

With your {{ site.cluster.name }} cluster account, you get 1 TiB free storage on your home directory. 

In addition to the 1 TiB home directory, we provide both global (`/c4/scratch`) and local (`/scratch`) scratch space free of charge. These are temporary storage areas for working data sets used by active work. Files on global scratch are deleted after they reach 14 days of age. Files on local scratch are deleted when the job completes.

For permanent lab storage, many of our labs have invested in storage servers. We are able to wire these to the cluster for convenient access. Please see your friendly neighborhood sysadmin for more details: [**{{ site.cluster.email_admin }}**](mailto:{{ site.cluster.email_admin }})


## Backups

### Home directory

Your home directory (`$HOME`) is backed up to tape nightly and we have a weekly rsync job for self-service restores. To restore files from the weekly rsync backups, see ['Home Directory Backups'].
Please remember that it is the user's responsibility to make sure important data is backed up elsewhere. We do our best to back up your home directory but we have neither have the budget nor the personnel to run a full-blown backup & recovery infrastructure. Tape media failures and site failures can, and do, happen.

### Lab Storage

In general, you must make arrangements to back up your permanent lab storage as needed. Many Labs have purchased NAS devices for this purpose. NAS devices do not necessarily protect against ransomware if the NAS itself is compromised. UCSF IT offers immutable backup services, which do guard against ransomware. More information may be found at [UCSF Backup Services].


['Home Directory Backups']: {{ '/howto/file-restores.html' | relative_url }}
[UCSF Backup Services]: https://it.ucsf.edu/service/backup-services

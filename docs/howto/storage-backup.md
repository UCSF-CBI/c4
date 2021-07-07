# Storage and Backup Policies

## Storage

With your {{ site.cluster.name }} cluster account, you get 1TB free storage on your $HOME directory. 

In addition to the 1TB $HOME directory, we provide both global (`/c4/scratch`) and local (`/scratch`) scratch space free of charge. These are temporary storage areas for working data sets used by active work. Files on global scratch are deleted after they reach 14 days of age. Files on local scratch are deleted when the job completes.

For permanent Lab storage many of our Labs have invested in storage servers. We are able to wire these to the cluster for convenient access. Please see you friendly neighborhood sysadmin for more details: [**{{ site.cluster.email_admin }}**](mailto:{{ site.cluster.email_admin }})


## Backups

### $HOME

Your $HOME directory is backed up to tape nightly and we have a weekly rsync job for self-service restores. Instructions for self-service restores may be found [here]({{ '/how-to/file-restores.html' | relative_url }}). 

### Lab Storage

In general, you must make arrangements to back up your permanent lab storage as needed. Many Labs have purchased NAS devices for this purpose. NAS devices do not necessarily protect against ransomware if the NAS itself is compromised. UCSF IT offers immutable backup services (which do guard against ransomware). More information may be found [here]({{ https://it.ucsf.edu/service/backup-services }}).



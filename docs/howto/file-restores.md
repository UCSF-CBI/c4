---
context:
  - login
---

# HOME Directory Backups

We take two types of backups of the /c4/home directory. Nightly backups to tape and weekly rsync backups to the `/c4/backup/home` folder.


## Self service restores using the weekly backup

The rsync backup runs weekly on Sundays beginning at 11PM every Saturday.

Simply change directories to `/c4/backup/home/$USER` and locate the file you need. You may then copy it to $HOME.


## Tape backup restores (upon request)

Tape restores have to be done by the Systems Administrator in person. For that reason it can take up to five business days to process a restore request.

Please contact [**{{ site.cluster.email_admin }}**](mailto:{{ site.cluster.email_admin }}) to request a restore.

# Frequently Asked Questions (FAQs)

## Jobs

**Q**. _I submitted a job - why is it not running?_

**A**. There could be several reason why your job is not running:

The `squeue -l -u $USER` command will list all the jobs currently running or waiting to run. The last output field will display a REASON code which will give you some hints. For explanation of these see the REASON CODE section of the squeue man page.

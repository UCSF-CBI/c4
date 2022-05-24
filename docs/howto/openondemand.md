# Open OnDemand

Open OnDemand is a web based framework with easy to use GUI interfaces for common cluster tasks. It's other major use is for enabling interactive software such as RStudio and Jupyter Notebooks via the same easy to use GUI interfaces.
Open OnDemand was developed at the Ohio Supercomputer Center. We have integrated this framework into C4. The primary use case for us was enabling easy to use RStudio and Jupyter based on user input. 

Additional reading:

- <a href="https://openondemand.org/">Open OnDemand</a>

## How to use OnDemand

1. As with the rest of C4, you must be on Campus or connected via UCSF IT VPN to use.

2. From your workstation, connect to OnDemand at: <a href="https://c4-ondemand1.ucsf.edu">OnDemand</a>

3. Enter your C4 username and password. Click the Login button.

### Open OnDemand Menus

From left to right:

The Open OnDemand link takes you to the home screen.

Click the **Files** menu 

1. Currently this is set up to access $HOME directories only. Click the Home Directory link.

2. The buttons are fairly self-explanatory here.

Click the **Jobs** menu.

1. The Job Composer is untested as of this writing. Click the Active Jobs link.

2. This screen will show running or recently completed jobs owned by you. This is equivalent to squeue for just your user.

Now the meat of the product. Click the **Interactive Apps** menu. We see three apps currently on offer: C4 Desktop, RStudio, and Jupyter Notebooks. OnDemand runs these apps as sbatch jobs on the cluster. As with any cluster job, we must specify the amount of time, the partition, number of threads, and amount of RAM. Some apps require an amount of `/scratch` space as well. These resources are requested by filling in the appropriate fields on each of the associated web forms. 


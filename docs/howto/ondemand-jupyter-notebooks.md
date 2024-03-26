# Work with Jupyter Notebooks

Jupyter notebooks is accessible via <a href="https://c4-ondemand1.ucsf.edu">OnDemand</a>. The Jupyter Notebook app is run from a Python 3.8 Virtual Environment.


## How to run an interactive Jupyter Notebook session

1. From your workstation, connect to OnDemand at: <a href="https://c4-ondemand1.ucsf.edu">OnDemand</a>

2. Enter your C4 username and password. Click the Login button.

3. Navigate to Interactive Apps --> Jupyter Notebook - Python38

4. You will see a form that needs to be filled in. Below is some guidance for the fields:

   - **Partition** - If you have a Lab partition you may enter it here. Otherwise enter common. Equivalent to `--partition` in `sbatch`.

   - **Number of hours** - Number of hours the job may run. Equivalent to `--time` in `sbatch`.

   - **Memory** - Amount of RAM to request in GiB. Equivalent to `--mem` in `sbatch`.

   - **Number of Cores** - Number of CPU threads to request. Equivalent to `--ntasks` in `sbatch`.

   - **Scratch Space** - Amount of local /scratch space for the job. Equivalent to `–gres=scratch:10G` (10 GiB)

5. Once the form fields are filled in, click the Launch button. The job takes a minute or so to get started on the cluster. Once the job has launched, you will see a button labeled "Connect to Jupyter". 

6. Click the Connect to Jupyter button and a new browser tab will open with the familiar Jupyter screen.

7. The initial screen shows files in your $HOME directory. You can either open an existing notebook file here, or create a new one.

You are now running an interactive Jupyter Notebook session on a compute node. 

<div class="alert alert-warning" role="alert" style="margin-top: 3ex" markdown="1">
Inportant things to know.
</div><img>

- This Jupyter app is using Python38 from a centralized software area.
- Currently, we are limiting run time to 24 hours for one of these jobs.

### Cleanly stop the job

To exit the Jupyter session cleanly: 

1. Save your work and press the "Quit" button in the top right corner of the browser session. This is actually all you need to do to stop the Jupyter server and return the resources back to C4 for others. 

# Work With MATLAB

MATLAB is available on {{ site.cluster.name }} via a built-in  [environmental module]({{ '/software/software-modules.html' | relative_url }}).


## Instructions for accessing MATLAB

To load the module for MATLAB `module load matlab`. 

To start an interactive MATLAB session `matlab -nosplash -nodesktop`

## Example

```sh
[alice@{{ site.devel.name }} ~]$ module load matlab
[alice@{{ site.devel.name }} ~]$ matlab -nosplash -nodesktop
MATLAB is selecting SOFTWARE OPENGL rendering.


                          < M A T L A B (R) >
                Copyright 1984-2024 The MathWorks, Inc.
           R2024a Update 5 (24.1.0.2653294) 64-bit (glnxa64)
                             June 24, 2024

 
To get started, type doc.
For product information, visit www.mathworks.com.
 

>> 1+2

ans =

     3

>> quit

```

If you forget to load the MATLAB module, then you will get an error when attempting to start MATLAB:

```sh
[alice@{{ site.devel.name }} ~]$ matlab
-bash: matlab: command not found
```

### Using MATLAB in job scripts

In order to run MATLAB in jobs, the MATLAB environment module needs to be loaded just as when you run it interactive on a development node. For example, to run the my_script.m script, the job script should at a minimum contain:

```sh
#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=100M
#SBATCH --time=00:02:00
#SBATCH --output=%x-%j.out

module load matlab
matlab -batch my_script.m
```

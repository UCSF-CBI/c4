# Work with Open MPI

Both Open MPI 2 and Open MPI 3 are available on development and compute nodes. Either version must be called via the `module` command. The most important thing about using Open MPI is to be sure to invoke the same Open MPI version with module that was used to compile the MPI code. In other words, if you compiled a program with mpicc using Open MPI 2, then you **must** load the Open MPI 2 version when you invoke the program with mpirun.


## How to use Open MPI 2

```sh
module load mpi/openmpi-x86_64
mpirun name_of_program
```

## How to use Open MPI 3

```sh
module load mpi/openmpi3-x86_64
mpirun name_of_program
```



For more information about the module command see [here]


[here]: {{ '/software/software-modules.html' | relative_url }}

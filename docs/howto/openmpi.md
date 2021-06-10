# Work with openmpi

Both openmpi2 and openmpi3 are available on development and compute nodes. Either version must be called via the `module` command. The most important thing about using openmpi is to be sure to invoke the same openmpi version with module that was used to compile the mpi code. In other words, if you compiled a program with mpicc using openmpi2, then you **must** load the openmpi2 version when you invoke the program with mpirun.


## How to use openmpi2

```sh
module load mpi/openmpi-x86_64
mpirun name_of_program
```

## How to use open,pi3

```sh
module load mpi/openmpi3-x86_64
mpirun name_of_program
```

For more information about the module command see [here]


[here]: {{ '/software/software-modules.html' | relative_url }}

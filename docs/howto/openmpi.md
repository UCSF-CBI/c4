# Work with Open MPI

Both Open MPI 2 and Open MPI 3 are available on development and compute nodes. Either version must be called via the `module` command. The most important thing about using Open MPI is to be sure to run with the same Open MPI module version  that was used to compile the MPI code. In other words, if you compiled a program with `mpicc` using Open MPI 2, then you _must_ load the Open MPI 2 version before you invoke the program with `mpirun`.

## Examples

### Running with Open MPI 2

```sh
module load mpi/openmpi-x86_64
mpirun name_of_program
```

### Running with Open MPI 3

```sh
module load mpi/openmpi3-x86_64
mpirun name_of_program
```

For more information about the `module` command see '[Software Modules]'.


[Software Modules]: {{ '/software/software-modules.html' | relative_url }}

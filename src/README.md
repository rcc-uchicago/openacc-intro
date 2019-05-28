To compile the code in this folder, you need to have PGI compiler in your path. on Midway, pleae run `module load pgi/2017`
before compiling the code.

The `Makefile` can be used for `C` programs only and has the following targets:
* `saxpy_acc`: to compile the `saxpy.c` code using `OpenACC` directives
* `saxpy_cpu`: to compile the `saxpy.c` code **without** `OpenACC` directives. You need to run `make TARGET=CPU saxypy_cpu`
* `jacobi_serial`: to compile the `jacobi_serial.c` code to run on CPU
* `jacobi_omp`: to compiel the `jacobi_omp.c` code to use `OpenMP` on CPU
* `jacobi_acc`: to compile the `jacobi_acc.c` code to use `OpenACC` directives
* `jacobi_acc_data`: to compile the `jacobi_acc_data.c` code to use data management directives of `OpenACC`
* `clean`: removes all object and binary files.

**NOTE**: Before running the `Makefile` with a new target, please run `make clean` to make sure you have the correct object files.

The `submit_saxpy.batch` and `submit_jacobi.sbatch` files can be used to submit jobs to the `gpu2` parition on Midway.

#!/bin/bash

#SBATCH --job-name=test_gpu
#SBATCH --output=jacobi_job.out
#SBATCH --ntasks=8
#SBATCH --nodes=1
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --time=00:30:00

echo "job started at `date`"
export PGI_ACC_TIME=1
export OMP_NUM_THREADS=$SLURM_NTASKS

echo $1 | $2

echo "job finished at `date`"

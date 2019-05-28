#!/bin/bash

#SBATCH --job-name=test_gpu
#SBATCH --output=saxpy.out
#SBATCH --partition=gpu2
#SBATCH --gres=gpu:1
#SBATCH --time=00:30:00
#SBATCH --reservation=openacc

echo "job started at `date`"
export PGI_ACC_TIME=1

$1

echo "job finished at `date`"

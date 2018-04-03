#!/bin/bash

#SBATCH --job-name=test_gpu
#SBATCH --output=saxpy.out
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --time=00:30:00

echo "job started at `date`"
export PGI_ACC_TIME=1

$1

echo "job finished at `date`"

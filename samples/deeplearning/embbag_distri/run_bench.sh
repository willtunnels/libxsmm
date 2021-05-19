#!/bin/bash

iters=(1 10 100)
Ns=(1024 2048)
Ps=(32 64)

export OMP_NUM_THREADS=68

for N in ${Ns[@]}; do
  for P in ${Ps[@]}; do
    for iter in ${iters[@]}; do
      for flush in {0..1}; do
        for i in {1..10}; do
          srun --tasks-per-node=1 --nodes=1 ./main $iter $N 64 10000000 1 $P $flush
        done
      done
    done
  done
done

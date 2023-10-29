#!/bin/bash

get_start_times() {
  job_output_file="$1"
  start_time=$(grep -m 1 "time.struct_time" "$job_output_file")

  echo "==> $job_output_file <=="
  echo "$start_time"
}

echo -e "\nNumber of hkl files"
find . -name "*.hkl" | grep -v -e spiketrain -e mountains | wc -l

echo "Number of mda files"
find mountains -name "firings.mda" | wc -l

echo -e "\n#==========================================================="

# Display start and end times for rplparallel-slurm.sh and rplsplit-slurm.sh
echo "Start Times"
get_start_times "rplpl-slurm.queue1-dy-r5a-2xlarge-1.13.out"
get_start_times "rs1-slurm.queue1-dy-r5a-2xlarge-1.14.out"
get_start_times "rs2-slurm.queue1-dy-r5a-2xlarge-2.15.out"
get_start_times "rs3-slurm.queue1-dy-r5a-2xlarge-3.16.out"
get_start_times "rs4-slurm.queue1-dy-r5a-2xlarge-4.17.out"


echo -e "\nEnd Times"
echo "==> rplpl-slurm.queue1-dy-r5a-2xlarge-1.13.out <=="
tail -n 5 rplpl*.out
echo "==> rs1-slurm.queue1-dy-r5a-2xlarge-1.14.out <=="
tail -n 5 rs1*.out
echo "==> rs2-slurm.queue1-dy-r5a-2xlarge-2.15.out <=="
tail -n 5 rs2*.out
echo "==> rs3-slurm.queue1-dy-r5a-2xlarge-3.16.out <=="
tail -n 5 rs3*.out
echo "==> rs4-slurm.queue1-dy-r5a-2xlarge-4.17.out <=="
tail -n 5 rs4*.out


echo -e "#==========================================================="


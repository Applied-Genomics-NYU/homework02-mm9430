#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --time=1:00:00
#SBATCH --mem=4GB
#SBATCH --job-name=MYJOB
#SBATCH --output=slurm_%j.out

module load hisat2/intel/2.0.5

hisat2-build ./*.fa athaliana_index


for read in ./*_1.fastq

do


      hisat2 -p 8 -x athaliana_index -1 $read -2 ${read::-7}2.fastq -S ${read::-7}athaliana_HiSAT.sam

   
done


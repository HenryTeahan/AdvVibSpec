#!/bin/sh
#SBATCH --job-name=IPA_G.inp
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=4
#SBATCH --mem=8000
#SBATCH --error=/lustre/hpc/kemi/hteahan/VibSpec/IPA/IPA_G.inp.err
#SBATCH --output=/lustre/hpc/kemi/hteahan/VibSpec/IPA/IPA_G.inp.out
#SBATCH --time=08:00:00
#SBATCH --partition=compchem
#SBATCH --no-requeue
module load mpi/openmpi-x86_64

#Move to scratch dir for calculations
cp IPA_G.inp /scratch/$SLURM_JOB_ID/
cd /scratch/$SLURM_JOB_ID/
#Run calculations
/groups/kemi/hteahan/opt/orca_6_1_0_linux_x86-64_shared_openmpi418/orca IPA_G.inp

mv * /lustre/hpc/kemi/hteahan/VibSpec/IPA

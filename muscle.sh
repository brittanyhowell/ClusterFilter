#!/bin/bash
## Script invokes Muscle
## Date: 12-8-2016

# Invoked by: ClusDIR=/data/rc003/Brittany/Clusters/clusters MuscleOUT=/data/rc003/Brittany/Clusters/MuscleAlign sbatch muscle.sh

#SBATCH -p batch
#SBATCH -N 1 
#SBATCH -n 8 
#SBATCH --time=0-04:00
#SBATCH --mem=40GB 

# Notification configuration 
#SBATCH --mail-type=END                                         
#SBATCH --mail-type=FAIL           
#SBATCH --mail-user=brittany.howell@student.adelaide.edu.au      


# Load the necessary modules
module load MUSCLE/3.8.31

cd ${ClusDIR}

echo "aligning cluster ${1}_${2}"
	muscle -in cluster_${1}_95_${2}.fasta -out ${MuscleOUT}/cluster_${1}_95_${2}.afa 
echo "complete cluster ${1}_${2}"
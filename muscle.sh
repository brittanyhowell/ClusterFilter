#!/bin/bash
## Script invokes Muscle
## Date: 12-8-2016

# Invoked by: 

#SBATCH -p batch
#SBATCH -N 1 
#SBATCH -n 8 
#SBATCH --time=0-04:00
#SBATCH --mem=20GB 

# Notification configuration 
#SBATCH --mail-type=END                                         
#SBATCH --mail-type=FAIL           
#SBATCH --mail-user=brittany.howell@student.adelaide.edu.au      


# Load the necessary modules
module load MUSCLE/3.8.31


muscle -in cluster_7.fasta -out cluster_7.afa

echo "Complete"

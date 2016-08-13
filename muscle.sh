#!/bin/bash
## Script invokes Muscle
## Date: 12-8-2016

# Invoked by: WkDIR=/data/rc003/Brittany/Data/Clusters sbatch muscle.sh

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

ClusDIR=/data/rc003/Brittany/Clusters/clusters
MuscleOUT=/data/rc003/Brittany/Clusters/MuscleAlign

CLUSTERS=("0" "1" "2" "3" "6" "7" "8" "10" "25" "108" "115" "146" "150" "151" "198" "425")

# Move into cluster directory
cd ${WkDIR}

for clusterNum in "${CLUSTERS[@]}"; do 

echo "aligning cluster ${clusterNum}"

	muscle -in cluster_${clusterNum}.fasta -out ${MuscleOUT}/cluster_7.afa

done

echo "Complete"


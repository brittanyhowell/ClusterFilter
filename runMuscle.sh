#!/bin/bash
## Script submits multiple muscle.sh scripts
## Date: 13-8-2016

WkDIR=/data/rc003/Brittany/Clusters
# CLUSTERS=("0" "1" "3" "4" "5" "13")
# BigClus="0"
# CLUSTERS=("0" "1" "3" "5")
# BigClus="1"
CLUSTERS=("0" "1" "3" "5" "7" "48" "99")
BigClus="3"

# Move into working directory
cd ${WkDIR}

for clusterNum in "${CLUSTERS[@]}"; do 

ClusDIR=/data/rc003/Brittany/Clusters/SplitClusters MuscleOUT=/data/rc003/Brittany/Clusters/SplitMuscleAlign sbatch muscle.sh ${BigClus} ${clusterNum} 

done

echo "Complete"


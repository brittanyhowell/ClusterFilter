#!/bin/bash
## Script submits multiple muscle.sh scripts
## Date: 13-8-2016

WkDIR=/data/rc003/Brittany/Clusters
CLUSTERS=("0" "1" "3" )

# Move into working directory
cd ${WkDIR}

for clusterNum in "${CLUSTERS[@]}"; do 

ClusDIR=/data/rc003/Brittany/Clusters/clusters MuscleOUT=/data/rc003/Brittany/Clusters/MuscleAlign sbatch muscle.sh ${clusterNum}

done

echo "Complete"


#!/bin/bash
## Uses data in headers to make BED files
## Date: 19-8-2016

largeClusDir=/Users/brittanyhowell/Documents/University/Honours_2016/Project/ClusterFilter/clusterOutput/activeClusters
WkDIR=/Users/brittanyhowell/Documents/University/Honours_2016/Project/ClusterFilter/clusterOutput/clusterSeqs
CLUSTERS=("0" "1" "2" "3" "6" "7" "8" "10" "25" "108" "115" "146" "150" "151" "198" "425")

# Move into working directory
cd ${WkDIR}

for clusterNum in "${CLUSTERS[@]}"; do  

echo "making BED from cluster ${clusterNum}"

	cat cluster_${clusterNum}.fasta | grep '>' | sed 's/>//g' | sed 's/:/ /g' | sed 's/(-)/.rev/g' | sed 's/(+)/.fwd/g' | sed 's/-/ /g' | sed 's/.rev/ -/g' | sed 's/.fwd/ +/g' | awk '{print $1 "\t" $2 "\t" $3 "\t" "L1mouse" "\t" "1" "\t" $4}' > ${largeClusDir}/cluster_${clusterNum}.bed

done

cd ${largeClusDir}

cat cluster* > ActiveClusteredL1s.bed 

echo "Complete"


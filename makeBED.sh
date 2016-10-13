
#!/bin/bash
## Uses data in headers to make BED files
## Update on 13th October to read from alignments with renameHeader edited headers.
## Date: 19-8-2016

largeClusDir=/Users/brittanyhowell/Documents/University/Honours_2016/Project/ClusterFilter/splitting/AlignedClusters/sequences/BED
WkDIR=/Users/brittanyhowell/Documents/University/Honours_2016/Project/ClusterFilter/splitting/AlignedClusters/sequences
# CLUSTERS=("0" "1" "2" "3" "4" "5" "6" "7" "8" "10" "16")

# Move into working directory
cd ${WkDIR}

for clusterNum in *.fasta; do  

echo "making BED from cluster ${clusterNum}"
filename=${clusterNum%.fasta}

	cat ${clusterNum} | grep '>' | sed 's/ORF1//g' | sed 's/ORF2//g' | sed 's/>//g' | sed 's/\_/ /g' | sed 's/ -/.rev/g' | sed 's/ +/.fwd/g' | sed 's/-/ /g' | sed 's/.rev/ -/g' | sed 's/.fwd/ +/g' | awk '{print $1 "\t" $2 "\t" $3 "\t" "L1mouse" "\t" "1" "\t" $4}' > ${largeClusDir}/${filename}.bed

done

cd ${largeClusDir}

cat cluster* > ActiveClusteredL1s.bed 

echo "Complete"



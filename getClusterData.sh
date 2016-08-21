#!/bin/bash

# File paths 
splitDir=/Users/brittanyhowell/Documents/University/Honours_2016/Project/ClusterFilter/clusterOutput/splitting
clusDIR=${splitDir}/clusters
resultsDir=${splitDir}/OutputInformation

# Run information
cluster="0"
id=".95"
idName="95"
minClustSize="20"
resultsTable=results_${cluster}_${id}.uc

# Output files:
ClustSeqs="${clusDIR}/cluster_${cluster}_${idName}_"
AllClust="clusterList_${cluster}_${id}.txt"
Min20="clusterList_min${minClustSize}_${cluster}_${id}.txt"
SummTable="clusterNumbersSecond.txt"


# Clustering
cd ${splitDir}

if [ -f ${resultsTable} ]; then
	rm ${resultsTable}
	echo "Removed ${resultsTable}... Making"  
else 
	echo "Making ${resultsTable}"  
fi 

usearch -cluster_fast cluster_${cluster}.fasta -id ${id} -clusters ${ClustSeqs} -uc ${resultsTable}


mv ${resultsTable} ${resultsDir}

# Edit results table into cluster summary tables
cd ${resultsDir}

if [ -f ${AllClust} ]; then
	rm ${AllClust}
	echo "Removed ${AllClust}... Making"  
else 
	echo "Making ${AllClust}"  
fi 

# find clusters
awk '{if ($1=="C") print}' ${resultsTable} > ${AllClust}

if [ -f ${Min20} ]; then
	rm ${Min20}
	echo "Removed ${Min20}... Making"  
else 
	echo "Making ${Min20}"  
fi 

# Find clusters with more than min members
awk '{if ($3>='${minClustSize}') print}' clusterList_${cluster}_${id}.txt > ${Min20}


# Add line to Summary table

NumClusters=$(wc -l ${AllClust})
NumLargeClusters=$(wc -l ${Min20})

echo -e  "${NumClusters} \t ${NumLargeClusters}" >> ${SummTable}

echo "Complete"




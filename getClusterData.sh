#!/bin/bash

# File paths 
seqDIR=/Users/brittanyhowell/Documents/University/Honours_2016/Project/ClusterFilter/ClusFromActive
clusDIR=${seqDIR}/clusters
resultsDir=${seqDIR}/OutputInformation

# Run information
#cluster="0"
InputSeq="mouseORF1ORF2min4kbmax8kb.fasta"
id=".95"
idName="95"
minClustSize="20"
resultsTable=results_BO_4-8_${id}.uc

# Output files:
ClustSeqs="${clusDIR}/cluster_${idName}_"
AllClust="clusterList_${id}.txt"
Min20="clusterList_min${minClustSize}_${id}.txt"
SummTable="clustersBO_4-8.txt"

# Folder checks
if [ -d $seqDIR ]; then
	echo "Sequence folder exists..." 
else 
	echo "No Sequence folder.... exiting" 
	exit
fi 

if [ -d $clusDIR ]; then
	echo "cluster output folder exists..."
else 
	echo "No cluster output folder.... Creating" 
	mkdir ${clusDIR}
fi 

if [ -d $resultsDir ]; then
	echo "Results folder exists..."
else 
	echo "No Results folder.... Creating" 
	mkdir ${resultsDir}
fi 

# Clustering
cd ${seqDIR}

if [ -f ${resultsTable} ]; then
	rm ${resultsTable}
	echo "Removed ${resultsTable}... Making"  
else 
	echo "Making ${resultsTable}"  
fi 

usearch -cluster_fast ${InputSeq} -id ${id} -clusters ${ClustSeqs} -uc ${resultsTable}


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
awk '{if ($3>='${minClustSize}') print}' clusterList_${id}.txt > ${Min20}


# Add line to Summary table

NumClusters=$(wc -l ${AllClust})
NumLargeClusters=$(wc -l ${Min20})

echo -e  "${NumClusters} \t ${NumLargeClusters}" >> ${SummTable}

echo "Complete"




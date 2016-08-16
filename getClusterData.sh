#!/bin/bash

# File paths 
splitDir=/Users/brittanyhowell/Documents/University/Honours_2016/Project/ClusterFilter/clusterOutput/splitting
resultsDir=/Users/brittanyhowell/Documents/University/Honours_2016/Project/ClusterFilter/clusterOutput/splitting/OutputInformation

# Run information
resultsTable=results_0_.9.uc
cluster="0"
id=".9"
minClustSize="20"


# Clustering
cd ${splitDir}

usearch -cluster_fast cluster_${cluster}.fasta -id ${id} -clusters ${splitDir}/cluster_${cluster}_${id}_ -uc ${resultsTable}

# Edit results table into cluster summary tables
cd ${resultsDir}

awk '{if ($1=="C") print}' ${resultsTable} > clusterList_${cluster}_${id}.txt

awk '{if ($3>='${minClustSize}') print}' clusterList_${cluster}_${id}.txt > clusterList_min20_${cluster}_${id}.txt

echo "Complete"
#!/bin/bash

WkDir=/Users/brittanyhowell/Documents/University/Honours_2016/Project/ClusterFilter/clusterOutput/splitting/clusters

cd ${WkDir}


for clus in cluster* ; do

	# name=${clus%.form.afa.fasta.fasta}
	mv ${clus} ${clus}.fasta
	mv ${clus}.fasta ./done
done

#!/bin/bash

WkDir=/Users/brittanyhowell/Documents/University/Honours_2016/Project/ClusterFilter/ClusFromActive/clusters

cd ${WkDir}


for clus in cluster* ; do

	mv ${clus} ${clus}.fasta
	mv ${clus}.fasta ./done
done


# for clus in *form.afa ; do

# 	name=${clus%.form.afa}
# 	mv ${clus} ${name}.fasta

# done
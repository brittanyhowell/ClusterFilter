#!/bin/bash
Wkdir=/Users/brittanyhowell/Documents/University/Honours_2016/Project/ClusterFilter/clusterOutput/splitting/clusters

cd ${Wkdir}
for i in *.fasta; do 

	filename=${i%.fasta}
	sed s/:/_/g $i | sed s/\(/_/g | sed s/\)//g > ${filename}.form.fasta

done
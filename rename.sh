#!/bin/bash

cd /Users/brittanyhowell/Documents/University/Honours_2016/Project/ClusterFilter/ClusFromActive/clusters

for i in *.afa; do 

	filename=${i%.afa}
	sed s/:/_/g $i | sed s/\(/_/g | sed s/\)//g > ${filename}.form.afa

done

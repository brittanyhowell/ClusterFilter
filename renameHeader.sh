#!/bin/bash
Wkdir=/data/rc003/Brittany/Clusters/SplitMuscleAlign/new

cd ${Wkdir}
for i in *.afa; do 

	filename=${i%.afa}
	sed s/:/_/g $i | sed s/\(/_/g | sed s/\)//g > ${filename}.fasta

done
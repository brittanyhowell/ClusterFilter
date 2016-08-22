#!/bin/bash
Wkdir=/data/rc003/Brittany/Clusters/SplitMuscleAlign

cd ${Wkdir}
for i in *.afa; do 

	filename=${i%.afa}
	sed s/:/_/g $i | sed s/\(/_/g | sed s/\)//g > ${filename}.form.afa

done
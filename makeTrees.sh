#!/bin/bash
# makeTrees.sh
# 

AlignDIR=/Users/brittanyhowell/Documents/University/Honours_2016/Project/ClusterFilter/clusterOutput/AlignedClusters
TreeDIR=/Users/brittanyhowell/Documents/University/Honours_2016/Project/ClusterFilter/clusterOutput/tree

# Check TreeDIR exists 
if [ -d $TreeDIR ]; then
	rm -r $TreeDIR 
	mkdir $TreeDIR
	echo "TREE folder exists... replacing"  
else 
	echo "creating TREE folder"  
	mkdir $TreeDIR
fi

cd ${AlignDIR}

# Remove any semi-complete coverage files
if [ -f *.tree ]; then
	rm *.tree
	echo "Removed tree file in progress"  
else 
	echo "No tree files in progress"  
fi 

echo "making trees" 
for iAlign in *form.afa; do 

filename=${iAlign%.form.afa}
echo ""
echo "making tree for ${filename}"
	fasttree -nt ${iAlign} > ${filename}.tree
	mv ${filename}.tree ${TreeDIR}
done

echo "Complete"

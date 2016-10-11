ClusterFilter

This repo clusters sequence, then it filters them. It runs pretty nicely into the "findGaps" repo (https://github.com/brittanyhowell/findGaps)

Input: 		Fasta sequences, patience
Output: 	Tree files, some BED files of clustered elements

Script Purposes:

getClusterData.sh: 	Invokes usearch to cluster provided FASTA sequences.

runMuscle.sh: 		Submits muscle.sh jobs for specified clusters.
muscle.sh:			Invokes MUSCLE on Phoenix. 
renameHeader.sh:	Substitutes friendly characters in for non-friendly ones (tree builders are fussy).
makeTrees: 			Invokes fasttree.

FastaRename.sh:		Changes file suffixes.
makeBED.sh: 		Converts fasta output from clusters into BED files.


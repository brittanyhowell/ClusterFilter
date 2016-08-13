#!/bin/bash

for clus in cluster* ; do
	mv ${clus} ${clus}.fasta
done

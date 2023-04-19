#!/bin/bash
# Run igdiscover clonotypes with and without --members option on all filtered tabs in a folder
# You should be in the folder containing the igdiscover processed filtered tabs, 
# your first argument should be output path for clonotypes.
# Activate your igdiscover environment before running it using conda/mamba

set -euo pipefail
out_path=$1

for f in *filtered*; do
	if [ -r $f ]; then
		echo $f
		igdiscover clonotypes --sort --cdr3-core 2:-2 --mismatches 0.2 --aa --members $out_path/${f::3}_clonotypes_full.txt $f
		igdiscover clonotypes --sort --cdr3-core 2:-2 --mismatches 0.2 --aa $f >  $out_path/${f::3}_clonotypes_summary.txt 
	else
		echo $f
		echo "Files are not readable. Please double check your input"
	fi
done

#!/bin/bash
# Run igdiscover clonoquery with and without --members option on all filtered tabs in a folder
# You should be in the root project folder
# First argument: should be the root folder containing all the preprocessed `filtered.tab.gz` generated from IgDiscover.
# Second argument: the query sequence to be used, in this case the sanger sequences.
# Activate your igdiscover environment before running it using conda/mamba

set -euo pipefail
ALIGNED_FOLDER=$1
QUERY=$2
DATE=$(date +'%Y-%m-%d')

mkdir -p "results/${DATE}/${QUERY##*/}"

for f in ${ALIGNED_FOLDER}/*filtered.tab.gz; do
	if [ -r $f ]; then
		echo $f
		igdiscover clonoquery --cdr3-core 2:-2 --mismatches 0.2 --aa "$f" "${QUERY}" > "results/${DATE}/${QUERY##*/}/${f##*/}_clonoquery_full.txt"
		igdiscover clonoquery --cdr3-core 2:-2 --mismatches 0.2 --aa "$f" --members "results/${DATE}/${QUERY##*/}/${f##*/}_clonoquery_summary.txt" "${QUERY}"
	else
		echo $f
		echo "Files are not readable. Please double check your input"
	fi
done

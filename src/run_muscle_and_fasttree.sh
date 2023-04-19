#!/bin/bash
## Run this on a folder containing fasta files to be aligned to generate phylogenetic trees using Muscle v5 + Fasttree 2.1 

set -euo pipefail
for i in *.fasta; do muscle --super5 "${i}" --output "${i}.aln"; done
for i in *.aln; do fasttree -lg "${i}" > "${i}.tre"; done

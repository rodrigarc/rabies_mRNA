## Unmodified rabies mRNA vaccine elicits high cross-neutralizing antibody titers and diverse B cell memory responses


Fredrika Hellgren‡, Alberto Cagigi,3‡, Rodrigo Arcoverde Cerveira‡, Sebastian Ols, Theresa Kern, Ang Lin, Bengt Eriksson, Michael G Dodds, Edith Jasny, Kim Schwendt, Conrad Freuling, Thomas Müller, Martin Corcoran, Gunilla B. Karlsson Hedestam, Benjamin Petsch and Karin Loré**

‡These authors contributed equally
**Corresponding author: Karin Loré, Division of Immunology and Allergy, Department of Medicine Solna, Karolinska Institutet, Visionsgatan 4, BioClinicum J7:30, Karolinska University Hospital, 171 64 Stockholm, Sweden.


## Table of contents
* [Abstract](#abstract)
* [General information](#general-information)
* [Preprocessing dataset](#preprocessing-dataset)
* [Repository structure](#repository-structure)
* [Plots and rendered results](#plots-and-rendered-results)
* [Reproducibility](#reproducibility)
* [License](#license)

## Abstract

Licensed rabies virus vaccines based on whole inactivated virus are effective in humans. However, there is a lack of detailed investigations of the elicited immune response, and whether responses can be improved with novel vaccine platforms is lacking. Here we show that two doses of a lipid nanoparticle-formulated unmodified mRNA vaccine encoding the rabies virus glycoprotein (RABV-G) induces higher levels of RABV-G specific plasmablasts, memory B cells and T cells in blood, and plasma cells in the bone marrow compared to two doses of Rabipur in non-human primates. The mRNA vaccine also generates higher RABV-G binding and neutralizing antibody titers than Rabipur, while the degree of somatic hypermutation and clonal diversity of the response are similar for the two vaccines. The higher overall antibody titers induced by the mRNA vaccine translates into improved cross-neutralization of related lyssavirus strains, suggesting that this platform has potential for the development of a broadly protective vaccine against these viruses.

## General information

This repository contains all the code used for sequence analysis performed to process and compare B cell receptors between the vaccinated groups. If you want to just check the code and plots without having to rerun all the analysis, just check our deployed [website by clicking HERE](https://rodrigarc.github.io/rabies_mRNA/results/lab_book/bcr-repertoire-analysis.html). If you want to have access to the processed dataset to rerun the entire analysis, download it from our [Zenodo repo](https://zenodo.org/record/7680334).

## Preprocessing dataset

The preprocessing was done using IgDiscover (v. 0.15.1) but the raw reads are not included here. The raw data is available on NCBI Bioproject [PRJNA932987](https://www.ncbi.nlm.nih.gov/bioproject/932987). 
The raw reads were aligned to the [KIMDB *Macaca mulatta* database](http://kimdb.gkhlab.se/datasets/) and the clonotype assignment were also generated using IgDiscover. The clonotype definition is identical IGHV-IGHJ-HCDR3 length, at least one of the junctions is the same, and 80% HCDR3 amino acid identity. The bash script and comments on how to use it can be found here `src/run_clonotypes_loop.sh`. The HVDJ amino acid multiple sequence alignments were done using MUSCLE (v 5.1) using default seetings. The resulting alignments were used as input to Fasttree (v 2.1.1), the generalized time-reversible model was used to infer the phylogenetic trees. The bash script for this with the the parameters used to run can be found in `src/run_muscle_and_fasttree.sh`. The raw Sanger sequencing files (.ab1 files) from RABV-G specific single-cell sorted B cells are deposited here and were processed using the [Scifer R/bioconductor package](http://doi.org/10.18129/B9.bioc.scifer). The Sanger sequences were processed the same way as the raw reads, using IgDiscover. The antigen-specific lineage tracing per animal was done using the `clonoquery module` within IgDiscover. A sample code on how it was run is available at `src/run_clonoquery.sh`.

## Repository structure
 - `src` folder: contains all the source code used for the preprocessing and analysis of the B cell receptors.
 - `rabies_mRNA.Rproj` file: contains the R project to be open within RStudio for reproducibility purposes.
 - `renv` folder: contains the files generated when renv is initiated. 
 - `renv.lock` filer: contains the package versions and dependencies used to generate the plots.
 
## Reproducibility

To rerun the analysis and generate plots, it is required for you to have the following programs:
 - R program (R version 4.2.2)
 - RStudio (2022.12.0+353)
 - renv (0.16.0)
 
To rerun the analysis, please clone this repo and check the required programs above. The processed datasets are available at our [Zenodo repo](https://zenodo.org/record/7680334). After that, open the `rabies_mRNA.Rproj` file and restore the environment. Then, knit the `clonotype_analysis.Rmd` and all the plots should be generated. 


```
# select a location to reproduce this analysis in your computer using the terminal
cd ~/Desktop
# clone this repo for the most updated code
git clone https://github.com/rodrigarc/rabies_mRNA
# download the necessary processed data present in the zenodo repo
# download via browser searching for 7680334 acession on zenodo website or use curl/wget on the terminal
wget -O rabies_mRNA.zip "https://zenodo.org/record/7680334/files/repo_to_zenodo_0-9-0.zip?download=1"
# unzip the repository using your preferred unzipper
unzip rabies_mRNA.zip

# Open the Rproj downloaded (rabies_mRNA.Rproj) within Rstudio (double click on Rproj if RStudio is installed)
# Restore environment using renv on the R console within RStudio
renv::restore()

# Knit the the entire analysis
# Within RStudio, open clonotype_analysis.Rmd
# Click on Knitr or run the following command
knitr::render("src/clonotype-analysis.Rmd")

```

## Plots and rendered results

All the plots will be generated under a `results` folder under a date folder (eg. `results/2023-02-10`) automatically created. The Rmarkdown file is rendered to html and contains the information regarding the type of analysis and its code used to generate all plots. A rendered version is already online and uploaded under `results/lab_book/` if you wish to just check the code used for each plot. The rendered `html` containing the code and analysis can be accessed [HERE](https://rodrigarc.github.io/rabies_mRNA/results/lab_book/bcr-repertoire-analysis.html). The QC from the antigen-specificsanger sequences can be found [here](https://rodrigarc.github.io/rabies_mRNA/results/lab_book/template_all_HC.html).


## License

All the code in this repo is under a GNU General Public License v3.0.

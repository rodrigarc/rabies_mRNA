## Unmodified mRNA vaccine encoding rabies virus glycoprotein induces stronger immunity compared to a licensed vaccine in macaques

Fredrika Hellgren*, Alberto Cagigi,3*, Rodrigo Arcoverde Cerveira*, Sebastian Ols, Theresa Kern, Ang Lin, Bengt Eriksson, Michael G Dodds, Edith Jasny, Kim Schwendt, Conrad Freuling, Thomas Müller, Martin Corcoran, Gunilla B. Karlsson Hedestam, Benjamin Petsch and Karin Loré**

*Shared authors 
**Corresponding author: Karin Loré, Division of Immunology and Allergy, Department of Medicine Solna, Karolinska Institutet, Visionsgatan 4, BioClinicum J7:30, Karolinska University Hospital, 171 64 Stockholm, Sweden.

### Data analysis

This repository contains all the code used for sequence analysis performed to process and compare B cell receptors between the vaccinated groups.

### Repository structure
 - `src` folder: contains all the source code used for the preprocing and analysis of the B cell receptors.
 - `rabies_mRNA.Rproj` file: contains the R project to be open within RStudio for reproducibility purposes.
 - `renv` folder: contains the needed information regarding packages versions used. 
 
### Reproducibility

To rerun the analysis and generate plots, it is required for you to have the following programs:
 - R programming (R version 4.2.2)
 - RStudio (2022.12.0+353)
 - renv (0.16.0)
 
To rerun the analysis, please clone this repo and check the required programs above. After that, open the `rabies_mRNA.Rproj` file and restore then environment. Then, knit the `clonotype_analysis.Rmd` and all the plots should be generated. 


```
cd ~/Desktop
git clone https://github.com/rodrigarc/rabies_mRNA
# Open the Rproj within Rstudio (double click on Rproj if RStudio is installed)
# Restore environment using renv
renv::restore()

# Knit the the entire analysis
# Within RStudio, open clonotype_analysis.Rmd
# Click on Knitr or run the following command
knitr::render("src/clonotype-analysis.Rmd")

```

### Plots and rendered html file

All the plots will be generated under a `results` folder under a date folder (eg. `results/2023-02-10`) automatically created. The Rmarkdown file is rendered to html and contains the information regarding the type of analysis and its code used to generate all plots. A rendered version is already uploaded under `results/lab_book/` if you wish to just check the code used for each plot.


### License

All the code in this repo is under a GNU General Public License v3.0.

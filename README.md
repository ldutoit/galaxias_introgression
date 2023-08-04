# galaxias_introgression

This repository present the code associated to the manuscript:

Campbell, C. S.,  Waters, J. M., & Dutoit, L. (2023). Fish biogeography and hybridization: do contemporary distributions predict introgression history. Evolution.

SNP calling were performed in a previous publication:

Campbell, C. S., Dutoit, L., King, T. M., Craw, D., Burridge, C. P., Wallis, G. P., & Waters, J. M. (2022). Genome‐wide analysis resolves the radiation of New Zealand's freshwater Galaxias vulgaris complex and reveals a candidate species obscured by mitochondrial capture. Diversity and Distributions, 28(10), 2255-2267. [Dryad scripts](https://datadryad.org/stash/dataset/doi:10.5061/dryad.0k6djhb38) [Genomic data deposited at the Short Read Archive](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA869758).

Contact: dutoit.ludovic@gmail.com.

### Scripts

- [abbababba.py](abbababba.py) This script effectively run the ABBA BABBA analysis. It takes the comparisons provided in the file [sets2.txt] and output the file [allBBAA2.txt](allBBAA2.txt) that contains all the D-statistics provided by [Dsuite](https://github.com/millanek/Dsuite).
- [plots.R](plots.R) This file takes the output of Dsuite to calculate all correlations and plots the main figures. Importantly, it also combines the Dp statistic and combine all data with the geographical overlap. 

### Data files:

- [BBAAwithDp.txt](BBAAwithDp.txt): Combined output of Dsuite with computed Dp statistics. Output of  [plots.R](plots.R).
- [allBBAA.j.txt](allBBAA.j.txt): Combined output of Dsuite with geographic overlap data. Output of  [plots.R](plots.R).
- [allBBAA2.txt](allBBAA2.txt): Output of [abbababba.py](abbababba.py) and main input for [plots.R](plots.R)
- [popmap.txt](popmap.txt): File matching samples and populations.
- [sets2.txt](sets2.txt): List of all comparsions. 3 comparisons were excluded (see paper)



#!/bin/bash

#SBATCH --job-name=CytoLCA_Bodenmiller_2012
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=3
#SBATCH --mem-per-cpu=8GB
#SBATCH --time=48:00:00
#SBATCH --partition=normal

module load R/3.3.0

num_latent_classes=$1
num_cells=10000
num_bins=8
num_chains=2

echo run: $num_latent_classes num_latent_classes, $num_cells cells, $num_chains chains,
R -e "rmarkdown::render('CytoLCA_Bodenmiller_2012.Rmd',output_file = 'CytoLCA_Bodenmiller_2012_R${num_latent_classes}_N${num_cells}_Bins${num_bins}.html',params = list(num_latent_classes = '${num_latent_classes}',num_cells = '${num_cells}',num_bins = '${num_bins}',num_chains = '${num_chains}'))"
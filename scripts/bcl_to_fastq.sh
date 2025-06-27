#!/bin/bash -l

# Set SCC project
#$ -P bosmlab2

# Specify the hard time limit for the job
#$ -l h_rt=12:00:00

# Give job a name
#$ -N jarch_cellranger_bcl_to_fastq           

# Merge the error and output streams into a single file
#$ -j y 

# Request processor node 
#$ -pe omp 12
#$ -l mem_per_core=12G             

# Specify the output file name
#$ -o ~/logs/cellranger_bcl_to_fastq_IL27RAko.qlog

# Keep track of information related to the current job
echo "=========================================================="
echo "Start date : $(date)"
echo "Job name : $JOB_NAME"
echo "Job ID : $JOB_ID  $SGE_TASK_ID"
echo "=========================================================="


cd ~/fastq_files/

module load bcl2fastq/2.20
module load cellranger/6.0.1

cellranger mkfastq --id=TotalSeq_IL27RAko_fastq \
                     --run=~/raw_data/2022_01_07_BosmannM_WalachowskiS_run_bcl \
                     --csv=~/input_files/2021_12_03_BosmannM_WalachowskiS_10X_SampleSheet_IndxUpd.csv \
                     --barcode-mismatches=0

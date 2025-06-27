#!/bin/bash -l

# Set SCC project
#$ -P bosmlab2

# Specify the hard time limit for the job
#$ -l h_rt=12:00:00

# Give job a name
#$ -N cellranger6_counts_RNA_ADT           

# Merge the error and output streams into a single file
#$ -j y 

# Request processor node 
#$ -pe omp 12
#$ -l mem_per_core=12G

# Specify the output file name
#$ -o ~/logs/cr6_counts_RNA_ADT_IL27RAko.qlog

# Keep track of information related to the current job
echo "=========================================================="
echo "Start date : $(date)"
echo "Job name : $JOB_NAME"
echo "Job ID : $JOB_ID  $SGE_TASK_ID"
echo "=========================================================="


cd ~/RNA_ADT_counts/

module load bcl2fastq/2.20
module load cellranger/6.0.1
cellranger -h

for f in `cat ~/input_files/ExpID.txt`; do
cellranger count --id=$f \
                 --transcriptome=~/refdata-gex-mm10-2020-A \
                 --libraries=~/input_files/2021_12_03_BosmannM_WalachowskiS_libraries_$f.csv \
                 --feature-ref=~/input_files/99832_B308667_BarcodeList_mouse_TotalSeqA_cite-SEQ.csv \
                 --expect-cells=4000; done

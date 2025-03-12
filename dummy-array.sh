### ORIGINAL ARTEMIS SCRIPT ###

#!/bin/bash

#PBS -P MYPROJECT
#PBS -N align
#PBS -l select=1:ncpus=16:mem=96GB
#PBS -l walltime=24:00:00
#PBS -q defaultQ
#PBS -W umask=022
#PBS -J 1-4

cd $PBS_O_WORKDIR

# Load modules
module load bwa/0.7.17
module load samtools/1.10
module load samblaster/0.1.22

config=./samples.config
ref=./Reference/reference.fasta

line=$PBS_ARRAY_INDEX

sample=$(awk -v taskID=$PBS_ARRAY_INDEX 'NR==taskID {print $1}' $config)
fq1=./Fastq/${SAMPLE}_R1.fastq.gz
fq2=./Fastq/${SAMPLE}_R2.fastq.gz

bwa mem -M -t ${NCPUS} $ref \
    -R "@RG\tID:${SAMPLE}_1\tPL:ILLUMINA\tSM:${SAMPLE}\tLB:1\tCN:KCCG" \
    $fq1 $fq2  \
    | samblaster -M -e --addMateTags \
    -d ./Align_out/${SAMPLE}.disc.sam \
    -s ./Align_out/${SAMPLE}.split.sam \
    | samtools sort -@ ${NCPUS} -m 1G -o ./Align_out/${SAMPLE}.dedup.sort.bam  -
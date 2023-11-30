#!/bin/bash

echo "Running Covid pipeline test 0 - test FASTA"
nextflow main.nf -profile test,test_fasta,conda

test -s covid_fasta_test/test.assembly.vcf.gz || { echo "Missing VCF output file!"; exit 1; }
test -s covid_fasta_test/test.assembly.vcf.gz.tbi || { echo "Missing VCF index output file!"; exit 1; }
test -s covid_fasta_test/test.assembly.pangolin.csv || { echo "Missing pangolin output file!"; exit 1; }

echo "Running covid pipeline test 0 - test FASTQ"
nextflow main.nf -profile test,test_fastq,conda

test -s covid_fastq_test/test.bcftools.vcf.gz || { echo "Missing VCF output file!"; exit 1; }
test -s covid_fastq_test/test.bcftools.vcf.gz.tbi || { echo "Missing VCF index output file!"; exit 1; }
test -s covid_fastq_test/test.gatk.vcf.gz || { echo "Missing VCF output file!"; exit 1; }
test -s covid_fastq_test/test.gatk.vcf.gz.tbi || { echo "Missing VCF index output file!"; exit 1; }
test -s covid_fastq_test/test.lofreq.vcf.gz || { echo "Missing VCF output file!"; exit 1; }
test -s covid_fastq_test/test.lofreq.vcf.gz.tbi || { echo "Missing VCF index output file!"; exit 1; }
test -s covid_fastq_test/test.ivar.vcf.gz || { echo "Missing VCF output file!"; exit 1; }
test -s covid_fastq_test/test.ivar.vcf.gz.tbi || { echo "Missing VCF index output file!"; exit 1; }
test -s covid_fastq_test/test.ivar.tsv || { echo "Missing VCF output file!"; exit 1; }
test -s covid_fastq_test/test.fastp_stats.json || { echo "Missing VCF output file!"; exit 1; }
test -s covid_fastq_test/test.fastp_stats.html || { echo "Missing VCF output file!"; exit 1; }
test -s covid_fastq_test/test.coverage.tsv || { echo "Missing coverage output file!"; exit 1; }
test -s covid_fastq_test/test.depth.tsv || { echo "Missing depth output file!"; exit 1; }
test -s covid_fastq_test/test.bcftools.pangolin.csv || { echo "Missing pangolin output file!"; exit 1; }
test -s covid_fastq_test/test.gatk.pangolin.csv || { echo "Missing pangolin output file!"; exit 1; }
test -s covid_fastq_test/test.lofreq.pangolin.csv || { echo "Missing pangolin output file!"; exit 1; }
test -s covid_fastq_test/test.ivar.pangolin.csv || { echo "Missing pangolin output file!"; exit 1; }

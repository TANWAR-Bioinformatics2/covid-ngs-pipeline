params.memory = "3g"
params.cpus = 1
params.output = "."


process READ_TRIMMING_PAIRED_END {
    cpus params.cpus
    memory params.memory
    publishDir "${params.output}", mode: "copy", pattern: "*fastp_stats*"
    tag "${name}"

    conda (params.enable_conda ? "bioconda::fastp=0.20.1" : null)


    input:
        tuple val(name), path(fastqs)   

    output:
        tuple val(name), file(fq_1_paired), file(fq_2_paired), emit: trimmed_fastqs
                file("${name }.fastp_stats.json")
                file("${name }.fastp_stats.html")

        script:
    fq_1_paired = name + 'R1_P.fastq.gz'
    fq_2_paired = name + 'R2_P.fastq.gz'
    """
    fastp \
    --in1 ${fastqs[0]} \
    --in2 ${fastqs[1]}\
    --out1 $fq_1_paired \
    --out2 $fq_2_paired \
    --json ${name}.fastp_stats.json \
    --html ${name}.fastp_stats.html
    """
}
process READ_TRIMMING_SINGLE_END {
    cpus params.cpus
    memory params.memory
    publishDir "${params.output}", mode: "copy", pattern: "*fastp_stats*"
    tag "${name}"

    conda (params.enable_conda ? "bioconda::fastp=0.20.1" : null)

    input:
        tuple val(name), file(fastqs)

    output:
        tuple val(name), file("${fastq1.baseName}.trimmed.fq.gz"), file("${fastq1.baseName}.trimmed.fq.gz")
        file("${name}.fastp_stats.json")
        file("${name}.fastp_stats.html")

    """
    # --input_files needs to be forced, otherwise it is inherited from profile in tests
    fastp \
    --in1 ${fastq1} \
   --in1 ${fastq2} \
    --out1 ${fastq1.baseName}.trimmed.fq.gz \
    --out1 ${fastq2.baseName}.trimmed.fq.gz \
    --json ${name}.fastp_stats.json \
    --html ${name}.fastp_stats.html
    """
}

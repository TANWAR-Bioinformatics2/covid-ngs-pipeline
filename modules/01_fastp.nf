params.memory = "3g"
params.cpus = 1
params.output = "."


process FASTP{
    cpus params.cpus
    memory params.memory
    publishDir "${params.outputttt}/adapterTrimmingggt", mode: 'copy'

    input:
        tuple val(sid), path(reads)   

    output:
        tuple val(name), file(fq_1_paired), file(fq_2_paired), emit: trimmed_reads
                file("${name }.fastp_stats.json")
                file("${name }.fastp_stats.html")

        script:
    fq_1_paired = name + 'R1_P.fastq.gz'
    fq_2_paired = name + 'R2_P.fastq.gz'
    """
    fastp \
    --in1 ${fastqs [0]} \
    --in2 ${fastqs[1]}\
    --out1 $fq_1_paired \
    --out2 $fq_2_paired \
    --json ${name}.fastp_stats.json \
    --html ${name}.fastp_stats.html
    """
}

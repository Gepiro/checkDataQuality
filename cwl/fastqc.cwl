#!/usr/bin/env cwl-runner
cwlVersion: v1.2
class: CommandLineTool

doc: |
  Run fastqc on raw reads in FASTQ format (single or paired end) or aligned reads in BAM.

hints:
  ResourceRequirement:
    coresMin: 1
    coresMax: $(inputs.threads)
  DockerRequirement:
    dockerPull: quay.io/biocontainers/fastqc:0.11.9--hdfd78af_1
  SoftwareRequirement:
    packages:
      fastqc:
        specs: [ https://identifiers.org/biotools/fastqc ]
        version: [ "0.11.9" ]


baseCommand: "fastqc"
arguments: 
  - valueFrom: $(runtime.outdir)
    prefix: "-o"
  - valueFrom: "--noextract"

inputs:
  raw_data:
    type: File[]
    inputBinding:
      position: 1
  threads:
    doc: "Maximum number of compute threads"
    type: int?
    default: 1
    inputBinding:
      position: 2 
      prefix: -t  
 
outputs:
  fastqc_zip:
    doc: all data e.g. figures
    type: File[]
    outputBinding:
      glob: "*_fastqc.zip"
  fastqc_html:
    doc: html report showing results from zip
    type: File[]
    outputBinding:
      glob: "*_fastqc.html"

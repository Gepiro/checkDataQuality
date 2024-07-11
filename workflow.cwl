#!usr/bin/env cwl-runner
cwlVersion: v1.2
class: Workflow

requirements:
  InlineJavascriptRequirement: {}
  StepInputExpressionRequirement: {}

inputs:
  raw_data: Directory 
  threads: int

outputs:
  multiqc_zip:
    type: Directory 
    outputSource: multiqc/multiqc_results
  multiqc_html:
    type: File
    outputSource: multiqc/multiqc_html

steps:  
  zerothstep:
    run: cwl/zerothStep.cwl
    in:
      dir: raw_data
    out: [reads]
  fastqc:
    run: cwl/fastqc.cwl
    in:
      raw_data: zerothstep/reads 
      threads: threads
    out: [fastqc_zip]
  multiqc:
    run: cwl/multiqc.cwl
    in:
      fastqc_results: fastqc/fastqc_zip
    out: [multiqc_results, multiqc_html]

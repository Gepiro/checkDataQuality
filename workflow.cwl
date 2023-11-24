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
  fastqc:
    run: cwl/fastqc.cwl
    in:
      raw_data: 
        source: raw_data
        valueFrom: $(self.listing) 
      threads: threads
    out: [fastqc_zip]
  multiqc:
    run: cwl/multiqc.cwl
    in:
      fastqc_results: fastqc/fastqc_zip
    out: [multiqc_results, multiqc_html]

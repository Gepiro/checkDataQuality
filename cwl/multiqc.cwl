#!/usr/bin/env cwl-runner
class: CommandLineTool
cwlVersion: v1.2

requirements:
  InlineJavascriptRequirement: {}
hints:
  DockerRequirement:
    dockerPull: ewels/multiqc 

baseCommand: ["multiqc"]

inputs: 
  fastqc_results:
    type: File[] 
    inputBinding:
      position: 1

outputs:
  multiqc_results:
    type: Directory
    outputBinding:
      glob: "multiqc_data"
  multiqc_html:
    type: File
    outputBinding:
      glob: "multiqc_report.html"

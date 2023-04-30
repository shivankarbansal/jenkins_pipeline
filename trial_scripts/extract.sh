#!/bin/bash
parser=$(gsutil cat gs://sample-microservice-1/sample/sample.yml)
metadata_content=($parser)
files=${metadata_content[@]}
for file in ${files}:
do
  echo "${file}"
done

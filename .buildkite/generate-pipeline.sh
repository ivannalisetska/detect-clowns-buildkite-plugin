#!/bin/bash

echo "Generating dynamic pipeline..."

echo "steps:" > pipeline.yml

while read pipeline; do
  echo "  - trigger: \"$pipeline\"" >> pipeline.yml
  echo "    label: \":rocket: Trigger $pipeline\"" >> pipeline.yml
done < pipelines-to-trigger.txt

buildkite-agent pipeline upload pipeline.yml

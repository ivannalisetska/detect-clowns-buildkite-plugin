#!/bin/bash
set -euo pipefail

PIPELINE_FILE=$(mktemp /tmp/pipeline.XXXXXX.yml)
AFFECTED="affected.txt"

echo "steps:" > "$PIPELINE_FILE"

while read -r project; do
  case "$project" in
    web-app)
      echo "  - trigger: \"web-app-pipeline\"" >> "$PIPELINE_FILE"
      echo "    label: \":rocket: Trigger Web App\"" >> "$PIPELINE_FILE"
      ;;
    api)
      echo "  - trigger: \"api-pipeline\"" >> "$PIPELINE_FILE"
      echo "    label: \":rocket: Trigger API\"" >> "$PIPELINE_FILE"
      ;;
    *)
      echo "  # Skipped unknown project: $project" >> "$PIPELINE_FILE"
      ;;
  esac
done < "$AFFECTED"

cat "$PIPELINE_FILE"  # for debugging
buildkite-agent pipeline upload "$PIPELINE_FILE"


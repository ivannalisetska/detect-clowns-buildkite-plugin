#!/bin/bash
set -euo pipefail

PIPELINE_FILE=$(mktemp /tmp/pipeline.XXXXX.yml)

echo "steps:" > "$PIPELINE_FILE"

IFS=' ' read -ra PROJECTS <<< "${AFFECTED_PROJECTS:-}"

for project in "${PROJECTS[@]}"; do
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
done

cat "$PIPELINE_FILE"
buildkite-agent pipeline upload "$PIPELINE_FILE"


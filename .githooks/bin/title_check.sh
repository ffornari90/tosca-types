#!/bin/bash

title="$1"
semantic_pattern="^(Fix|Update|New|Breaking): .+"

if [[ ! $title =~ $semantic_pattern ]]; then
  echo "Merge request title does not follow semantic commit message format."
  exit 1
else
  echo "Merge request title follows semantic commit message format."
fi

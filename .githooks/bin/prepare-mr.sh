#!/usr/bin/env bash

if [ -z "${1}" ]; then
  echo "Please provide a title for your Merge Request"
  exit 1
fi

./.githooks/bin/title_check.sh "${1}" || exit 1

declare -a FILES

FILES=(`git ls-files; git ls-files . --exclude-standard --others`)

for file in "${FILES[@]}"; do
  if [[ $file == *.yml || $file == *.yaml ]]; then
    echo "Checking file $file"
    python3 ./.githooks/bin/update_links_with_branch_or_tag_name.py master $file
    if [ ! $? -eq 0 ]; then echo Error: merge request creation failed; exit 1; fi
  fi
done

git commit -m"Restore master branch" -a

if [ ! $? -eq 0 ]; then
  echo "Nothing to commit. Empty commit will be added to proceed with MR..."
  git commit --allow-empty -m"Prepare Merge Request"
fi

git push -o merge_request.create -o merge_request.target=master -o merge_request.remove_source_branch -o merge_request.title="$1"


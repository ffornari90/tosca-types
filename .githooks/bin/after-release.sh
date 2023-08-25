#!/bin/bash
set -x
set -e

FILES=(`git ls-files; git ls-files . --exclude-standard --others`)
for file in "${FILES[@]}"; do
  if [[ $file == *.yml || $file == *.yaml ]]; then
    python3 .githooks/bin/update_links_with_branch_or_tag_name.py master $file
  fi
done

git status

git commit -m"[ci skip] Restore master branch" -a
git push -o ci-skip https://gitlab-ci-token:${GITLAB_TOKEN}@baltig.infn.it/infn-cloud/tosca-types.git HEAD:master

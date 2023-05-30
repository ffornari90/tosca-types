#!/bin/bash
set -x
set -e

echo $1

FILES=(`git ls-files; git ls-files . --exclude-standard --others`)
for file in "${FILES[@]}"; do
  if [[ $file == *.yml || $file == *.yaml ]]; then
    python3 .githooks/bin/prepare_release.py $1 $file
  fi
done

git status

git commit -m"[ci skip] Prepare release $1" -a
git push -o ci-skip https://gitlab-ci-token:${GITLAB_TOKEN}@baltig.infn.it/infn-cloud/tosca-types.git HEAD:master

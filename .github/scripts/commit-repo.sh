#!/bin/bash
set -e

rsync -a --delete --exclude .git --exclude .gitignore --exclude README.md --exclude repo.json ../main/repo/ .
git config --global user.email "online@skpassegna.me"
git config --global user.name "Samuel"
git status
if [ -n "$(git status --porcelain)" ]; then
    git add .
    git commit -m "Update extensions repo"
    git push

    curl https://purge.jsdelivr.net/gh/skpassegna/Mihon-extensions@repo/index.min.json
else
    echo "No changes to commit"
fi

#!/bin/bash
set -o errexit

rm -rf public
mkdir public

# config
git config --global user.email "khatefarman-deploy-bot@users.noreply.github.com"
git config --global user.name "khatefarman-deploy-bot"

# build (CHANGE THIS)
hugo

# deploy
cd public
git init
git add .
git commit -m "Deploy to Github Pages"
git push --force --set-upstream "https://${GITHUB_TOKEN}@github.com/${GITHUB_REPO}.git" master

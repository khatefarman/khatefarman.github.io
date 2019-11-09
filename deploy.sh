#!/bin/bash
set -o errexit

rm -rf public
mkdir public

# config
git config --global user.email "nobody@nobody.org"
git config --global user.name "Travis CI"

# build (CHANGE THIS)
hugo

# deploy
cd public
git init
git checkout -b gh-pages
git add .
git commit -m "Deploy to Github Pages"
git push --force --set-upstream "https://${GITHUB_TOKEN}@github.com/${GITHUB_REPO}.git" gh-pages

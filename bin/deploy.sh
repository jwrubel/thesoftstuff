#!/bin/bash

# Automated deploy script with Circle CI.

# Exit if any subcommand fails.
set -e

# Check if any changes are uncommited.
if ! git diff-files --quiet --ignore-submodules --
then
  echo >&2 "Please commit your changes first before deploying!"
  git diff-files --name-status -r --ignore-submodules -- >&2
  exit 0
fi

# Variables
ORIGIN_URL=`git config --get remote.origin.url`

echo "Started deploying"

# Checkout gh-pages branch.
if [ `git branch | grep gh-pages` ]
then
  git checkout master
  git branch -D gh-pages
fi
git checkout -b gh-pages

# Build site.
bundle exec jekyll build

# Delete and move files.
find . -maxdepth 1 ! -name '_site' ! -name '.git' ! -name '.gitignore' -exec rm -rf {} \;
mv _site/* .
rm -R _site/

# Push to gh-pages.
git config user.name "$USER_NAME"
git config user.email "$USER_EMAIL"

git add -fA
git commit --allow-empty -m "$(git log -1 --pretty=%B) [ci skip]"
git push -f $ORIGIN_URL gh-pages

# Move back to previous branch.
git checkout -

echo "Deployed Successfully!"

exit 0

#!/bin/bash
set -e

if [ -f .git/info/exclude ]; then
  echo "Removing line from .git/info/exclude"
  cp .git/info/exclude .git/info/exclude-bak
  grep -v .convox-build .git/info/exclude-bak > .git/info/exclude
  rm .git/info/exclude-bak
fi

if git config remote.convox.url > /dev/null; then
  echo "Removing convox git remote"
  git remote remove convox
fi

echo "Removing .convox-build"
rm -rf .convox-build

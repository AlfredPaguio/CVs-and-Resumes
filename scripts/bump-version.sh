#!/bin/bash

current_version=$1

major=$(echo $current_version | cut -d. -f1)
minor=$(echo $current_version | cut -d. -f2)
patch=$(echo $current_version | cut -d. -f3)

if [[ "$1" == "" ]]; then
  next_version="v1.0.0"
else
  if [[ $minor -lt 9 ]]; then
    minor=$((minor + 1))
    next_version="v$major.$minor.$patch"
  else
    minor="0"
    major=$((major + 1))
    next_version="v$major.$minor.$patch"
  fi

fi

echo "$next_version"
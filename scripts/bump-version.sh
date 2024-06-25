#!/bin/bash

# Parse arguments
while [[ "$#" -gt 0 ]]; do
  case $1 in
  --patch) patch=true ;;
  *) current_version="$1" ;;
  esac
  shift
done

if [ -z "$current_version" ]; then
  current_version="1.0.0"
fi

major=$(echo $current_version | cut -d. -f1 | sed 's/v//')
minor=$(echo $current_version | cut -d. -f2)
patch=$(echo $current_version | cut -d. -f3)

if [ -n "$patch" ] && [ "$patch" -lt 9 ] && [ -n "$patch" ]; then
  next_patch=$((patch + 1))
  next_version="$major.$minor.$next_patch"
else
  minor="0"
  major=$((major + 1))
  next_version="$major.$minor.$patch"
fi

echo "$next_version"

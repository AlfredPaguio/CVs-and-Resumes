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
elif [ -n "$minor" ] && [ "$minor" -lt 9 ]; then
  next_minor=$((minor + 1))
  next_version="$major.$next_minor.0"
else
  major=$((major + 1))
  next_version="$major.0.0"
fi

echo "$next_version"

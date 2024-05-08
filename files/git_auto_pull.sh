#!/usr/bin/env sh

for d in */ ; do
    echo "Processing $d..."

    cd $d
    # Check if the directory is a git repository
    if git rev-parse --git-dir > /dev/null 2>&1; then
        echo "$d is a git repository"
        git pull
    else
        echo "$d is not a git repository"
    fi
    cd ..
done

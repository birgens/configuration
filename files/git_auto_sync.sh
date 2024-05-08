#!/usr/bin/env sh

current_date=$(date +%Y-%m-%d)
echo $current_date
message="Auto commit of changes on $current_date"
echo "$message"

for d in */ ; do
    echo "Processing $d..."

    cd $d
    # Check if the directory is a git repository
    if git rev-parse --git-dir > /dev/null 2>&1; then
        echo "$d is a git repository"

        git add .

        git commit -m "$message"

        git push origin $(git rev-parse --abbrev-ref HEAD)
    else
        echo "$d is not a git repository"
    fi
    cd ..
done

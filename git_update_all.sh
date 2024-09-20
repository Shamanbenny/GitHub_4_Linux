#!/bin/bash

# Directory containing all the repositories
REPO_DIR=~/_gitHubRepo

# Iterate over each folder in the directory
for repo in "$REPO_DIR"/*/; do
    # Check if the folder is a Git repository (i.e., it contains a .git folder)
    if [[ -d "$repo/.git" ]]; then
        echo "[START] Updating repository: $repo"
        cd "$repo" || exit
        # Perform git fetch and git pull
        git fetch && git pull
        echo -e "[END]   Finished updating $repo\n"
    else
        echo -e "[NOTE]  $repo is not a Git repository, skipping...\n"
    fi
done
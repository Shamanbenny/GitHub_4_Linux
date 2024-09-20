#!/bin/bash

# Define the directory containing the Git repositories
REPO_DIR=~/_gitHubRepo
# Define the file where the last execution timestamp is stored
TIMESTAMP_FILE=~/.git_update_timestamp

# Get the current time in seconds since epoch
CURRENT_TIME=$(date +%s)

# Check if the timestamp file exists
if [[ -f "$TIMESTAMP_FILE" ]]; then
    # Read the last execution time from the file
    LAST_RUN=$(cat "$TIMESTAMP_FILE")
    
    # Calculate the time difference in hours (3600 seconds in 1 hour)
    TIME_DIFF=$(( (CURRENT_TIME - LAST_RUN) / 3600 ))

    # If the time difference is less than 12 hours, exit the script
    if [[ "$TIME_DIFF" -lt 12 ]]; then
        echo "[GIT UPDATE] Last run was $TIME_DIFF hours ago. Exiting."
        exit 0
    fi
fi

# Iterate over every subdirectory in the repository folder
for repo in "$REPO_DIR"/*/; do
    if [[ -d "$repo/.git" ]]; then
        echo "[GIT UPDATE] Updating repository: $repo"
        cd "$repo"
        git fetch && git pull
    fi
done

# Update the timestamp file with the current time
echo "$CURRENT_TIME" > "$TIMESTAMP_FILE"
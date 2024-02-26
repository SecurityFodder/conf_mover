#!/bin/bash

root_directory="/path/to/your/directories"  # Replace with your root directory
test_mode=true  # Set to false to make the changes

for dir in "$root_directory"/*/; do
    cd "$dir"
    if [[ -f "savedsearches.conf" ]]; then
        folder_name=$(basename "$dir")

        if $test_mode; then
            echo "Would rename: savedsearches.conf -> $folder_name.conf"
            echo "Would move: $dir$folder_name.conf -> $dir../" 
        else 
            mv "savedsearches.conf" "$folder_name.conf"
            mv "$dir$folder_name.conf" "$dir../"  # Move to parent directory
            rmdir "$dir"  # Remove the now-empty directory 
        fi
    fi
done

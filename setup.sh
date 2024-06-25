#!/bin/bash

# Check if a directory exists
DIR="my_nix_env"
if [ -d "$DIR" ]; then
  echo "$DIR already exists. Please remove it or choose a different directory."
  exit 1
fi

# Create the directory and navigate into it
mkdir $DIR
cd $DIR

# Download the default.nix file
curl -O https://raw.githubusercontent.com/your_username/your_repo/main/default.nix

# Run nix-shell
nix-shell


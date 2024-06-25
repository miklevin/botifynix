#!/bin/bash

# Directory for the Nix environment
DIR="repos"

# Check if the directory already exists
if [ -d "$DIR" ]; then
  echo "Directory $DIR already exists. Please remove it or choose a different directory."
  exit 1
fi

# Create the directory and navigate into it
mkdir $DIR
cd $DIR || { echo "Failed to enter directory $DIR"; exit 1; }

# Download the default.nix file
curl -O https://raw.githubusercontent.com/miklevin/botifynix/main/default.nix || { echo "Failed to download default.nix"; exit 1; }

# Run nix-shell
nix-shell || { echo "Failed to run nix-shell"; exit 1; }


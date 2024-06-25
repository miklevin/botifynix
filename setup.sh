#!/bin/bash

# Directory for the Nix environment
DIR="repos"
REPO_DIR="$DIR/AuditByBotify"
REPO_URL="git@github.com:miklevin/AuditByBotify.git"

# Check if the directory already exists
if [ -d "$REPO_DIR" ]; then
  echo "Directory $REPO_DIR already exists. Please remove it or choose a different directory."
  exit 1
fi

# Create the directory for the repository
mkdir -p "$DIR"

# Clone the repository if it doesn't exist
if [ ! -d "$REPO_DIR" ]; then
  git clone "$REPO_URL" "$REPO_DIR" || { echo "Failed to clone repository"; exit 1; }
else
  echo "Repository already cloned."
fi

# Download the default.nix file
curl -o "$REPO_DIR/default.nix" https://raw.githubusercontent.com/miklevin/botifynix/main/default.nix || { echo "Failed to download default.nix"; exit 1; }

# Navigate to the repository directory
cd "$REPO_DIR" || { echo "Failed to enter directory $REPO_DIR"; exit 1; }

# Run nix-shell
nix-shell || { echo "Failed to run nix-shell"; exit 1; }


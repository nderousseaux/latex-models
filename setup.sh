#!/bin/bash

# Installation script for custom LaTeX models
# Creates a symbolic link to the project directory in ~/texmf/tex/latex/perso

# Colors for display
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Source directory (where this script is located)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Target directory
TARGET_DIR="$HOME/texmf/tex/latex/perso"

echo "Installing LaTeX models..."
echo "Source: $SCRIPT_DIR"
echo "Target: $TARGET_DIR"
echo ""

# Create parent directory if necessary
mkdir -p "$(dirname "$TARGET_DIR")"

# Check if link already exists
if [ -L "$TARGET_DIR" ]; then
    echo -e "${RED}The symbolic link already exists.${NC}"
    read -p "Do you want to recreate it? (y/N) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm "$TARGET_DIR"
    else
        echo "Installation cancelled."
        exit 0
    fi
elif [ -e "$TARGET_DIR" ]; then
    echo -e "${RED}Error: $TARGET_DIR already exists but is not a symbolic link.${NC}"
    exit 1
fi

# Create symbolic link
ln -s "$SCRIPT_DIR" "$TARGET_DIR"

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Installation successful!${NC}"
    echo ""
    echo "You can now use the models with:"
    echo "  \\RequirePackage{packageName}"
    echo "  \\documentclass{className}"
else
    echo -e "${RED}✗ Error creating symbolic link.${NC}"
    exit 1
fi
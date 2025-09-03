#!/bin/bash

# ==============================================
# Lab Assignment 4 - Bash Section (Q1–Q6)
# Beginner-Friendly Version
# ==============================================

# Q1
echo "Q1:"
# Extract unique words from essay.txt (case-insensitive), sort, and print in lowercase
cat essay.txt | tr 'A-Z' 'a-z' | tr -c 'a-z0-9' '\n' | sort | uniq

echo ""


# Q2
echo "Q2:"
# Count regular files, directories, and symbolic links in current directory (non-recursive)
files=$(ls -l | grep "^-" | wc -l)
dirs=$(ls -l | grep "^d" | wc -l)
symlinks=$(ls -l | grep "^l" | wc -l)

echo "Files: $files"
echo "Directories: $dirs"
echo "Symlinks: $symlinks"

echo ""


# Q3
echo "Q3:"
# Print top 5 largest files in 'bigfiles' directory (filename - size), sorted descending
ls -lhS bigfiles | grep "^-" | head -n 5 | awk '{print $9 " - " $5}'

echo ""


# Q4
echo "Q4:"
# Print essay.txt with line numbers (1-based)
cat -n essay.txt | sed 's/^[ \t]*//;s/\t/: /'

echo ""


# Q5
echo "Q5:"
# Print current user's info
echo "User: $USER"
echo "Home: $HOME"
echo "Shell: $SHELL"

echo ""


# Q6
echo "Q6:"
# Find all files modified in last 24 hours in current directory (non-recursive)
ls -lt --time-style=+%s | awk -v now=$(date +%s) '$6 >= now-86400 {print $7}'


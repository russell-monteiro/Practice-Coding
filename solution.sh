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





#!/bin/bash

# ==============================================
# Lab Assignment 4 - Bash Section (Q1–Q6)
# Beginner-Friendly Version (with explanations)
# ==============================================

# Q1
echo "Q1:"
# Task: Extract unique words from essay.txt (case-insensitive),
#       sort them, and print all in lowercase.
#
# Step 1: cat essay.txt         → show the file content
# Step 2: tr 'A-Z' 'a-z'        → convert all uppercase to lowercase
# Step 3: tr -c 'a-z0-9' '\n'   → replace non-alphanumeric characters with newlines (splits words)
# Step 4: sort                  → sort words alphabetically
# Step 5: uniq                  → remove duplicates
cat essay.txt | tr 'A-Z' 'a-z' | tr -c 'a-z0-9' '\n' | sort | uniq

echo ""


# Q2
echo "Q2:"
# Task: Count files, directories, and symbolic links in current directory (non-recursive).
#
# ls -l      → shows a detailed list of files in current directory
# grep "^-"  → filters regular files (lines starting with "-")
# grep "^d"  → filters directories (lines starting with "d")
# grep "^l"  → filters symlinks (lines starting with "l")
# wc -l      → counts the number of lines
files=$(ls -l | grep "^-" | wc -l)
dirs=$(ls -l | grep "^d" | wc -l)
symlinks=$(ls -l | grep "^l" | wc -l)

echo "Files: $files"
echo "Directories: $dirs"
echo "Symlinks: $symlinks"

echo ""


# Q3
echo "Q3:"
# Task: Print top 5 largest files in 'bigfiles' directory.
# Format: filename - size
#
# ls -lhS bigfiles   → list files in human-readable sizes (-h), sorted by size (-S)
# grep "^-"          → keep only files (ignore directories)
# head -n 5          → take first 5 (largest ones)
# awk '{print $9 " - " $5}' → print filename ($9) and size ($5)
ls -lhS bigfiles | grep "^-" | head -n 5 | awk '{print $9 " - " $5}'

echo ""


# Q4
echo "Q4:"
# Task: Print essay.txt with line numbers in format "1: line".
#
# cat -n essay.txt   → add line numbers with a tab
# sed 's/^[ \t]*//;s/\t/: /' → remove extra spaces and replace tab with ": "
cat -n essay.txt | sed 's/^[ \t]*//;s/\t/: /'

echo ""


# Q5
echo "Q5:"
# Task: Print current user's info.
#
# $USER  → username
# $HOME  → home directory
# $SHELL → login shell
echo "User: $USER"
echo "Home: $HOME"
echo "Shell: $SHELL"

echo ""


# Q6
echo "Q6:"
# Task: Find files modified in last 24 hours (non-recursive).
#
# ls -lt --time-style=+%s → list files with modification time in seconds since epoch
# date +%s               → current time in seconds
# awk                    → compare file's timestamp ($6) with (now - 86400)
#                          86400 seconds = 24 hours
ls -lt --time-style=+%s | awk -v now=$(date +%s) '$6 >= now-86400 {print $7}'



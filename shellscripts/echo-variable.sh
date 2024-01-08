#!/bin/bash

# Display information about Linux environment variables

echo "Hostname: $(hostname)"
echo "User: $(whoami)"
echo "Home directory: $HOME"
echo "Current working directory: $(pwd)"
echo "Shell: $SHELL"
echo "Path: $PATH"
echo "User ID: $UID"
echo "Group ID: $GROUPS"
echo "Terminal: $TERM"
echo "Editor: $EDITOR"
echo "Language: $LANG"
echo "Display: $DISPLAY"
echo "Number of processors: $(nproc)"
echo "Kernel version: $(uname -r)"
echo "Memory information:"
free -h

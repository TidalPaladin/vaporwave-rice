#!/bin/sh
# Generates symlinks from config files in the repo
# to various the appropriate system locations

echo "Making void-linux symlinks"
find -name symlinks.sh -execdir "bash" {} +

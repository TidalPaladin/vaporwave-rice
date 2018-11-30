#!/bin/sh
#
# Generates symlinks from config files in the repo
# to the appropriate system locations. Recusively searches for
# 'symlinks.sh', executing each script in it's respective folder.

echo "Making symlinks"
find -name symlinks.sh -execdir "bash" {} +

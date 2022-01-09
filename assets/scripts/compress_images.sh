#!/bin/bash

# script to compress images to quality 85% and width 1280px
# usage
# bash ~/github/royfrancis.github.io/assets/scripts/compress_images.sh gallery

size_dir_before=$(du -sh $1 | cut -f1)

paths=$(find $1 -name "*.jpg")
for path in $paths
 do
  size_before=$(du -k "$path" | cut -f1)
  mogrify -quality 85 -resize "1280x1280>" $path
  size_after=$(du -k "$path" | cut -f1)
  echo "$path, Size before: $size_before KB, Size after: $size_after KB"
  
 done
 
size_dir_after=$(du -sh $1 | cut -f1)
echo "$1, Size before: $size_dir_before, Size after: $size_dir_after"

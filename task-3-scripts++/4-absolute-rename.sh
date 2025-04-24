#!/bin/bash

if [ -z "$1" ]; then
  echo "Provide path to images directory!"
  exit 1
fi

DIR="$1"

if [ ! -d "$DIR" ]; then
  echo "No such directory!"
  exit 1
fi

cd "$DIR"

for file in *.jpg *.jpeg; do
  if [ -f "$file" ]; then
    DATE=$(exiftool -DateTimeOriginal -d "%Y:%m:%d" "$file" | awk -F': ' '{print $2}')
    
    if [ -n "$DATE" ]; then
      EXT="${file##*.}"
      
      NEW_NAME="${DATE//:/-}_${file%.*}.$EXT"
      
      mv "$file" "$NEW_NAME"
      echo "$file -> $NEW_NAME"
    else
      echo "Unable to extract the date from file $file"
    fi
  fi
done

#!/bin/bash

# Loop through each file that starts with "Dockerfile"
for file in Dockerfile*; do
  # Extract the tag by removing the "Dockerfile" prefix
  tag=${file#Dockerfile}
  
  # If the tag is empty (for the plain "Dockerfile"), use a default tag
  if [[ -z "$tag" ]]; then
    tag="default"
  else
    # Remove any leading hyphen from the tag
    tag=${tag#-}
  fi

  # Build the Docker image with the appropriate tag
  echo "Building Docker image with tag: $tag"
  docker build -f "$file" -t "java-image:$tag" .
done


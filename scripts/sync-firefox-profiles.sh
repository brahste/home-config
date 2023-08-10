#!/bin/bash

function get_latest_file() {
  local latest_time=0
  local latest_file=""
  local fname=$1

  fd -HIg ${fname} ${HOME} | (while read -r file; do
      current_time=$(stat -c %Y "$file")
      if (( current_time > latest_time )); then
          latest_time=$current_time
          latest_file=$file
      fi
    done && echo $latest_file)
}

function cache_and_copy() {
  local latest_file=$1
  local fname=$2

  if [[ -n $latest_file ]]; then
      echo "The most recently modified file is: $latest_file"
      cp $latest_file $HOME/.cache/$fname
      fd -HIg ${fname} $HOME | while read -r file; do
        cp $HOME/.cache/$fname $file
        echo "Copied cached file to $file"
      done
  else
      echo "No matching files found for: $fname"
  fi
}

function main() {
  local places_fname="places.sqlite"
  local favicons_fname="favicons.sqlite"
  local latest_places_file=$(get_latest_file $places_fname)
  local latest_favicons_file=$(get_latest_file $favicons_fname)

  cache_and_copy $latest_places_file $places_fname
  cache_and_copy $latest_favicons_file $favicons_fname
}

main

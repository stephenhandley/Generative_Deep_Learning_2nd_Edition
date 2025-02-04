#!/bin/bash

json_out() {
  local data=$1

  # Get the script name without the .sh extension
  local key=$(basename "$0" .sh)

  echo "{\"$key\": $data}"
}

json_in() {
  local key=$1
  read -r json_input
  echo "$json_input" | jq -r --arg key "$key" '.[$key]'
}

json_run() {
  local script=$1
  local json_data=${2:-'{}'}

  # Determine the key based on the script name
  local key=$(basename "$script" .sh)

  # Run the script and pass JSON data to it, then capture its JSON output
  local json_output=$("$script" "$json_data")

  # Use jq to extract the value for the specified key from the JSON output
  local result=$(echo "$json_output" | jq -r --arg key "$key" '.[$key]')

  echo "$result"
}

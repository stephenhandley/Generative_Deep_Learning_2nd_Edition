#!/bin/bash

source ./json.sh # Assuming this contains the json_out function

if command -v nvidia-smi &>/dev/null; then
  num_gpus=$(nvidia-smi --list-gpus | wc -l)
else
  num_gpus=0
fi

json_out $num_gpus

source ./json.sh

num_gpus=$(json_run ./num_gpus.sh)

echo "There are $num_gpus gpus"

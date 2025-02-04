source ./json.sh

num_gpus=$(json_run ./num_gpus.sh)

if [ "$num_gpus" -gt 0 ]; then
  echo "GPUs detected: $num_gpus. Using GPU configuration."
  docker-compose -f docker-compose.gpu.yml build
else
  echo "No GPUs detected. Using standard configuration."
  docker-compose build
fi

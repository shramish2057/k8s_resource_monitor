#!/bin/bash

# Activate the virtual environment
echo "Activating virtual environment..."
source .venv/bin/activate

# Check for --use-mock flag
USE_MOCK_FLAG=""
if [[ "$1" == "--use-mock" ]]; then
  USE_MOCK_FLAG="--use-mock"
  echo "Using mock Kubernetes API"
else
  echo "Using real Kubernetes API"
fi

# Run the Python script with the appropriate flag
echo "Running the Python script with the following arguments: $USE_MOCK_FLAG"
python3 -m k8s_monitor.cli monitor --namespace default $USE_MOCK_FLAG

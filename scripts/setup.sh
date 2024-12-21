#!/bin/bash

# Exit the script if any command fails
set -e

echo "============================================================================================="
echo "Starting to Setup the Flask app... setup.sh"
echo "============================================================================================="


# Check if DVC is already initialized
if [ ! -d ".dvc" ]; then
    echo "Initializing DVC..."
    dvc init || { echo "Failed to initialize DVC"; exit 1; }
else
    echo "DVC is already initialized."
fi

# Install dependencies
echo "Installing dependencies..."
pip install -r requirements.txt || { echo "Failed to install dependencies"; exit 1; }

# Initialize DVC for dataset if not already initialized
if [ ! -f "data/dataset.csv.dvc" ]; then
    echo "Tracking dataset with DVC..."
    dvc add data/dataset.csv || { echo "Failed to add dataset to DVC"; exit 1; }
else
    echo "Dataset is already tracked by DVC."
fi

# Setup complete
echo "Setup completed successfully!"

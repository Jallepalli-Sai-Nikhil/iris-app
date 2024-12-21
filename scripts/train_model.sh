#!/bin/bash

# Exit the script if any command fails
set -e

echo "============================================================================================="
echo "Starting to train the model... train_model.sh"
echo "============================================================================================="


# Activate virtual environment
echo "Activating virtual environment..."
source venv/Scripts/activate || { echo "Failed to activate virtual environment"; exit 1; }

# Run the training script
echo "Training the model..."
dvc repro || { echo "Model training failed"; exit 1; }

echo "Model training completed successfully!"

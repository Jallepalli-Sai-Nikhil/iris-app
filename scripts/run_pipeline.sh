#!/bin/bash

# Exit the script if any command fails
set -e

echo "============================================================================================="
echo "Starting to run the pipeline app... run_pipeline.sh"
echo "============================================================================================="


# Step 1: Set up the environment (create virtual environment, install dependencies, initialize DVC)
echo "Running setup..."
./scripts/setup.sh || { echo "Setup failed"; exit 1; }

# Step 2: Train the model
echo "Training the model..."
./scripts/train_model.sh || { echo "Model training failed"; exit 1; }

# Step 3: Run the Flask app
echo "Starting the Flask app..."
./scripts/run_app.sh || { echo "Flask app failed to start"; exit 1; }

echo "Pipeline completed successfully!"

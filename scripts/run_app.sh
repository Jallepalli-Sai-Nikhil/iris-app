#!/bin/bash

# Exit the script if any command fails
set -e


echo "============================================================================================="
echo "Starting to run the Flask app... run_app.sh"
echo "============================================================================================="


# Activate virtual environment
echo "Activating virtual environment..."
source venv/Scripts/activate || { echo "Failed to activate virtual environment"; exit 1; }

# Run the Flask app
echo "Running the Flask app..."
python app.py || { echo "Failed to run Flask app"; exit 1; }

echo "Flask app is running successfully!"

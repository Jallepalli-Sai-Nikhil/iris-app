import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
import pickle
import os  # For creating directories if not exist

# Load the Iris dataset
data = pd.read_csv('data/dataset.csv')

# Prepare features and labels
X = data.drop(columns=['species'])
y = data['species']

# Split the data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Initialize the model
model = RandomForestClassifier()

# Train the model
model.fit(X_train, y_train)

# Create the models directory if it doesn't exist
os.makedirs('models', exist_ok=True)

# Save the trained model
with open('models/model.pkl', 'wb') as f:
    pickle.dump(model, f)

print("Model training completed and saved as model.pkl")

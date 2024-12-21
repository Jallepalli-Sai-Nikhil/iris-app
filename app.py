from flask import Flask, render_template, request
import pickle
import numpy as np

app = Flask(__name__, template_folder='templates/')

# Load the pre-trained model
with open('models/model.pkl', 'rb') as f:
    model = pickle.load(f)

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/predict', methods=['POST'])
def predict():
    # Get input from the HTML form
    sepal_length = float(request.form['sepal_length'])
    sepal_width = float(request.form['sepal_width'])
    petal_length = float(request.form['petal_length'])
    petal_width = float(request.form['petal_width'])

    # Prepare the input features for prediction
    features = np.array([[sepal_length, sepal_width, petal_length, petal_width]])

    # Make prediction
    prediction = model.predict(features)

    # Map the prediction to the Iris species
    species = ['setosa', 'versicolor', 'virginica']
    predicted_species = species[prediction[0]]

    return render_template('index.html', prediction=predicted_species)

if __name__ == '__main__':
    app.run(debug=True)

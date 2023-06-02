import pandas as pd
import numpy as np
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
import pickle
from flask import Flask, render_template, request

app = Flask(__name__, template_folder='templates')

# Load the encoding mappings
with open('encoding_mappings.pkl', 'rb') as file:
    encoding_mappings = pickle.load(file)
    X_encoded_columns = encoding_mappings['X_encoded_columns']
    X_encoded_dtypes = encoding_mappings['X_encoded_dtypes']

# Load the trained model
with open('model.pkl', 'rb') as file:
    model = pickle.load(file)

# Define the home page route
@app.route('/')
def home():
    dataset = pd.read_csv('desalination.csv') 
    regions = dataset['Region'].unique().tolist()
    districts = dataset['District'].unique().tolist()
    return render_template('home.html', regions=regions, districts=districts)

# Define the predict route
@app.route('/predict', methods=['POST'])
def predict():
    # Get the user input from the form
    District = str(request.form['District'])
    Region = str(request.form['Region'])
    Population= int(request.form['Population'])
    AnnualRainfall = int(request.form['AnnualRainfall'])
    AverageTemperature = float(request.form['AverageTemperature'])
    DistancetoCoastline = int(request.form['DistancetoCoastline'])
    GroundwaterAvailability = int(request.form['GroundwaterAvailability'])
    Elevation = int(request.form['Elevation'])
    SoilSalinity = float(request.form['SoilSalinity'])
    IndustrialPollutionIndex = float(request.form['IndustrialPollutionIndex'])
    WaterQualityIndex = float(request.form['WaterQualityIndex'])

    # Create a DataFrame with the user input
    input_data = pd.DataFrame({
        'Population': [Population],
        'Annual Rainfall (mm)': [AnnualRainfall],
        'Average Temperature (°C)': [AverageTemperature],
        'Distance to Coastline (km)': [DistancetoCoastline],
        'Elevation (m)': [Elevation],
        'Groundwater Availability (m)': [GroundwaterAvailability],
        'Soil Salinity': [SoilSalinity],
        'Industrial Pollution Index': [IndustrialPollutionIndex],
        'Water Quality Index': [WaterQualityIndex],
        'District_' + District: [1],
        'Region_' + Region: [1]
    })

    # Perform one-hot encoding on the input data
    input_data_encoded = pd.get_dummies(input_data)

    # Realign the columns with the training data columns
    input_data_encoded = input_data_encoded.reindex(columns=X_encoded_columns, fill_value=0)

    # Ensure the input data has the correct data types
    input_data_encoded = input_data_encoded.astype(dict(zip(X_encoded_columns, X_encoded_dtypes)))

    # Make the prediction
    prediction = model.predict(input_data_encoded)

    # Return the predicted suitability level to the user
    if(prediction==0):
        prediction="Unsuitable"
    if(prediction==1):
        prediction="Suitable"
   
    
    return render_template('result.html', prediction_text='The Region  is {}'.format(prediction))

if __name__ == '__main__':
    app.run(debug=True)






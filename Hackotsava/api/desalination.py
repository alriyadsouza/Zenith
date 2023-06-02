import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
import pickle
import os
from sklearn.metrics import accuracy_score

df = pd.read_csv("desalination.csv")

# Separate features and target variable
X = df.drop('Suitability', axis=1)
y = df['Suitability']

# Perform one-hot encoding on categorical variables
X_encoded = pd.get_dummies(X, columns=['District', 'Region'])

# Save the encoding mappings
encoding_mappings = {
    'X_encoded_columns': X_encoded.columns.tolist(),
    'X_encoded_dtypes': X_encoded.dtypes.tolist()
}
with open('encoding_mappings.pkl', 'wb') as file:
    pickle.dump(encoding_mappings, file)

# Split the data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X_encoded, y, test_size=0.2)

# Create and train the Logistic Regression model
model = LogisticRegression()
model.fit(X_train, y_train)

# Evaluate the model on the testing set
y_pred = model.predict(X_test)
accuracy = accuracy_score(y_test, y_pred)
print("Accuracy:", accuracy)

# Save the trained model
with open('model.pkl', 'wb') as file:
    pickle.dump(model, file)



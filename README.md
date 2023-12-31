# Stroke Prediction Project

## Overview

This repository contains the code and documentation for a stroke prediction project. The goal of the project is to predict the likelihood of a stroke based on a dataset with 12 attributes and 5110 rows.

## About the Dataset
- According to the World Health Organization (WHO) stroke is the 2nd leading cause of death globally, responsible for approximately 11% of total deaths.
  This dataset is used to predict whether a patient is likely to get stroke based on the input parameters like gender, age, various diseases, and smoking status. Each row in the data provides relavant information   about the patient.
- The dataset used in this project contains 12 attributes and 5110 rows. There is also a targeted attribute named stroke.
## Attribute Information
- id: unique identifier
- gender: "Male", "Female" or "Other"
- age: age of the patient
- hypertension: 0 if the patient doesn't have hypertension, 1 if the patient has hypertension
- heart_disease: 0 if the patient doesn't have any heart diseases, 1 if the patient has a heart disease
- ever_married: "No" or "Yes"
7) work_type: "children", "Govt_jov", "Never_worked", "Private" or "Self-employed"
8) Residence_type: "Rural" or "Urban"
9) avg_glucose_level: average glucose level in blood
10) bmi: body mass index
11) smoking_status: "formerly smoked", "never smoked", "smokes" or "Unknown"*
12) stroke: 1 if the patient had a stroke or 0 if not
- Link to Dataset:  <a href="https://www.kaggle.com/datasets/fedesoriano/stroke-prediction-dataset?resource=download">Stroke Prediction Data set</a>

## Project Structure
- `data/`: Directory to store the dataset.
- `notebooks/`: Jupyter notebooks containing data exploration, preprocessing, and model training.
  - `1_data_exploration.ipynb`: Notebook for exploring the dataset.
  - `2_data_preprocessing.ipynb`: Notebook for preprocessing the data.
  - `3_model_training.ipynb`: Notebook for training the Naïve Bayes model.
- `scripts/`: Python scripts for modular code components.
- `requirements.txt`: File specifying project dependencies.
- `README.md`: Project documentation.


## Getting Started

1. Clone the repository:

   ```bash
   git clone https://github.com/NabilRaiyan/Stroke-Prediction.git
   cd stroke-prediction-project

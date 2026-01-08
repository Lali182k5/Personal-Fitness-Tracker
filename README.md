# 🏃‍♂️ Personal Fitness Tracker

## 📌 Overview
The **Personal Fitness Tracker** is a Python application that predicts calories burned based on user inputs such as age, BMI, heart rate, exercise duration, and body temperature. It combines machine learning with a simple interactive interface built using Streamlit.

This project emphasizes a clear data flow, explainable logic, and modular Python code rather than treating the system as a black box.

## 🎯 Problem Statement
Estimating calories burned during activity can be difficult without wearable devices. This project uses a **Random Forest Regression** model to provide calorie predictions based on user metrics, helping users better understand their fitness data.

## 🧠 How It Works
- The user inputs age, BMI, heart rate, exercise duration, and body temperature in the Streamlit UI.
- Input data is validated and processed using Pandas and NumPy.
- A pre-trained **Random Forest Regression** model predicts calories burned.
- Results and visualizations such as correlation heatmaps and distribution plots are displayed.

## 🛠️ Tech Stack
- **Python**
- **Streamlit** (UI)
- **scikit-learn** (Random Forest Regression)
- **Pandas & NumPy**
- **Matplotlib & Seaborn** (visualizations)

## 🏗 Project Architecture
    Personal-Fitness-Tracker/
    ├── app.py # Main Streamlit app
    ├── main.py # Model training & inference script
    ├── calories.csv # Dataset for calories
    ├── exercise.csv # Dataset for exercise metrics
    ├── requirements.txt # Dependencies
    ├── Dockerfile # Container setup
    ├── .streamlit/ # UI config
    └── aws-ecs-task-definition.json


Each file is focused on a single responsibility to improve maintainability and readability.

## 📥 Installation & Usage

### Clone the repository
```
git clone https://github.com/Lali182k5/Personal-Fitness-Tracker.git

cd Personal-Fitness-Tracker
```

### Install dependencies
```
pip install -r requirements.txt
```

### Run the application
```
streamlit run app.py
```

Once started, the Streamlit app opens in your browser and allows you to input metrics to get calorie predictions.

## ⚠️ Limitations
- The prediction model is only as good as the training data.
- Predictions may not generalize to all body types or unusual exercise activities.
- Requires two dataset files (`calories.csv` and `exercise.csv`) to run locally.

## 🚀 Future Improvements
- Add real-time heart rate sensor integration.
- Save user sessions to persistent storage (database).
- Expand dataset for broader coverage of exercises.
- Add unit tests and CI/CD automation.

## 📌 Key Learnings
- Built a complete ML + UI pipeline using Python and Streamlit.
- Applied Random Forest Regression and evaluated model performance.
- Used visualizations for fitness data insights.
- Structured code for maintainability and clarity.

## 🤝 Contributions
Contributions are welcome! Feel free to open issues or submit pull requests to improve accuracy, UI, or performance.






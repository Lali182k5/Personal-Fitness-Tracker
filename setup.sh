#!/bin/bash

# Personal Fitness Tracker - Quick Setup Script
# This script sets up the environment and starts the application

set -e

echo "🏋️ Personal Fitness Tracker - Quick Setup"
echo "=========================================="

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ Python3 is not installed. Please install Python 3.9+ first."
    exit 1
fi

# Check if pip is installed
if ! command -v pip &> /dev/null; then
    echo "❌ pip is not installed. Please install pip first."
    exit 1
fi

# Install requirements
echo "📦 Installing Python dependencies..."
pip install -r requirements.txt

# Check if CSV files exist
if [ ! -f "calories.csv" ]; then
    echo "❌ calories.csv not found in current directory!"
    exit 1
fi

if [ ! -f "exercise.csv" ]; then
    echo "❌ exercise.csv not found in current directory!"
    exit 1
fi

echo "✅ Setup complete!"
echo "🚀 Starting Streamlit application..."
echo "📱 The app will open in your browser automatically"
echo "🌐 Manual URL: http://localhost:8501"
echo ""
echo "Press Ctrl+C to stop the application"
echo ""

# Start Streamlit
streamlit run app.py --server.port=8501 --server.address=0.0.0.0
#!/usr/bin/env python3
"""
Vercel entry point for Streamlit app
"""
import subprocess
import sys
import os

def handler(request):
    """Handle Vercel requests"""
    # This is a workaround since Vercel doesn't natively support Streamlit
    # For production, consider using Streamlit Cloud or other platforms
    return {
        'statusCode': 200,
        'body': 'This Streamlit app is best deployed on Streamlit Cloud, Railway, or Heroku. Please see deployment instructions.',
        'headers': {
            'Content-Type': 'text/plain'
        }
    }

if __name__ == "__main__":
    # For local development
    os.system("streamlit run app.py --server.port=8501 --server.address=0.0.0.0")
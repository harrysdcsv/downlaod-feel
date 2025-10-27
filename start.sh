#!/bin/bash

# Start the Flask app in the background
python3 app.py &

# Start the Telegram bot
python3 modules/main.py

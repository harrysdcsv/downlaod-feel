#!/bin/bash

# Start the Flask app in the background
python app.py &

# Start the Telegram bot
python modules/main.py

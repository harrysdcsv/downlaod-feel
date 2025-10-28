#!/bin/bash

echo "🧹 Cleaning bot session files..."

# Remove session files from modules directory
rm -f modules/bot.session
rm -f modules/bot.session-journal

echo "✅ Session files cleaned successfully!"
echo "📝 Bot will create fresh sessions on next start"

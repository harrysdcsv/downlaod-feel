# SAINI DRM Bot

## Overview
This is a Telegram bot that extracts and downloads videos from text files and URLs. It supports various DRM-protected platforms including:
- Classplus DRM/NDRM
- PhysicsWallah DRM
- CareerWill
- Khan GS
- Study IQ DRM
- APPX encrypted content
- Vimeo, Brightcove, Visionias
- Zoom videos
- YouTube content
- And more non-DRM/AES encrypted URLs

## Project Structure
- `modules/main.py` - Main bot entry point with Telegram bot handlers
- `modules/drm_handler.py` - Handles DRM-protected content extraction
- `modules/html_handler.py` - Processes HTML/text file conversions
- `modules/youtube_handler.py` - YouTube-specific handlers
- `modules/broadcast.py` - Broadcasting functionality
- `modules/authorisation.py` - User authorization management
- `modules/vars.py` - Configuration variables
- `app.py` - Flask web server (for deployment platforms requiring web process)

## Recent Changes (October 27, 2025)
- Set up project for Replit environment
- Installed Python 3.12 and all required dependencies (pyrogram, tgcrypto, yt-dlp, etc.)
- Updated PhysicsWallah API endpoint to: `https://anonymouspwplayer-25261acd1521.herokuapp.com/pw`
- Configured Telegram API credentials via Replit Secrets (API_ID, API_HASH, BOT_TOKEN)
- Updated OWNER ID to: 7385595817
- Fixed syntax errors in vars.py (missing quote in REPO_URL)
- Fixed import statements in main.py (removed .py extension)
- Cleaned up modules/utils.py (removed erroneous "zerocanbot" text)
- Created .gitignore for Python project
- Set up workflow to run the bot - **Bot is now running successfully!**

## Environment Variables (Replit Secrets)
- API_ID - Telegram API ID
- API_HASH - Telegram API Hash  
- BOT_TOKEN - Telegram Bot Token

## Bot Commands
**User Commands:**
- /start - Start the bot
- /y2t - YouTube to .txt converter
- /ytm - YouTube to .mp3 downloader
- /t2t - Text to .txt generator
- /t2h - .txt to .html converter
- /stop - Cancel running task
- /cookies - Update YouTube cookies
- /id - Get chat/user ID
- /info - User details
- /logs - View bot activity

**Owner Commands:**
- /addauth - Add authorized user
- /rmauth - Remove authorized user
- /users - List all users
- /broadcast - Send broadcast message
- /broadusers - List broadcast users
- /reset - Reset bot

## Architecture
The bot uses Pyrogram for Telegram integration and supports batch video processing from text files. It handles multiple video platforms with DRM decryption capabilities.

## Dependencies
- pyrogram, tgcrypto - Telegram client
- yt-dlp - Video downloading
- aiohttp, aiofiles - Async HTTP/file operations
- pycryptodome - Encryption/decryption
- beautifulsoup4 - HTML parsing
- ffmpeg (system) - Video processing
- aria2 (system) - Download manager

# Deployment Guide for Render

## Prerequisites
Your bot is now fully configured for Render deployment with all dependencies including mp4decrypt.

## Files Prepared for Deployment

### 1. **Dockerfile** ✅
- Uses Python 3.12-slim base image
- Installs system dependencies: ffmpeg, aria2, wget, unzip, curl
- **Installs mp4decrypt from Bento4 pre-compiled binaries** (installed to `/usr/local/bin/`)
- Installs all Python dependencies from `sainibots.txt`
- Runs both Flask web server and Telegram bot

### 2. **start.sh** ✅
- Startup script that runs Flask app (for Render health checks)
- Runs Telegram bot in the background

### 3. **render.yaml** ✅
- Configuration for Render deployment
- Environment variables setup

### 4. **.dockerignore** ✅
- Optimizes Docker build by excluding unnecessary files

## Deployment Steps

### Option 1: Deploy via render.yaml (Recommended)

1. Push your code to GitHub repository
2. Go to [Render Dashboard](https://dashboard.render.com/)
3. Click "New" → "Blueprint"
4. Connect your GitHub repository
5. Render will automatically detect `render.yaml` and set up the service
6. Add your environment variables:
   - `BOT_TOKEN`: Your Telegram bot token
   - `API_ID`: Your Telegram API ID
   - `API_HASH`: Your Telegram API hash
   - `OWNER`: Your Telegram user ID (7385595817)
7. Click "Apply" to deploy

### Option 2: Manual Deployment

1. Push your code to GitHub
2. Go to Render Dashboard
3. Click "New" → "Web Service"
4. Connect your repository
5. Configure:
   - **Environment**: Docker
   - **Dockerfile Path**: `Dockerfile`
   - **Plan**: Free
6. Add environment variables (same as above)
7. Click "Create Web Service"

## Environment Variables Required

```
BOT_TOKEN=your_bot_token_here
API_ID=11557752
API_HASH=127b73bd59f71ee4ade8bb2161f1228f
OWNER=7385595817
CREDIT=Harry
PORT=8000
```

## Features Included in Dockerfile

✅ **mp4decrypt** - For DRM video decryption (Bento4 toolkit)
✅ **ffmpeg** - For video processing and merging
✅ **aria2** - Fast download manager
✅ **yt-dlp** - Latest version for video downloads
✅ **All Python dependencies** - From sainibots.txt

## How It Works

1. **Flask App** (app.py) runs on port 8000 - keeps the service alive for Render
2. **Telegram Bot** (modules/main.py) runs in background - processes video downloads
3. **mp4decrypt** is available system-wide at `/usr/local/bin/mp4decrypt`
4. **Downloads folder** is created automatically

## Verifying Deployment

After deployment:
1. Check Render logs to ensure both Flask and bot are running
2. Send a test message to your Telegram bot
3. Try downloading a Classplus video to verify DRM decryption works

## Troubleshooting

### If mp4decrypt fails:
- Check Render logs for errors
- Verify `/usr/local/bin/mp4decrypt` exists in container
- The code automatically falls back to local path if system path fails

### If bot doesn't start:
- Verify all environment variables are set correctly
- Check Render logs for Python errors
- Ensure sainibots.txt dependencies installed successfully

## Notes

- Free tier on Render may have limitations on compute and storage
- Downloads folder is ephemeral - files are temporary
- The service will auto-sleep on free tier after 15 minutes of inactivity
- Flask web server prevents the service from sleeping

## Support

Bot configured by: Harry
User ID: 7385595817
Classplus API User ID: 7385595817 (hardcoded in drm_handler.py)

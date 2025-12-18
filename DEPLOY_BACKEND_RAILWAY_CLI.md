# Deploy Backend Using Railway CLI

Since the dashboard root directory setting isn't working, use the Railway CLI for proper deployment.

---

## Option 1: Deploy with Railway CLI (Recommended)

### Step 1: Install Railway CLI

```bash
npm install -g @railway/cli
```

Or on Windows with PowerShell:
```powershell
iwr https://railway.app/install.ps1 | iex
```

### Step 2: Login to Railway

```bash
railway login
```

This will open your browser to authenticate.

### Step 3: Navigate to Backend Folder

```bash
cd backend
```

### Step 4: Initialize Railway (if new service)

```bash
railway init
```

Select your existing project or create a new one.

### Step 5: Deploy Backend

```bash
railway up
```

This will deploy ONLY the backend folder!

### Step 6: Add Environment Variables

```bash
railway variables set QWEN_API_KEY=your-key-here
railway variables set QDRANT_URL=your-url-here
railway variables set QDRANT_API_KEY=your-key-here
railway variables set DATABASE_URL=your-db-url-here
railway variables set CORS_ORIGINS=*
```

Or add them in the dashboard after deployment.

---

## Option 2: Create New Service from Dashboard

### Step 1: Delete Current Service (Optional)

1. Go to Railway dashboard
2. Click on the problematic service
3. Settings → Delete Service

### Step 2: Create New Service

1. Click **"+ New"** in your Railway project
2. Select **"GitHub Repo"**
3. Choose your repository: `Physical-AI-Chatbot`
4. **IMPORTANT**: When asked for "Root Directory", enter: `backend`
5. Click "Deploy"

### Step 3: Configure Environment Variables

Add these in Variables tab:
```bash
QWEN_API_KEY=your-openrouter-key
QDRANT_URL=https://your-cluster.cloud.qdrant.io:6333
QDRANT_API_KEY=your-qdrant-key
DATABASE_URL=postgresql://your-connection-string
CORS_ORIGINS=*
```

---

## Option 3: Use Dockerfile Deployment

In Railway dashboard:

1. Go to Service → Settings
2. Find **"Build Settings"**
3. Change **"Builder"** from "Nixpacks" to **"Dockerfile"**
4. Set **"Dockerfile Path"** to: `backend/Dockerfile`
5. Save and redeploy

---

## Verify Deployment

After using any option above, test:

1. **Get your Railway URL** from Settings → Networking
2. **Visit**: `https://your-backend-url.up.railway.app/docs`
3. **Should see**: FastAPI Swagger documentation

---

## Why Dashboard Root Directory Failed

Railway's dashboard root directory setting sometimes doesn't work correctly when:
- Repository has multiple package.json files
- Mixed frontend/backend in same repo
- Nixpacks auto-detection gets confused

Using CLI or creating a fresh service avoids these issues.

---

## Recommended: Use Railway CLI

The CLI is the most reliable way:

```bash
# From your project root
cd backend
railway login
railway init
railway up
railway variables set QWEN_API_KEY=your-key
# ... set other variables
```

Done! Your backend will be deployed correctly.

---

## Need the Environment Variables?

See: `BACKEND_RAILWAY_SETUP.md` for the complete list of required variables.

---

Good luck! 🚀

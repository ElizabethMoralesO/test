# Quick Setup Guide: GitHub Secret with PAT

## Step 1: Create Personal Access Token

1. Go to: https://github.com/settings/tokens
2. Click "Generate new token (classic)"
3. Name: `Workflow Trigger PAT`
4. Expiration: Choose as needed (No expiration for permanent use)
5. ✅ Check **`repo`** scope only
6. Click "Generate token"
7. **COPY THE TOKEN** (you won't see it again!)

## Step 2: Add to Repository Secrets

1. Go to this repository's **Settings** tab
2. Click **"Secrets and variables"** → **"Actions"**
3. Click **"New repository secret"**
4. **Name**: `WORKFLOW_PAT`
5. **Secret**: Paste your token from Step 1
6. Click **"Add secret"**

## ✅ That's it!

Your GitHub Pages site will now be able to trigger workflows without requiring users to authenticate.

## 🔒 Security Notes

- The PAT is stored securely in GitHub secrets
- Only repository workflows can access it
- Users never see or need the token
- You can rotate the token anytime by updating the secret

## 🎯 Test It

1. Visit: https://elizabethmoraleso.github.io/test/
2. Fill out the form
3. Click "Trigger Dummy Workflow"
4. Check the Actions tab to see it running!

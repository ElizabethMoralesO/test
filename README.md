# Advanced GitHub Actions with Unlimited Inputs

This repository demonstrates how to **overcome GitHub Actions' 10-input limitation** using GitHub Pages to generate JSON payloads for complex workflow configurations.

## 🚀 Key Features

- **🔢 Unlimited Inputs**: Overcome GitHub's 10-input limit using JSON payloads
- **🎨 User-Friendly Interface**: Web-based configuration instead of YAML editing
- **📊 Dynamic Matrices**: Generate job matrices from JSON configuration
- **🔄 Reusable Workflows**: Template-based workflow execution
- **⚡ Real-time Preview**: See generated JSON as you configure
- **🎯 15+ Input Fields**: Demonstrates deployment, application, database, and advanced settings
- **🔧 Extensible**: Easy to add API integrations and custom validation

## 📁 Repository Structure

```
├── .github/
│   └── workflows/
│       ├── dummy-workflow.yaml     # The dummy workflow to be triggered
│       └── deploy-pages.yaml       # Deploys GitHub Pages automatically
├── index.html                      # GitHub Pages trigger interface
├── customer.ps1                    # Existing PowerShell script
└── README.md                       # This file
```

## 🔧 Setup Instructions

### 1. Enable GitHub Pages

1. Go to your repository settings
2. Navigate to "Pages" in the left sidebar
3. Under "Source", select "GitHub Actions"
4. The Pages deployment workflow will run automatically

### 2. Authentication Setup (Choose One)

#### Option A: GitHub OAuth (Recommended - Requires Setup)

1. Go to [GitHub Settings > Developer settings > OAuth Apps](https://github.com/settings/developers)
2. Click "New OAuth App"
3. Fill in the details:
   - **Application name**: "Workflow Trigger"
   - **Homepage URL**: `https://elizabethmoraleso.github.io/test/`
   - **Authorization callback URL**: `https://elizabethmoraleso.github.io/test/`
4. Copy the **Client ID** and update `GITHUB_CLIENT_ID` in `index.html`
5. Users can now login with their GitHub accounts - no tokens needed!

### 2. Create a Personal Access Token

1. Go to [GitHub Settings > Developer settings > Personal access tokens](https://github.com/settings/tokens)
2. Click "Generate new token (classic)"
3. Give it a name like "Workflow Trigger PAT"
4. Set expiration (or no expiration for permanent use)
5. ✅ Check the **`repo`** scope (full control of private repositories)
6. Click "Generate token" and **copy it immediately**

### 3. Add PAT to Repository Secrets

1. Go to your repository **Settings**
2. Navigate to **"Secrets and variables"** → **"Actions"**
3. Click **"New repository secret"**
4. Name: `WORKFLOW_PAT`
5. Value: _Paste your Personal Access Token_
6. Click **"Add secret"**

### 4. Access the Trigger Interface

Once GitHub Pages is deployed, access the interface at:
`https://elizabethmoraleso.github.io/test/`

## 🎯 How to Use

1. **Open the GitHub Pages site** (link above)
2. **Enter a custom message** (optional)
3. **Select the target environment** (development/staging/production)
4. **Click "Trigger Dummy Workflow"**
5. **View the results** by clicking the provided links

**That's it!** No authentication required from users - the PAT in repository secrets handles everything.

## 🔍 Workflow Details

The dummy workflow (`dummy-workflow.yaml`) includes:

- **Manual Trigger**: Can be triggered from GitHub UI or via API
- **Configurable Inputs**:
  - Custom message
  - Target environment (development/staging/production)
- **Sample Actions**:
  - Display inputs and metadata
  - Simulate work with sleep
  - Generate random numbers
  - Create and upload artifacts
  - Generate workflow summaries

### Trigger Methods

1. **GitHub UI**: Go to Actions tab → Dummy Workflow → Run workflow
2. **GitHub Pages Interface**: Use the web interface (this repository)
3. **API Call**: Direct REST API call to GitHub
4. **Repository Dispatch**: External trigger via webhook

## 🛠️ Customization

### Modify the Workflow

Edit `.github/workflows/dummy-workflow.yaml` to:

- Add more steps
- Change input parameters
- Modify the job logic
- Add different triggers

### Update the Web Interface

Edit `index.html` to:

- Change the styling
- Add more form fields
- Modify the repository information
- Enhance the user experience

## 🔐 Security Notes

- Never commit Personal Access Tokens to the repository
- Use tokens with minimal required permissions
- Consider using GitHub Apps for production use
- The web interface stores tokens in browser localStorage (optional)

## 📊 Monitoring

- **Workflow Runs**: [View in Actions tab](https://github.com/ElizabethMoralesO/test/actions)
- **Pages Deployment**: Automatic on push to main branch
- **Artifacts**: Downloaded from completed workflow runs

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test the workflow triggers
5. Submit a pull request

## 📝 License

This project is for demonstration purposes.

# Test Repository - Workflow Trigger Demo

This repository demonstrates how to create a GitHub Pages site that can trigger GitHub Actions workflows.

## 🚀 Features

- **Dummy Workflow**: A sample GitHub Actions workflow that can be triggered manually or programmatically
- **GitHub Pages Trigger Interface**: A web interface to trigger workflows from your browser
- **Automated Pages Deployment**: Automatically deploys the trigger interface when changes are pushed

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

### 2. Create a Personal Access Token

1. Go to [GitHub Settings > Developer settings > Personal access tokens](https://github.com/settings/tokens)
2. Click "Generate new token (classic)"
3. Give it a name like "Workflow Trigger"
4. Select the `repo` scope (full control of private repositories)
5. Copy the generated token

### 3. Access the Trigger Interface

Once GitHub Pages is deployed, you can access the trigger interface at:
`https://elizabethmoraleso.github.io/test/`

## 🎯 How to Use

1. **Open the GitHub Pages site** (link above)
2. **Enter your Personal Access Token** in the form
3. **Customize the message and environment** (optional)
4. **Click "Trigger Dummy Workflow"**
5. **View the workflow run** by clicking the provided link

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

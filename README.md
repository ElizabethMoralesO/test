# GitHub Actions Pattern Library 🚀

This repository provides a **comprehensive pattern library** for GitHub Actions workflows, featuring multiple trigger interfaces and approaches for different use cases. Overcome GitHub's 10-input limitation and build enterprise-grade automation!

## 🎯 Available Patterns

### � Advanced JSON Configuration

**Perfect for complex enterprise deployments**

- **15+ parameters** (exceeds GitHub's 10-input limit!)
- Dynamic matrices and parallel jobs
- Real-time JSON preview and validation
- Multi-environment, multi-region deployments

### ⚡ Simple Workflow Trigger

**Quick and easy for basic automation**

- Minimal configuration required
- Fast setup and execution
- Perfect for simple deployments

### 🌍 Multi-Environment Pipeline

**Sophisticated deployment pipelines**

- Deploy across multiple environments
- Approval workflows for production
- Rollback strategies and health checks
- Environment-specific configurations

### � API Integration Workflow

**Connect with external systems**

- Fetch data from Nexus, Docker Hub, GitHub Releases
- Conditional deployments based on API responses
- Webhook notifications
- Custom API endpoint support

## 🚀 Live Demo

Visit the [GitHub Pages interface](https://elizabethmoraleso.github.io/test/) to:

- Choose your workflow pattern
- Configure parameters through intuitive forms
- Generate dynamic configurations
- Trigger workflows directly from the browser

## 🔧 Key Features

✅ **Multiple Patterns**: Choose the right approach for your needs  
✅ **Unlimited Inputs**: Bypass GitHub's 10-input restriction  
✅ **Dynamic Workflows**: Generate matrices and parallel jobs  
✅ **Visual Interface**: Pattern cards with clear descriptions  
✅ **Enterprise Ready**: Support for complex deployment scenarios  
✅ **Type Safety**: Structured configuration with validation

## 📁 Repository Structure

```
├── .github/
│   └── workflows/
│       ├── advanced-workflow.yaml      # Complex JSON-based workflow
│       ├── simple-workflow.yaml        # Basic trigger workflow
│       ├── multi-env-workflow.yaml     # Multi-environment pipeline
│       ├── api-integration-workflow.yaml # API integration workflow
│       └── deploy-pages.yaml           # GitHub Pages deployment
├── index.html                          # Pattern selector interface
├── ADVANCED_PATTERNS.md                # Comprehensive documentation
├── SETUP.md                            # Quick setup guide
├── customer.ps1                        # Existing script
└── README.md                           # This file
```

## 🔧 Setup Instructions

### 1. Enable GitHub Pages

1. Go to your repository settings
2. Navigate to "Pages" in the left sidebar
3. Under "Source", select "GitHub Actions"
4. The Pages deployment workflow will run automatically

### 2. Access the Trigger Interface

Once GitHub Pages is deployed, access the interface at:
`https://elizabethmoraleso.github.io/test/`

🎯 **Smart Configuration**: The interface automatically detects your repository information from the GitHub Pages URL - no manual editing required!

## 🎯 How to Use

1. **Open the GitHub Pages site** (link above)
2. **Enter a custom message** (optional)
3. **Select the target environment** (development/staging/production)
4. **Click the pattern trigger button**
5. **View the results** by clicking the provided links

**That's it!** No authentication required - users simply use GitHub's built-in workflow trigger interface.

## 🔍 Workflow Details

The pattern workflows include:

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

### Modify the Workflows

Edit the workflow files in `.github/workflows/` to:

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

- No authentication tokens required - uses GitHub's built-in workflow triggers
- Users need appropriate repository permissions to trigger workflows
- All workflow triggers go through GitHub's standard security model
- No sensitive data is stored in the web interface

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

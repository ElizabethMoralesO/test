# Pattern Library Usage Guide 🎯

This document provides a comprehensive guide to using the GitHub Actions Pattern Library for your automation needs.

## 🚀 Quick Start

1. **Access the Interface**: Visit your GitHub Pages URL
2. **Select a Pattern**: Choose from the 4 available pattern cards
3. **Configure Parameters**: Fill out the pattern-specific form
4. **Trigger Workflow**: Click the trigger button to start the workflow

## 📋 Pattern Selection Guide

### When to Use Each Pattern

#### 🔧 Advanced JSON Configuration

**Use When:**

- You have complex deployment requirements (15+ parameters)
- Need multi-environment, multi-region deployments
- Want dynamic job matrices and parallel execution
- Require enterprise-grade configuration management

**Examples:**

- Microservices deployment with multiple databases
- Multi-region application rollout
- Complex CI/CD pipelines with multiple stages
- Enterprise applications with extensive configuration needs

#### ⚡ Simple Workflow Trigger

**Use When:**

- You have basic automation needs
- Want quick deployment without complex configuration
- Need to trigger simple tasks or scripts
- Prefer minimal setup and fast execution

**Examples:**

- Simple application deployment
- Running tests or builds
- Basic notification workflows
- Quick utility scripts

#### 🌍 Multi-Environment Pipeline

**Use When:**

- You need to deploy across multiple environments
- Want approval workflows for production deployments
- Need rollback strategies and health checks
- Require environment-specific configurations

**Examples:**

- Staged deployments (dev → staging → production)
- Blue-green deployments
- Canary releases
- Environment promotion workflows

#### 🔗 API Integration Workflow

**Use When:**

- You need to fetch data from external APIs
- Want conditional deployments based on external data
- Need to integrate with artifact repositories
- Require webhook notifications

**Examples:**

- Deploying latest artifacts from Nexus/Docker Hub
- Version comparison workflows
- Integration with external monitoring systems
- API-driven deployment decisions

## 🛠️ Configuration Examples

### Advanced JSON Configuration Example

```json
{
  "application": {
    "name": "e-commerce-api",
    "dockerImage": "mycompany/ecommerce-api:v2.1.0",
    "resources": "4CPU-8GB",
    "healthCheckPath": "/health"
  },
  "deployment": {
    "environment": "production",
    "region": "us-east-1",
    "replicas": 5,
    "strategy": "rolling"
  },
  "database": {
    "type": "postgresql",
    "version": "14.2",
    "connectionPool": 20
  }
}
```

### Multi-Environment Pipeline Example

```yaml
Release Version: v1.2.0
Source Environment: staging
Target Environments: ✓ qa, ✓ production
Approval Required: ✓ Yes
Rollback Strategy: automatic
```

### API Integration Example

```yaml
API Source: docker-hub
API Endpoint: https://registry.hub.docker.com/v2/repositories/mycompany/myapp/tags
Filter Criteria: latest
Action on Result: conditional-deploy
Webhook URL: https://hooks.slack.com/services/...
```

## 🔄 Workflow Execution Flow

### 1. Pattern Selection

- User visits GitHub Pages interface
- Selects appropriate pattern card
- Form updates to show pattern-specific fields

### 2. Configuration

- User fills out configuration parameters
- Real-time validation (for Advanced pattern)
- JSON preview updates (for Advanced pattern)

### 3. Trigger

- User clicks trigger button
- Configuration is processed and validated
- Redirect to GitHub Actions with pre-filled data

### 4. Execution

- GitHub Actions workflow starts
- Configuration is parsed and processed
- Jobs execute based on pattern logic

### 5. Monitoring

- View progress in GitHub Actions
- Check logs and outputs
- Monitor deployment status

## 🎯 Best Practices

### Pattern Selection

- **Start Simple**: Begin with Simple Trigger, progress to complex patterns
- **Match Complexity**: Choose pattern complexity based on your actual needs
- **Consider Team**: Ensure your team can maintain the chosen pattern complexity

### Configuration Management

- **Use Consistent Naming**: Maintain consistent application and environment names
- **Version Everything**: Always specify versions for deployments
- **Document Decisions**: Use descriptive names and comments

### Security Considerations

- **Protect Secrets**: Never put sensitive data in forms or JSON
- **Use Repository Secrets**: Store tokens and credentials securely
- **Limit Permissions**: Use minimal required GitHub token scopes

### Monitoring and Debugging

- **Check Logs**: Always review GitHub Actions logs for issues
- **Test Configurations**: Validate configurations in non-production first
- **Use Health Checks**: Implement proper health check endpoints

## 🔧 Customization Guide

### Adding New Patterns

1. Create new workflow file in `.github/workflows/`
2. Add pattern definition to `WORKFLOW_PATTERNS` in `index.html`
3. Implement form generation function (e.g., `showCustomForm()`)
4. Add redirect function for the new pattern
5. Update documentation

### Extending Existing Patterns

1. Add new input fields to the form generation function
2. Update data collection function
3. Modify workflow to handle new parameters
4. Test thoroughly with various configurations

### Custom Validation

```javascript
function validateCustomFields() {
  const customField = document.getElementById("custom-field").value;
  if (!customField.match(/^[A-Za-z0-9-]+$/)) {
    showMessage(
      "error",
      "Custom field must contain only alphanumeric characters and hyphens"
    );
    return false;
  }
  return true;
}
```

## 🚨 Troubleshooting

### Common Issues

#### "Workflow not found" Error

- **Cause**: Workflow file doesn't exist or has syntax errors
- **Solution**: Verify workflow file exists and YAML syntax is valid

#### "Invalid JSON" Error (Advanced Pattern)

- **Cause**: Generated JSON has syntax errors
- **Solution**: Check form validation and JSON generation logic

#### "Permission denied" Error

- **Cause**: GitHub token lacks required permissions
- **Solution**: Verify token has `repo` and `actions` scopes

#### Form Not Updating

- **Cause**: JavaScript errors or pattern not properly selected
- **Solution**: Check browser console for errors, verify pattern selection

### Debug Steps

1. **Check Browser Console**: Look for JavaScript errors
2. **Verify Configuration**: Ensure repository secrets are set correctly
3. **Test Workflow Manually**: Try triggering workflow directly in GitHub Actions
4. **Check Permissions**: Verify GitHub token permissions
5. **Review Logs**: Check GitHub Actions workflow logs

## 🎉 Success Metrics

### How to Measure Success

- **Deployment Frequency**: How often you can deploy successfully
- **Configuration Time**: Time to configure and trigger workflows
- **Error Rate**: Percentage of successful vs failed deployments
- **Team Adoption**: Number of team members using the patterns

### Optimization Tips

- **Monitor Performance**: Track workflow execution times
- **Gather Feedback**: Collect team feedback on pattern usability
- **Iterate Patterns**: Continuously improve based on real usage
- **Document Learnings**: Keep track of what works best for your team

## 📚 Additional Resources

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [YAML Syntax Reference](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions)
- [JSON Schema Validation](https://json-schema.org/)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)

---

**Happy Automating! 🚀**

This pattern library grows with your needs. Start simple, learn the patterns, and gradually adopt more sophisticated approaches as your automation requirements evolve.

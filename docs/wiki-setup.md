# Setup & Configuration 🛠️

## 🚀 Zero-Configuration Setup

This pattern library is designed to work **immediately after forking** with no manual configuration required!

---

## ⚡ Quick Setup (2 Steps)

### **Step 1: Fork & Enable Pages**

```bash
1. Click "Fork" on this repository
2. Go to Settings > Pages
3. Source: "GitHub Actions"
4. Wait 1-2 minutes for deployment
```

### **Step 2: Use It!**

```bash
Visit: https://your-username.github.io/your-repository/
```

**✅ That's it!** The interface auto-detects your repository and works immediately.

---

## 🧠 How Auto-Detection Works

### **Smart Repository Detection**

The interface automatically detects repository information from your GitHub Pages URL:

```javascript
// Examples of what gets detected:
https://john.github.io/my-repo/     → john/my-repo
https://company.github.io/project/  → company/project
https://custom.domain.com/path/     → fallback values
```

### **What Gets Auto-Configured:**

- ✅ **Repository owner** (your GitHub username)
- ✅ **Repository name** (from URL path)
- ✅ **Workflow links** (all GitHub Actions URLs)
- ✅ **Pattern redirections** (to correct workflow files)

---

## 📋 No Configuration Needed

### **❌ What you DON'T need to do:**

- ~~Create Personal Access Tokens~~
- ~~Set up repository secrets~~
- ~~Edit configuration files~~
- ~~Update hardcoded URLs~~
- ~~Modify workflow files~~

### **✅ What happens automatically:**

- Repository info detected from GitHub Pages URL
- Workflow links generated dynamically
- Pattern selector works for your repository
- All redirections point to your workflows

---

## 🎯 Verification Steps

### **Confirm Setup is Working:**

1. **✅ GitHub Pages Deployed**

   ```
   Visit: https://your-username.github.io/your-repository/
   Expected: Pattern selector interface loads
   ```

2. **✅ Repository Detection**

   ```
   Check: Repository name displays correctly in interface
   Expected: Shows "your-username/your-repository"
   ```

3. **✅ Pattern Selection**

   ```
   Try: Click any pattern card
   Expected: Form updates to show pattern-specific fields
   ```

4. **✅ Workflow Redirection**
   ```
   Test: Fill form and click trigger button
   Expected: Redirects to GitHub Actions workflow page
   ```

---

## 🛠️ Advanced Configuration (Optional)

While zero configuration works for most users, you can customize if needed:

### **Custom Domain Setup**

If using a custom domain for GitHub Pages:

```javascript
// The auto-detection handles custom domains gracefully
// with fallback values for edge cases
```

### **Repository Structure Customization**

```bash
# You can rename workflow files, just update the pattern config:
# In index.html, modify WORKFLOW_PATTERNS object:
'simple': {
    workflow: 'your-custom-simple.yaml'  # Update filename
}
```

### **Styling Customization**

```css
/* Modify the embedded CSS in index.html */
.pattern-card {
  /* Your custom styling */
}
```

---

## 🔍 Troubleshooting Setup

### **Issue: GitHub Pages not deploying**

```
Solution:
1. Check Settings > Pages > Source is "GitHub Actions"
2. Ensure deploy-pages.yaml workflow exists
3. Check Actions tab for deployment errors
```

### **Issue: Repository name shows incorrectly**

```
Solution:
1. Verify GitHub Pages URL is correct format
2. Check browser console for auto-detection logs
3. Refresh page to re-run detection
```

### **Issue: Workflow redirects fail**

```
Solution:
1. Ensure workflow files exist in .github/workflows/
2. Check workflow filenames match pattern configuration
3. Verify repository permissions for Actions
```

### **Issue: Pattern forms don't update**

```
Solution:
1. Check browser console for JavaScript errors
2. Ensure all pattern cards are clickable
3. Try different browsers to isolate issues
```

---

## 🚀 For Organizations

### **Enterprise Deployment:**

1. **Fork to Organization Account**

   ```bash
   # Create organization fork
   # Enable GitHub Pages for organization
   # Access at: https://org-name.github.io/repo-name/
   ```

2. **Team Access Setup**

   ```bash
   # Ensure team members have repository access
   # Repository permissions control workflow triggering
   # No additional authentication setup needed
   ```

3. **Customization for Organization**
   ```bash
   # Customize patterns for your specific deployment needs
   # Add organization-specific workflow steps
   # Update documentation with internal procedures
   ```

---

## 📊 Monitoring & Maintenance

### **What to Monitor:**

- **GitHub Pages deployment** (automatic on push)
- **Workflow execution** (via Actions tab)
- **User feedback** (via Issues)
- **Pattern usage** (via Actions history)

### **Maintenance Tasks:**

- ✅ **Zero regular maintenance** needed
- ✅ **Workflows update automatically** on push
- ✅ **Documentation stays current** with code changes
- ✅ **No authentication tokens** to rotate or manage

---

## 🎯 Success Indicators

### **Setup is successful when:**

- ✅ GitHub Pages loads the pattern selector interface
- ✅ Repository name displays correctly in the interface
- ✅ Pattern cards respond to clicks and update forms
- ✅ Trigger buttons redirect to correct GitHub Actions pages
- ✅ Workflows can be triggered through GitHub's interface

### **Ready for production when:**

- ✅ All 4 patterns tested and working
- ✅ Team members can access and use interface
- ✅ Workflows execute successfully in your repository
- ✅ Monitoring and feedback mechanisms in place

---

**🎯 Need help? Check the [Troubleshooting Guide](../PATTERN_GUIDE.md#troubleshooting) or [open an issue](../../issues/new)!**

# Smart Repository Detection 🧠

## ✨ Zero Configuration Required!

This GitHub Actions Pattern Library features **intelligent repository detection** that eliminates the need for manual configuration. Here's how it works:

## 🔍 Auto-Detection Logic

The system automatically detects your repository information based on the current URL:

### GitHub Pages URLs

- **Format**: `username.github.io/repository`
- **Detection**: Extracts `username` and `repository` from the URL
- **Example**: `elizabethmoraleso.github.io/test` → `ElizabethMoralesO/test`

### Custom Domains

- **Format**: `custom-domain.com/path/to/repo`
- **Detection**: Attempts to extract from path segments
- **Fallback**: Uses safe default values if extraction fails

### Local Development

- **Format**: `localhost:3000` or `file://...`
- **Detection**: Uses configured fallback values for testing
- **Purpose**: Allows local testing without errors

## 💡 Implementation Details

```javascript
function getRepoInfo() {
  const hostname = window.location.hostname;
  const pathname = window.location.pathname;

  if (hostname.endsWith(".github.io")) {
    // GitHub Pages: username.github.io/repository
    const owner = hostname.split(".")[0];
    const repo = pathname.split("/")[1] || owner;
    return { owner, repo };
  } else if (hostname === "localhost" || hostname.startsWith("127.0.0.1")) {
    // Local development fallback
    return {
      owner: "ElizabethMoralesO",
      repo: "test",
    };
  } else {
    // Custom domain extraction
    const pathParts = pathname.split("/").filter(Boolean);
    return {
      owner: pathParts[0] || "ElizabethMoralesO",
      repo: pathParts[1] || "test",
    };
  }
}
```

## 🎯 Benefits

✅ **Zero Manual Setup**: No need to edit configuration files  
✅ **Fork-Friendly**: Works immediately when repository is forked  
✅ **Error-Proof**: No risk of typos in repository names  
✅ **Visual Feedback**: Shows detected repository in the interface  
✅ **Console Logging**: Developers can verify detection in browser console

## 🔧 Visual Indicators

The interface displays the auto-detected repository:

```
Repository: ElizabethMoralesO/test
```

This appears in:

- The info box at the top of the page
- Browser console logs for debugging
- Styled with monospace font and background for clarity

## 🚀 User Experience

### Before (Manual Configuration)

1. Fork repository
2. Edit `index.html`
3. Find and replace `YOUR_USERNAME`
4. Find and replace `YOUR_REPOSITORY`
5. Commit changes
6. Wait for Pages rebuild

### After (Auto-Detection)

1. Fork repository
2. ✅ **It just works!**

## 🛠️ Developer Notes

The auto-detection runs at page load and:

1. **Detects Repository**: Analyzes current URL
2. **Updates Constants**: Sets `REPO_OWNER` and `REPO_NAME`
3. **Updates UI**: Shows repository name in interface
4. **Logs Detection**: Console output for debugging
5. **Initializes Forms**: Sets up pattern selector

This makes the pattern library truly **fork-and-use** ready! 🎉

## 🔍 Debugging

If auto-detection isn't working:

1. **Check Console**: Look for detection logs
2. **Verify URL**: Ensure you're accessing via GitHub Pages
3. **Check Format**: URL should be `username.github.io/repository`
4. **Fallback Values**: Local development uses safe defaults

The system is designed to be robust and fail gracefully with sensible defaults.

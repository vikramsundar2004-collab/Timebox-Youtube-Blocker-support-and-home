# Render Deployment Checklist

This repo is ready for Render as a static site.

## One-click Blueprint URL

Open this link after the latest changes are pushed:

```text
https://dashboard.render.com/blueprint/new?repo=https://github.com/vikramsundar2004-collab/Timebox-Youtube-Blocker-support-and-home
```

## Render settings

The checked-in `render.yaml` configures:

```yaml
services:
  - type: web
    name: timebox-youtube-blocker-support
    runtime: static
    plan: free
    buildCommand: echo "Static download site ready"
    staticPublishPath: ./site
    autoDeployTrigger: commit
    renderSubdomainPolicy: enabled
```

If you create the site manually instead of using the Blueprint:

- Service type: **Static Site**
- Repository: `vikramsundar2004-collab/Timebox-Youtube-Blocker-support-and-home`
- Branch: `main`
- Build command: `echo "Static download site ready"`
- Publish directory: `site`
- Auto-deploy: enabled

## After deployment

1. Open the Render URL.
2. Confirm the page loads without a login.
3. Click both download buttons.
4. Open `/print-qr.html` and print at 100% scale.
5. Scan the QR code from a phone and confirm it opens the Render URL.

## If Render gives a different URL

The QR code currently points to:

```text
https://timebox-youtube-blocker-support.onrender.com/
```

If Render assigns a different URL, update these files:

- `site/print-qr.html`
- `site/downloads/install-timebox-youtube-blocker.cmd`
- `site/assets/timebox-download-qr.png`
- `site/assets/timebox-download-qr-print-sheet.png`
- `site/assets/timebox-download-qr-print-sheet.pdf`

# Timebox YouTube Blocker Support and Home

Static support website for Timebox YouTube Blocker.

## Pages

- `/` - Product home and install help
- `/support.html` - Customer support and troubleshooting
- `/privacy.html` - Privacy policy for the Chrome Web Store listing

## Render Deployment

This repo includes a Render Blueprint in `render.yaml`.

Use this URL to create the Render static site:

```text
https://dashboard.render.com/blueprint/new?repo=https://github.com/vikramsundar2004-collab/Timebox-Youtube-Blocker-support-and-home
```

Render settings:

- Runtime: Static
- Build command: `echo "Static support site ready"`
- Publish directory: `./site`

## Local Preview

Open `site/index.html` in a browser, or serve the folder with any static file server.

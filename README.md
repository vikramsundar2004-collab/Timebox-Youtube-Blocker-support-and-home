# Timebox YouTube Blocker Download Site

This repository hosts the public download and support site for Timebox YouTube Blocker.

The site is a static Render deployment. Visitors can:

- Download the Windows installer ZIP.
- Download the extension ZIP manually.
- Read the Chrome installation steps.
- Print a QR code handout for the public download page.
- Open support and privacy pages.

## Public URL

The Render service is configured for this URL:

```text
https://timebox-youtube-blocker-support.onrender.com/
```

The QR assets in `site/assets` point to that URL. If you rename the Render service and get a different `onrender.com` URL, regenerate the QR code and update the URL in `site/print-qr.html`.

## Direct downloads

- [Windows installer ZIP](https://raw.githubusercontent.com/vikramsundar2004-collab/Timebox-Youtube-Blocker-support-and-home/main/site/downloads/install-timebox-youtube-blocker-windows.zip)
- [Manual extension ZIP](https://raw.githubusercontent.com/vikramsundar2004-collab/Timebox-Youtube-Blocker-support-and-home/main/site/downloads/timebox-youtube-blocker.zip)

Use the installer ZIP instead of linking directly to the `.cmd` helper. GitHub serves `.cmd` files as plain text in the browser, which is why the helper can appear as code instead of downloading.

## Important files

```text
site/index.html
site/download.html
site/print-qr.html
site/downloads/install-timebox-youtube-blocker.cmd
site/downloads/install-timebox-youtube-blocker-windows.zip
site/downloads/timebox-youtube-blocker.zip
site/assets/timebox-download-qr.png
site/assets/timebox-download-qr-print-sheet.pdf
render.yaml
```

## Local preview

From this repository:

```powershell
cd "C:\Users\vikra\OneDrive\Documents\Timebox-Youtube-Blocker-support-and-home"
python -m http.server 8080 --directory site
```

Then open:

```text
http://127.0.0.1:8080/
```

## Render deployment

Use the Blueprint in `render.yaml`.

1. Commit and push this repo to GitHub.
2. Open Render and choose **New > Blueprint**.
3. Connect this repository:

```text
https://github.com/vikramsundar2004-collab/Timebox-Youtube-Blocker-support-and-home
```

4. Render reads `render.yaml` from the repo root.
5. Apply the Blueprint.
6. After the deploy is live, open:

```text
https://timebox-youtube-blocker-support.onrender.com/
```

There are no environment variables, databases, build artifacts, or server processes. Render serves the contents of `site/`.

# cleanup-docr

GitHub Action to clean up DigitalOcean Container Registry (DOCR) by removing old image manifests.

## Usage

```yaml
- uses: untile/cleanup-docr@v1
  with:
    image_repository: 'my-repository'
    buffer_size: 3
    exclude: \[.*(latest|v[^,\]]*).*\]
```

## Inputs

- `image_repository` (required) - Image repository name in the DOCR
- `buffer_size` (optional) - Number of last uploaded images to keep (default: 3)
- `exclude` (optional) - Tag regex to exclude from deletion (example: `\[.*(latest|v[^,\]]*).*\]`)

## Prerequisites

- doctl must be authenticated in your workflow (use `digitalocean/action-doctl`)

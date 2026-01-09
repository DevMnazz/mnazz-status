# Upptime Scheduled Maintenance Setup

This guide explains how to set up scheduled maintenance for the Mnazz Website on the Upptime status page.

## What This Does

When properly configured, the Upptime status page will show the Mnazz Website as "Under Maintenance" instead of "Down" during the scheduled maintenance window.

## Current Maintenance Window

- **Service:** Mnazz Website (https://mnazz.com)
- **Start:** January 9, 2026 at 1:00 PM EST (18:00 UTC)
- **End:** January 10, 2026 at 1:00 PM EST (18:00 UTC)
- **Status:** Expected Down

## How to Apply This Maintenance Window

Since GitHub Issues cannot be created automatically from GitHub Actions, you need to manually create the issue using one of the methods below:

### Method 1: Use the Helper Script (Recommended)

The easiest way is to use the provided helper script:

```bash
./create-maintenance-issue.sh
```

**Requirements:**
- GitHub CLI (`gh`) must be installed
- You must be authenticated with GitHub CLI (`gh auth login`)

### Method 2: GitHub Web Interface

1. Go to https://github.com/DevMnazz/mnazz-status/issues/new
2. Select the "Maintenance Event" template
3. Copy the content from `MAINTENANCE_ISSUE.md`
4. Paste it into the issue body
5. Ensure the `maintenance` label is applied
6. Click "Submit new issue"

### Method 3: GitHub CLI Command

Run this command directly:

```bash
gh issue create \
  --repo DevMnazz/mnazz-status \
  --title "[Scheduled Maintenance] Mnazz Website Maintenance" \
  --label "maintenance" \
  --body "$(cat MAINTENANCE_ISSUE.md | sed -n '/^```$/,/^```$/p' | sed '1d;$d')"
```

## How It Works

Upptime uses GitHub Issues with the `maintenance` label to track scheduled maintenance windows. The issue body contains an HTML comment with:

- `start`: ISO 8601 timestamp when maintenance begins
- `end`: ISO 8601 timestamp when maintenance ends  
- `expectedDown`: Comma-separated list of site slugs that will be down

During the maintenance window, Upptime will:
1. Show the site as "Under Maintenance" instead of "Down"
2. Suppress downtime alerts
3. Display the maintenance notice on the status page

## Verification

After creating the issue:

1. Wait for the Upptime workflows to run (they run every 5 minutes)
2. Visit https://status.mnazz.com
3. Verify that "Mnazz Website" shows as "Under Maintenance"

## Troubleshooting

If the maintenance window doesn't appear:

1. Verify the issue has the `maintenance` label
2. Check that the timestamps are in valid ISO 8601 format
3. Ensure the site slug `mnazz-website` matches exactly
4. Wait for the next Upptime workflow run (up to 5 minutes)

## References

- [Upptime Scheduled Maintenance Documentation](https://upptime.js.org/docs/scheduled-maintenance/)
- [Upptime Configuration Guide](https://upptime.js.org/docs/configuration/)
- [Upptime GitHub Repository](https://github.com/upptime/upptime)

## Files in This PR

- `MAINTENANCE_ISSUE.md` - Complete issue content with instructions
- `create-maintenance-issue.sh` - Helper script to create the issue
- `SCHEDULED_MAINTENANCE_README.md` - This file

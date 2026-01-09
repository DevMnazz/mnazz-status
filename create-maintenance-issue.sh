#!/bin/bash

# Script to create a scheduled maintenance issue for Upptime
# This script requires the GitHub CLI (gh) to be installed and authenticated
#
# Make this file executable with: chmod +x create-maintenance-issue.sh

set -e

REPO="DevMnazz/mnazz-status"
TITLE="[Scheduled Maintenance] Mnazz Website Maintenance"
LABEL="maintenance"

# Check if gh CLI is installed
if ! command -v gh &> /dev/null; then
    echo "Error: GitHub CLI (gh) is not installed."
    echo "Please install it from: https://cli.github.com/"
    exit 1
fi

# Check if gh CLI is authenticated
if ! gh auth status &> /dev/null; then
    echo "Error: GitHub CLI is not authenticated."
    echo "Please run: gh auth login"
    exit 1
fi

# Issue body with maintenance window
# This is a 24-hour maintenance window: Jan 9 @ 1:00 PM EST to Jan 10 @ 1:00 PM EST
BODY='<!--
start: 2026-01-09T18:00:00.000Z
end: 2026-01-10T18:00:00.000Z
expectedDown: mnazz-website
-->

## Scheduled Maintenance Window

**Service:** Mnazz Website (https://mnazz.com)

**Start Time:** January 9, 2026 at 1:00 PM EST (18:00 UTC)  
**End Time:** January 10, 2026 at 1:00 PM EST (18:00 UTC)  
**Duration:** 24 hours

**Expected Status:** Down

**Description:**
Planned maintenance for the Mnazz Website. The service will be temporarily unavailable during this maintenance window.

---
*This maintenance window is being tracked by Upptime. The status page will reflect this as scheduled maintenance rather than an outage.*'

echo "Creating maintenance issue in repository: $REPO"
echo "Title: $TITLE"
echo ""

# Create the issue
if gh issue create \
  --repo "$REPO" \
  --title "$TITLE" \
  --label "$LABEL" \
  --body "$BODY"; then
    echo ""
    echo "✓ Maintenance issue created successfully!"
    echo ""
    echo "The Upptime status page will now show the maintenance window."
    echo "Visit https://status.mnazz.com to see the updated status."
else
    echo ""
    echo "✗ Failed to create maintenance issue."
    echo "Please check your GitHub CLI authentication and repository permissions."
    exit 1
fi

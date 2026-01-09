# Scheduled Maintenance Issue Content

Use this content to create a new GitHub Issue for scheduled maintenance.

## Issue Title
[Scheduled Maintenance] Mnazz Website Maintenance

## Issue Body
```
<!--
start: 2026-01-09T18:00:00.000Z
end: 2026-01-10T18:00:00.000Z
expectedDown: mnazz-website
-->

## Scheduled Maintenance Window

**Service:** Mnazz Website (https://mnazz.com)

**Start Time:** January 9, 2026 at 1:00 PM EST (18:00 UTC)  
**End Time:** January 10, 2026 at 1:00 PM EST (18:00 UTC)

**Expected Status:** Down

**Description:**
Planned maintenance for the Mnazz Website. The service will be temporarily unavailable during this maintenance window.

---
*This maintenance window is being tracked by Upptime. The status page will reflect this as scheduled maintenance rather than an outage.*
```

## Labels
- `maintenance`

## Instructions

### Option 1: Create via GitHub Web Interface
1. Go to https://github.com/DevMnazz/mnazz-status/issues/new
2. Click on "Maintenance Event" template
3. Replace the dates in the HTML comment with the dates above
4. Replace the placeholder text with the description above
5. Make sure the `maintenance` label is applied
6. Click "Submit new issue"

### Option 2: Create via GitHub CLI

**Recommended:** Use the helper script which handles all the complexity:
```bash
./create-maintenance-issue.sh
```

**Alternative:** Run the gh command directly. The body must be enclosed in single quotes (`'...'`) to preserve line breaks and prevent shell interpretation of special characters:

```bash
gh issue create \
  --repo DevMnazz/mnazz-status \
  --title "[Scheduled Maintenance] Mnazz Website Maintenance" \
  --label "maintenance" \
  --body '<!--
start: 2026-01-09T18:00:00.000Z
end: 2026-01-10T18:00:00.000Z
expectedDown: mnazz-website
-->

## Scheduled Maintenance Window

**Service:** Mnazz Website (https://mnazz.com)

**Start Time:** January 9, 2026 at 1:00 PM EST (18:00 UTC)  
**End Time:** January 10, 2026 at 1:00 PM EST (18:00 UTC)

**Expected Status:** Down

**Description:**
Planned maintenance for the Mnazz Website. The service will be temporarily unavailable during this maintenance window.

---
*This maintenance window is being tracked by Upptime. The status page will reflect this as scheduled maintenance rather than an outage.*'
```

> **Note:** Single quotes (`'`) prevent the shell from interpreting special characters. Do not use double quotes (`"`) as they will cause shell expansion issues.

### Option 3: Use the Helper Script
Run the script `create-maintenance-issue.sh` that has been created in this repository.

## After Creating the Issue

Once the issue is created, Upptime will automatically:
1. Detect the issue with the `maintenance` label
2. Read the start and end times from the HTML comment
3. Mark `mnazz-website` as under maintenance during the specified window
4. Update the status page to show "Under Maintenance" instead of "Down"
5. Automatically close the issue when the maintenance window ends (if configured)

The status page at https://status.mnazz.com will reflect the maintenance status.

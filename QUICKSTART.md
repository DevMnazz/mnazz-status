# QUICK START: Create Scheduled Maintenance Issue

⚠️ **IMPORTANT**: This needs to be done manually as GitHub Actions cannot create issues in this context.

## Fastest Method (1 Minute)

### Prerequisites
- GitHub CLI installed: https://cli.github.com/
- Authenticated: Run `gh auth login` if needed

### Steps

1. **Navigate to the repository directory:**
   ```bash
   cd /path/to/mnazz-status
   ```

2. **Run the helper script:**
   ```bash
   ./create-maintenance-issue.sh
   ```

That's it! The script will create the maintenance issue with all the correct parameters.

## Alternative: Manual Creation (2 Minutes)

If you prefer to create the issue via the GitHub web interface:

1. Go to: https://github.com/DevMnazz/mnazz-status/issues/new
2. Click "Maintenance Event" template
3. Copy/paste this into the issue body:

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

4. Ensure the `maintenance` label is applied
5. Click "Submit new issue"

## What Happens Next?

Once the issue is created:

1. **Immediate**: Upptime workflows detect the new maintenance issue
2. **Within 5 minutes**: Status page updates to show "Under Maintenance" for Mnazz Website
3. **During window**: Site shows as maintained, not down
4. **After window**: Issue can be closed manually or will auto-close (if configured)

## Verify It's Working

Visit https://status.mnazz.com after creating the issue. You should see "Mnazz Website" listed with a maintenance indicator instead of showing as down.

## Need Help?

See `SCHEDULED_MAINTENANCE_README.md` for detailed documentation and troubleshooting.

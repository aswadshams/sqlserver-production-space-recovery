# SQL Server Space Recovery – Production OLTP (Sanitized Case Study)

## Step 0 — Mandatory Preconditions (Production)
- Approved maintenance window
- Recent FULL backup verified
- Log backup strategy understood
- Disk pressure confirmed as persistent
- Root cause analysis initiated

## Step 1 — Identify current database file allocation
```sql
SELECT name,
       physical_name AS CurrentLocation,
       state_desc
FROM sys.master_files
WHERE database_id = DB_ID(N'<DatabaseName>');
## Step 2 — File relocation (planned downtime)
ALTER DATABASE <DatabaseName>
SET OFFLINE WITH ROLLBACK IMMEDIATE;
##Move files at OS level, then:
ALTER DATABASE <DatabaseName>
MODIFY FILE ( NAME = '<LogicalDataName>',
              FILENAME = 'D:\MSSQL\Data\<DatabaseName>.mdf' );

ALTER DATABASE <DatabaseName>
MODIFY FILE ( NAME = '<LogicalLogName>',
              FILENAME = 'D:\MSSQL\Data\<DatabaseName>_log.ldf' );

ALTER DATABASE <DatabaseName> SET ONLINE;
Validate:
SELECT name, physical_name, state_desc
FROM sys.master_files
WHERE database_id = DB_ID(N'<DatabaseName>');
##Step 3 — One-time LOG shrink (Exceptional – Production OLTP):
⚠️ Not routine maintenance. One-time corrective action only.
ALTER DATABASE <DatabaseName> SET RECOVERY SIMPLE WITH NO_WAIT;
DBCC SHRINKFILE (<LogicalLogFileName>, <TargetSizeMB>);
ALTER DATABASE <DatabaseName> SET RECOVERY FULL WITH NO_WAIT;
###Mandatory: take a FULL backup immediately after switching back to FULL.
##Step 4 — Prevention controls

.Fixed-size autogrowth (not %)

.Verified log backup cadence

.Monitoring for growth + disk thresholds

4. Scroll down → Commit message: `Add OLTP space recovery tutorial`
5. Click **Commit new file**

---

## Step 5 — Create the SQL template in scripts/
1. Click **Add file** → **Create new file**
2. Filename:

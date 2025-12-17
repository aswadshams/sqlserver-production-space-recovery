3. Paste:

```sql
/* Space Recovery Template (Sanitized placeholders) */

SELECT name, physical_name AS CurrentLocation, state_desc
FROM sys.master_files
WHERE database_id = DB_ID(N'<DatabaseName>');

ALTER DATABASE <DatabaseName> SET OFFLINE WITH ROLLBACK IMMEDIATE;

/* Move MDF/LDF at OS level */

ALTER DATABASE <DatabaseName>
MODIFY FILE ( NAME = '<LogicalDataName>',
           FILENAME = 'D:\MSSQL\Data\<DatabaseName>.mdf' );

ALTER DATABASE <DatabaseName>
MODIFY FILE ( NAME = '<LogicalLogName>',
           FILENAME = 'D:\MSSQL\Data\<DatabaseName>_log.ldf' );

ALTER DATABASE <DatabaseName> SET ONLINE;

ALTER DATABASE <DatabaseName> SET RECOVERY SIMPLE WITH NO_WAIT;
DBCC SHRINKFILE (<LogicalLogFileName>, <TargetLogSizeMB>);
ALTER DATABASE <DatabaseName> SET RECOVERY FULL WITH NO_WAIT;

/* Take FULL backup immediately */

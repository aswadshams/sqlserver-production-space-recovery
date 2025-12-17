# SQL Server Production Space Recovery (OLTP Case Study)

A sanitized, step-by-step tutorial documenting how significant disk space
(≈1TB of allocated MDF/LDF) was reclaimed in a **Production OLTP** SQL Server
environment using controlled file relocation and a **one-time corrective log shrink**.

## Scope
- Production OLTP systems
- Exceptional, non-routine corrective actions
- Focus on safety, rollback, and prevention

## What this covers
- Identifying database file allocation
- Safe MDF/LDF relocation (offline + MODIFY FILE)
- One-time log shrink (with strict warnings)
- Mandatory post-steps and controls

## What this does NOT promote
- Routine shrink jobs
- Unsafe shortcuts
- Environment-specific scripts

All examples use placeholders. See `DISCLAIMER.md`.

## Topics
sqlserver · mssql · dba · production · oltp · maintenance

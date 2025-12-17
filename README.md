# SQL Server Production Space Recovery (OLTP Case Study)

A sanitized, step-by-step tutorial documenting how significant disk space
(≈1TB of allocated MDF/LDF) was reclaimed in a **Production OLTP** SQL Server
environment using controlled file relocation and a **one-time corrective log shrink**.

## Scope
- Production OLTP systems
- Exceptional, non-routine corrective actions
- Focus on safety, rollback, and prevention

## Why this matters
In high-throughput OLTP systems, uncontrolled file growth can silently consume
disk and threaten availability. This case study documents a **controlled,
approved, production-safe** remediation that reclaimed ~1TB of space without
data loss, while restoring predictable growth behavior


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

## Full Tutorial
➡️ [Production OLTP Space Recovery – Step by Step](docs/space-recovery-production-oltp.md)

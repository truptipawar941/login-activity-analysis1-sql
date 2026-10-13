# Login Activity Analysis Using SQL

## Project Overview
This project analyzes login activity using MySQL to understand successful and failed login attempts, identify users with repeated failed logins, and explore login patterns by device and date.

## Objectives
- Analyze total login attempts.
- Compare successful and failed logins.
- Identify users with repeated failed attempts.
- Calculate the login failure percentage.
- Analyze login activity by device.
- Identify username and IP address combinations with repeated failures.

## Dataset
The project uses a sample dataset containing 15 login records with the following columns:

- `login_id` — Unique login record ID
- `username` — User account name
- `ip_address` — IP address used
- `login_time` — Date and time of login attempt
- `login_status` — Success or Failed
- `device` — Device used for login

## Tools Used
- MySQL
- SQL

## SQL Concepts
- SELECT and WHERE
- COUNT and SUM
- GROUP BY and ORDER BY
- CASE WHEN
- Aggregate functions
- HAVING
- DATE()
- ROUND()
- LIMIT

## Key Findings
- The dataset contains 15 login attempts.
- The queries compare successful and failed login attempts.
- Repeated failed attempts can be identified by username and IP address.
- Device-wise analysis helps compare failed login counts across devices.

Note: These findings are based on a small sample dataset and are for learning purposes only. Repeated failed logins may warrant investigation but do not by themselves prove malicious activity.

## How to Run
1. Install MySQL.
2. Open MySQL Workbench.
3. Open `login_activity_analysis.sql`.
4. Execute the script to create the database, table, sample records, and analysis queries.

## Project File
`login_activity_analysis.sql`

## Author
Trupti Pawar

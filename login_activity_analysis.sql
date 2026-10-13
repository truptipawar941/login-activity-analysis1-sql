CREATE DATABASE cybersecurity_analysis;

USE cybersecurity_analysis;
SELECT DATABASE();
CREATE TABLE login_activity (
    login_id INT PRIMARY KEY,
    username VARCHAR(50),
    ip_address VARCHAR(45),
    login_time DATETIME,
    login_status VARCHAR(20),
    device VARCHAR(50)
);
INSERT INTO login_activity VALUES
(1, 'Amit', '192.168.1.10', '2026-10-12 09:00:00', 'Success', 'Laptop'),
(2, 'Priya', '192.168.1.12', '2026-10-12 09:05:00', 'Failed', 'Mobile'),
(3, 'Amit', '192.168.1.10', '2026-10-12 09:10:00', 'Success', 'Laptop'),
(4, 'Rahul', '103.45.67.89', '2026-10-12 09:15:00', 'Failed', 'Laptop'),
(5, 'Priya', '192.168.1.12', '2026-10-12 09:16:00', 'Failed', 'Mobile'),
(6, 'Priya', '192.168.1.12', '2026-10-12 09:17:00', 'Failed', 'Mobile'),
(7, 'Sneha', '192.168.1.15', '2026-10-12 10:00:00', 'Success', 'Tablet'),
(8, 'Rahul', '103.45.67.89', '2026-10-12 10:05:00', 'Failed', 'Laptop'),
(9, 'Amit', '192.168.1.20', '2026-10-12 11:30:00', 'Success', 'Mobile'),
(10, 'Sneha', '192.168.1.15', '2026-10-12 12:00:00', 'Failed', 'Tablet'),
(11, 'Rahul', '103.45.67.89', '2026-10-12 12:10:00', 'Failed', 'Laptop'),
(12, 'Priya', '192.168.1.12', '2026-10-12 12:30:00', 'Success', 'Mobile'),
(13, 'Karan', '45.67.89.10', '2026-10-12 13:00:00', 'Failed', 'Laptop'),
(14, 'Karan', '45.67.89.10', '2026-10-12 13:02:00', 'Failed', 'Laptop'),
(15, 'Karan', '45.67.89.10', '2026-10-12 13:03:00', 'Failed', 'Laptop');
SELECT *
FROM login_activity;

SELECT *
FROM login_activity
LIMIT 10;
SELECT COUNT(*) AS total_records
FROM login_activity;
SELECT
    login_status,
    COUNT(*) AS total_attempts
FROM login_activity
GROUP BY login_status;
SELECT *
FROM login_activity
WHERE login_status = 'Failed';
SELECT
    DATE(login_time) AS login_date,
    COUNT(*) AS total_attempts
FROM login_activity
GROUP BY DATE(login_time)
ORDER BY login_date;

SELECT
    DATE(login_time) AS login_date,
    login_status,
    COUNT(*) AS total_attempts
FROM login_activity
GROUP BY DATE(login_time), login_status
ORDER BY login_date, login_status;

SELECT
    username,
    COUNT(*) AS failed_attempts
FROM login_activity
WHERE login_status = 'Failed'
GROUP BY username
ORDER BY failed_attempts DESC;

SELECT
    COUNT(*) AS total_attempts,
    SUM(CASE
        WHEN login_status = 'Failed' THEN 1
        ELSE 0
    END) AS failed_attempts,
    ROUND(
        SUM(CASE
            WHEN login_status = 'Failed' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*),
        2
    ) AS failure_percentage
FROM login_activity;

SELECT
    device,
    COUNT(*) AS total_attempts,
    SUM(CASE
        WHEN login_status = 'Failed' THEN 1
        ELSE 0
    END) AS failed_attempts
FROM login_activity
GROUP BY device
ORDER BY failed_attempts DESC;


SELECT
    username,
    ip_address,
    COUNT(*) AS failed_attempts
FROM login_activity
WHERE login_status = 'Failed'
GROUP BY username, ip_address
HAVING COUNT(*) >= 3
ORDER BY failed_attempts DESC;

SELECT
    username,
    COUNT(*) AS total_attempts,
    SUM(CASE
        WHEN login_status = 'Success' THEN 1
        ELSE 0
    END) AS successful_logins,
    SUM(CASE
        WHEN login_status = 'Failed' THEN 1
        ELSE 0
    END) AS failed_logins
FROM login_activity
GROUP BY username
ORDER BY total_attempts DESC
LIMIT 5;
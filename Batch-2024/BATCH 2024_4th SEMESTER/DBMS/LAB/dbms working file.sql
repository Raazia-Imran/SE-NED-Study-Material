-- CREATE DATABASE my_company;

-- -- 2. Tell Workbench to use this container
-- USE my_company;


CREATE TABLE employee (     
    EMPID INT PRIMARY KEY,     
    EMPNAME VARCHAR(50),     
    COMMISSION DECIMAL(10,2),     
    DEPT VARCHAR(20) 
);


INSERT INTO employee VALUES (101, 'Alice', 500.00, 'software');
INSERT INTO employee VALUES (102, 'Bob', NULL, 'SOFTWARE');
INSERT INTO employee VALUES (103, 'Charlie', 300.00, 'HR');
INSERT INTO employee VALUES (104, 'David', NULL, 'marketing');

SELECT * FROM employee;


SELECT EMPNAME, 
       IF(COMMISSION IS NOT NULL, 'COMMISSION EXISTS', 'NOT APPLICABLE') AS comm_status
FROM employee;


SELECT EMPNAME, 
       IF(EMPID IS NOT NULL, 'EXISTS', 'DOES NOT EXIST') AS empid_status
FROM employee;


SELECT EMPNAME, 
       CASE DEPT
           WHEN 'software' THEN 'se'
           WHEN 'SOFTWARE' THEN 'SE'
           ELSE 'OTHER'
       END AS department
FROM employee;
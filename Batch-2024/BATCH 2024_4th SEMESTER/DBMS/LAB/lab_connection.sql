CREATE TABLE departments (
    department_id NUMBER PRIMARY KEY,
    department_name VARCHAR2(50)
);

CREATE TABLE employees (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(30),
    last_name VARCHAR2(30),
    department_id NUMBER,
    salary NUMBER,
    hire_date DATE,
    CONSTRAINT fk_dept
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

INSERT INTO departments VALUES (10, 'Human Resources');
INSERT INTO departments VALUES (20, 'Finance');
INSERT INTO departments VALUES (30, 'IT');

INSERT INTO employees VALUES (1, 'John', 'Doe', 10, 2000, SYSDATE);
INSERT INTO employees VALUES (2, 'Sara', 'Khan', 20, 3500, SYSDATE);
INSERT INTO employees VALUES (3, 'Ahmed', 'Ali', 30, 4200, SYSDATE);

COMMIT;

SELECT * FROM employees;


SELECT 
    UPPER(e.first_name || ' ' || e.last_name) AS EMPLOYEE_NAME,
    UPPER(d.department_name) AS DEPARTMENT_NAME
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;






SELECT
    first_name,
    SUBSTR(last_name, 1, 1) AS LAST_NAME_INITIAL,
    LENGTH(last_name) AS LAST_NAME_LENGTH
FROM employees;



SELECT 
    first_name || ' ' || last_name || 
    ' [' || LENGTH(first_name || ' ' || last_name) || ']' 
    AS "Full Name Length"
FROM employees;



SELECT
    first_name,
    SUBSTR(first_name, 1, 3) AS FIRST_3_CHARS
FROM employees;



CREATE TABLE products (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(50),
    price NUMBER
);


INSERT INTO products VALUES (1, 'Laptop', 1050.75);
INSERT INTO products VALUES (2, 'Mouse', 25.49);
INSERT INTO products VALUES (3, 'Keyboard', 78.99);
INSERT INTO products VALUES (4, 'Monitor', 299.60);

COMMIT;





SELECT 
    product_name,
    ROUND(price) AS rounded_price
FROM products
ORDER BY ROUND(price) DESC;


SELECT 
    product_name,
    price,
    ROUND(price, -1) AS rounded_to_tens
FROM products;


SELECT
    product_name,
    ROUND(price) AS ROUNDED_PRICE,
    TRUNC(price) AS TRUNCATED_PRICE
FROM products;


CREATE TABLE orders (
    order_id NUMBER PRIMARY KEY,
    order_date DATE
);

INSERT INTO orders VALUES (1, DATE '2026-04-10');
INSERT INTO orders VALUES (2, DATE '2026-03-25');
INSERT INTO orders VALUES (3, DATE '2026-04-23');

COMMIT;



SELECT
    order_id,
    order_date,
    TRUNC(order_date, 'MM') AS start_of_month
FROM orders;




SELECT
    last_name || ', ' || first_name || 
    ' | Salary ' || ROUND(salary, -2) AS EMP_PAY_DETAILS
FROM employees;



SELECT
    first_name,
    LENGTH(first_name) AS NAME_LENGTH_FILTER
FROM employees
WHERE LENGTH(first_name) > 5;


SELECT
    first_name || ' ' || last_name AS original_name,
    LPAD(RPAD(first_name || ' ' || last_name, 20, ' '), 30, ' ') AS centered_name
FROM employees;


SELECT
    first_name || ' ' || last_name AS employee_name,
    
    TO_CHAR(hire_date, 'DD-MON-YYYY HH:MI:SS') AS full_datetime,
    TO_CHAR(hire_date, 'DD-MON-YYYY') AS only_date
FROM employees;

SELECT 100 + 100.1 AS result
FROM dual;



SELECT
    first_name || ' ' || last_name AS full_name,
    salary
FROM employees
WHERE salary > '500000';

INSERT INTO employees VALUES (4, 'Fatima', 'Zafar', 10, 600000, SYSDATE);
INSERT INTO employees VALUES (5, 'Hassan', 'Iqbal', 20, 750000, SYSDATE);

COMMIT;

SELECT
    first_name || ' ' || last_name AS full_name,
    salary
FROM employees
WHERE salary > '500000';



SELECT * FROM employees WHERE salary = '500000';
SELECT * FROM employees WHERE salary = '2000';
SELECT * FROM employees WHERE salary = 2000;



SELECT 
    TO_DATE('23-APR-2026', 'DD-MON-YYYY') + 15 AS new_date
FROM dual;



SELECT 
    TO_CHAR(CAST(SYSTIMESTAMP AS DATE), 'DD-MON-YYYY') AS only_date
FROM dual;




SELECT
    first_name || ' ' || last_name AS employee_name,
    TO_CHAR(hire_date, 'DD-MON-YYYY HH24:MI:SS') AS hire_date_formatted
FROM employees
ORDER BY hire_date;



CREATE TABLE sales (
    sale_id NUMBER PRIMARY KEY,
    sale_date DATE,
    region VARCHAR2(30),
    amount NUMBER
);



INSERT INTO sales VALUES (1, DATE '2026-01-10', 'East', 500);
INSERT INTO sales VALUES (2, DATE '2026-02-15', 'West', 700);
INSERT INTO sales VALUES (3, DATE '2026-03-20', 'East', 900);
INSERT INTO sales VALUES (4, DATE '2026-04-05', 'North', 400);

COMMIT;


SELECT COUNT(*) AS total_sales_q1
FROM sales
WHERE sale_date BETWEEN DATE '2026-01-01' AND DATE '2026-03-31';




SELECT 
    SUM(amount) AS total_sales_amount
FROM sales;



SELECT 
    region,
    COUNT(*) AS total_sales
FROM sales
GROUP BY region
ORDER BY total_sales DESC;


CREATE TABLE table_1 (
    id NUMBER
);

CREATE TABLE table_2 (
    id NUMBER
);

SELECT *
FROM employees
CROSS JOIN departments;


CREATE TABLE colors (
    color_id NUMBER,
    color_name VARCHAR2(20)
);

CREATE TABLE sizes (
    size_id NUMBER,
    size_label VARCHAR2(10)
);


INSERT INTO colors VALUES (1, 'Red');
INSERT INTO colors VALUES (2, 'Blue');

INSERT INTO sizes VALUES (1, 'Small');
INSERT INTO sizes VALUES (2, 'Medium');

COMMIT;

SELECT *
FROM colors
CROSS JOIN sizes;

SELECT table_name FROM user_tables;

SELECT *
FROM employees
CROSS JOIN departments;




-- Query to create the table
CREATE TABLE project_details (
    p_id INT PRIMARY KEY,
    p_name VARCHAR2(50),
    submission_date DATE,
    budget NUMBER(10, 2),
    is_completed CHAR(1)
);

-- Show table description
DESC project_details;


----Stored Procedures, Merge, (Practice)

--CREATE DATABASE Class19


--stored proc is an object that stores some code in it


--stored proc can be used repeatedly

--easy to modify

--CREATE PROCEDURE usp_get_now
--AS
--BEGIN
--	SELECT GETDATE() AS TODAY
--END

--EXECUTE dbo.usp_get_now

--EXEC dbo.usp_get_now

--dbo.usp_get_now

--CREATE PROC


-------BIRTHDATE
--USING BIRTHDATE FIND THE AGE

--ALTER PROC usp_get_age @birthDAY DATE = '2000-01-01'
--AS
--BEGIN
--	DECLARE @BIRTHDATE DATE = @birthDAY

--	SELECT  	CASE WHEN DATEPART(DAYOFYEAR,@BIRTHDATE) < DATEPART(DAYOFYEAR,GETDATE()) THEN DATEDIFF(YEAR,@BIRTHDATE,GETDATE())
--				ELSE DATEDIFF(YEAR,@BIRTHDATE,GETDATE()) - 1
--				END  AS AGE
--END


--EXEC usp_get_age '2001-04-10'


--EXEC usp_get_age 


--CREATE FUNCTION udf_get_age (@birthday DATE = '2000-01-01')
--RETURNS INT
--AS
--BEGIN
--	DECLARE @BIRTHDATE DATE = @birthDAY

--	RETURN CASE WHEN DATEPART(DAYOFYEAR,@BIRTHDATE) < DATEPART(DAYOFYEAR,GETDATE()) THEN DATEDIFF(YEAR,@BIRTHDATE,GETDATE())
--				ELSE DATEDIFF(YEAR,@BIRTHDATE,GETDATE()) - 1
--				END
--END


--SELECT dbo.udf_get_age('1998-04-21')

--ALTER PROC usp_get_info_by_gender @gender VARCHAR(1), @HIRED_YEAR INT
--AS
--BEGIN

--	SELECT concat(P.[FirstName], ' ', P.[LastName]) AS Full_Name,  
--		   EA.EmailAddress,  
--		   PP.PhoneNumber  ,
--		 E.Gender,
--		 E.HireDate
--	FROM [AdventureWorks2019].[Person].[Person] as P  
--	JOIN [AdventureWorks2019].[Person].[EmailAddress] as EA  
--		ON P.BusinessEntityID = EA.BusinessEntityID  
--	JOIN [AdventureWorks2019].[Person].[PersonPhone] as PP  
--		ON P.BusinessEntityID = PP.BusinessEntityID  
--	JOIN AdventureWorks2019.HumanResources.Employee as E
--	  ON PP.BusinessEntityID = E.BusinessEntityID
--	WHERE E.Gender = @gender AND YEAR(E.HireDate) > @HIRED_YEAR
--END

----create an Stored Proc that will return info based on Gender parameter
--EXEC usp_get_info_by_gender @HIRED_YEAR = 2008, @GENDER = 'F'

--SP=sp = STORED PROCEDURE



TRUNCATE TABLE EMPLOYEES
--TRUNCATE TABLE EMPLOYEESUPDATED




CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employees (EmployeeID, Name, Department, Salary) VALUES
(1, 'Alice', 'HR', 60000),
(2, 'Bob', 'HR', 75000),
(3, 'Charlie', 'IT', 50000);
CREATE TABLE EmployeesUpdated (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO EmployeesUpdated (EmployeeID, Name, Department, Salary) VALUES
(2, 'Bob', 'HR', 80000),   -- Existing employee (salary update)
(3, 'Charlie', 'IT', 50000), -- Same data (no change)
(4, 'David', 'Finance', 70000); -- New employee (insert)


SELECT * FROM Employees

SELECT * FROM EmployeesUpdated

DELETE Employees
WHERE EmployeeID NOT IN (SELECT EmployeeID FROM EmployeesUpdated)


INSERT INTO Employees (EmployeeID,NAME,Department,Salary)
SELECT EmployeeID,Name,Department,Salary FROM EmployeesUpdated WHERE EmployeeID NOT IN (SELECT EmployeeID FROM Employees)

UPDATE E
SET Salary = EU.Salary
FROM Employees E JOIN EmployeesUpdated EU ON E.EmployeeID = EU.EmployeeID
WHERE E.Salary <> EU.Salary


SELECT * FROM Employees

SELECT * FROM EmployeesUpdated

--MERGE
MERGE EMPLOYEES AS TARGET
USING EMPLOYEESUPDATED AS SOURCE

ON TARGET.EMPLOYEEID = SOURCE.EMPLOYEEID

WHEN MATCHED
THEN
	UPDATE 
		SET TARGET.NAME = SOURCE.NAME,
			TARGET.DEPARTMENT = SOURCE.DEPARTMENT,
			TARGET.SALARY = SOURCE.SALARY

WHEN NOT MATCHED BY TARGET --NOT IN EMPLOYEES
THEN
	INSERT (
		EMPLOYEEID,
		NAME,
		DEPARTMENT,
		SALARY)
	VALUES
		(
		SOURCE.EMPLOYEEID,
		SOURCE.NAME,
		SOURCE.DEPARTMENT,
		SOURCE.SALARY
		)
WHEN NOT MATCHED BY SOURCE
THEN
	DELETE;
	




--CUSTOMERS (CUSTOMERID PRIMARY KEY)
--CUSTID,NAME,ADDRESS,PHONE

--ORDERS/SALES(CUSTOMERID FOREIGN KEY)
--ORDERID,CUSTID,EMPID,ORDERAMOUNT,ORDERDATE


--task1

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2)
);

INSERT INTO employees (id, name, salary) VALUES
(1, 'Alice', 50000),
(2, 'Bob', 60000),
(3, 'Charlie', 50000);

select * from employees where  salary in (select min(salary) from employees)
--task2
CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);
INSERT INTO products (id, product_name, price) VALUES
(1, 'Laptop', 1200),
(2, 'Tablet', 400),
(3, 'Smartphone', 800),
(4, 'Monitor', 300);
--task2  
select * from products 
where price > (select avg(price) from products)
--task3  3. 
SELECT * 
FROM employees 
WHERE department_id IN (
    SELECT id 
    FROM departments
    WHERE department_name = 'Sales');


CREATE TABLE departments (
    id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO departments (id, department_name) VALUES
(1, 'Sales'),
(2, 'HR');

INSERT INTO employees (id, name, department_id) VALUES
(1, 'David', 1),
(2, 'Eve', 2),
(3, 'Frank', 1);

--task 4  
SELECT * 
FROM customers 
WHERE customer_id NOT IN (
    SELECT customer_id 
    FROM orders
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, name) VALUES
(1, 'Grace'),
(2, 'Heidi'),
(3, 'Ivan');

INSERT INTO orders (order_id, customer_id) VALUES
(1, 1),
(2, 1);
--task5 
SELECT p.*
FROM products p
JOIN (
    SELECT category_id, MAX(price) AS max_price
    FROM products
    GROUP BY category_id
) maxp ON p.category_id = maxp.category_id 
       AND p.price = maxp.max_price;


CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT
);


INSERT INTO products (id, product_name, price, category_id) VALUES
(1, 'Tablet', 400, 1),
(2, 'Laptop', 1500, 1),
(3, 'Headphones', 200, 2),
(4, 'Speakers', 300, 2);

--task 6   
SELECT *
FROM departments
WHERE id = (
    SELECT TOP 1 department_id
    FROM employees
    GROUP BY department_id
    ORDER BY AVG(salary) DESC
);
CREATE TABLE departments (
    id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);
INSERT INTO departments (id, department_name) VALUES
(1, 'IT'),
(2, 'Sales');

INSERT INTO employees (id, name, salary, department_id) VALUES
(1, 'Jack', 80000, 1),
(2, 'Karen', 70000, 1),
(3, 'Leo', 60000, 2);

--7
SELECT * 
FROM employees e
WHERE salary > (
    SELECT AVG(salary) 
    FROM employees 
    WHERE department_id = e.department_id
);
--8
SELECT s.student_id, s.name, g.course_id, g.grade
FROM grades g
JOIN students s ON g.student_id = s.student_id
WHERE (g.course_id, g.grade) IN (
    SELECT course_id, MAX(grade)
    FROM grades
    GROUP BY course_id
);
--9
SELECT * 
FROM products p
WHERE price = (
    SELECT DISTINCT price
    FROM products
    WHERE category_id = p.category_id
    ORDER BY price DESC
    OFFSET 2 ROWS FETCH NEXT 1 ROW ONLY
);
--10
SELECT * 
FROM employees e
WHERE 
    e.salary > (SELECT AVG(salary) FROM employees) AND
    e.salary < (
        SELECT MAX(salary) 
        FROM employees 
        WHERE department_id = e.department_id
    );

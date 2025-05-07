-- Practice
--Subqueries, Stored Procs, Merge

CREATE DATABASE LESSON21

List all employees who earn more than the average salary.

CREATE Table Employee
(
EmpID INT,
EmpName Varchar(30),
Salary Float,
DeptID INT
)

INSERT INTO Employee VALUES(1001,'Mark',60000,2)
INSERT INTO Employee VALUES(1002,'Antony',40000,2)
INSERT INTO Employee VALUES(1003,'Andrew',15000,1)
INSERT INTO Employee VALUES(1004,'Peter',35000,1)
INSERT INTO Employee VALUES(1005,'John',55000,1)
INSERT INTO Employee VALUES(1006,'Albert',25000,3)
INSERT INTO Employee VALUES(1007,'Donald',35000,3)

--19:42

SELECT * FROM Employee

SELECT EmpID,
	   EmpName,
	   Salary,
	   (SELECT AVG(SALARY) FROM Employee) AS AVG_SAL
FROM Employee
WHERE Salary > (SELECT AVG(SALARY) AS AVG_SALARY FROM Employee)

--Write a SQL  to find all Employees who earn more than the average salary in their corresponding department.

SELECT EmpID,EmpName,Salary,E.DeptID,AVG_SAL FROM Employee AS E JOIN (
				SELECT DeptID,AVG(SALARY) AS AVG_SAL FROM Employee
				GROUP BY DeptID) AS 
		AVG_SALS
ON E.DeptID = AVG_SALS.DeptID
WHERE E.Salary > AVG_SALS.AVG_SAL

SELECT * FROM Employee AS OUTS
WHERE Salary > (SELECT AVG(SALARY) FROM Employee AS INS WHERE INS.DeptID = OUTS.DeptID)

--CORRELATED SUBQUERY


SELECT DeptID,AVG(SALARY) FROM Employee 
group by DeptID


return the department id which has Highest average salary

;WITH AVG_SAL_PER_DEPARTMENT AS(
SELECT DeptID,AVG(SALARY) AS AVG_SAL_PER_DEPT FROM Employee
GROUP BY DeptID
), CTE1 AS(
SELECT MAX(AVG_SAL_PER_DEPT) AS MAX_AVG_SAL FROM AVG_SAL_PER_DEPARTMENT
)
SELECT * FROM AVG_SAL_PER_DEPARTMENT
WHERE AVG_SAL_PER_DEPT = (SELECT MAX_AVG_SAL FROM CTE1)


SELECT * FROM Employee

INSERT INTO Employee VALUES (1008, 'Sam', 90000, 3)

SELECT DeptID,AVG(SALARY) AS AVG_SAL_PER_DEPT FROM Employee
GROUP BY DeptID



select * from tsql2012.hr.employees

Create a stored procedure GetEmployeeDetails that takes an employee ID and returns their full details.


EXEC GetEmployeeDetails 5

--20:55
--usp = USER STORED PROCEDURE


--SP_HELPTEXT usp_GetEmployeeDetails

CREATE PROC usp_GetEmployeeDetails @EMP_ID INT
AS
BEGIN
	SELECT * FROM TSQL2012.HR.Employees WHERE empid = @EMP_ID
END

EXEC usp_GetEmployeeDetails 1





CREATE TABLE StagingCustomers ( --NEW CUSTOMER
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

CREATE TABLE CustomersMain (	--OLD CUSTOMERS
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

--21:15

-- Main Customers Table
INSERT INTO CustomersMain VALUES
(1, 'Ahmad'), (2, 'Zarina'), (3, 'Anvar'), (4, 'Kamola'), (5, 'Jasur'),
(6, 'Nilufar'), (7, 'Siroj'), (8, 'Dilshod'), (9, 'Lobar'), (10, 'Murod'),
(11, 'Iroda'), (12, 'Alisher'), (13, 'Bobur'), (14, 'Sherzod'), (15, 'Zulfiya');

-- Staging (some updated names, some new, some removed)
INSERT INTO StagingCustomers VALUES
(1, 'Ahmad'), (2, 'Zarina Karimova'), (3, 'Anvar'), (16, 'Komil'), (17, 'Rayhon');



SELECT * FROM CustomersMain --TARGET --WHICH HAS THE OLD DATA

SELECT * FROM StagingCustomers --SOURCE --WHICH HAS THE NEW DATA

SELECT * FROM CustomersMain TARGET FULL JOIN StagingCustomers SOURCE 
ON TARGET.CUSTOMERID = SOURCE.CUSTOMERID

MERGE CustomersMain AS TARGET
USING StagingCustomers AS SOURCE

ON TARGET.CUSTOMERID = SOURCE.CUSTOMERID

WHEN MATCHED
THEN 
	UPDATE 
	SET TARGET.CUSTOMERNAME = SOURCE.CUSTOMERNAME

WHEN NOT MATCHED BY TARGET
THEN	
	INSERT
	(
		CUSTOMERID,
		CUSTOMERNAME
	)
	VALUES
	(
		SOURCE.CUSTOMERID,
		SOURCE.CUSTOMERNAME
	)

WHEN NOT MATCHED BY SOURCE
THEN 
	DELETE;


SELECT * FROM CustomersMain

SELECT * FROM StagingCustomers

--1.Write a query to assign a row number to each sale based on the SaleDate.
SELECT 
    SaleID, ProductName, SaleDate,SaleAmount,Quantity,
    ROW_NUMBER() OVER(ORDER BY SaleDate) AS RowNum
FROM ProductSales;
--2  Write a query to rank products based on the total quantity sold (use DENSE_RANK())
SELECT 
    ProductName,
    SUM(Quantity) AS TotalQuantity,
    DENSE_RANK() OVER (ORDER BY SUM(Quantity) DESC) AS QuantityRank
FROM ProductSales
GROUP BY ProductName;
--3 Напишите запрос, чтобы определить лучшие продажи для каждого клиента на основе суммы продажи.
WITH RankedSales AS (
    SELECT
        CustomerID,
        SaleID,
        SaleAmount,
        ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY SaleAmount DESC) AS rn
    FROM ProductSales
)
SELECT
    CustomerID,
    SaleID,
    SaleAmount
FROM RankedSales
WHERE rn = 1;
--4 Write a query to display each sale's amount along with the next sale amount in the order of SaleDate using the LEAD() function
SELECT
    SaleID,
    ProductName,
    SaleDate,
    SaleAmount,
    LEAD(SaleAmount) OVER (ORDER BY SaleDate) AS NextSaleAmount
FROM ProductSales;
--5 
SELECT
    SaleID,
    ProductName,
    SaleDate,
    SaleAmount,
    LAG(SaleAmount) OVER (ORDER BY SaleDate) AS PreviousSaleAmount
FROM ProductSales;
--6
SELECT
    SaleID,
    ProductName,
    SaleAmount,
    RANK() OVER (PARTITION BY ProductName ORDER BY SaleAmount DESC) AS SaleRank
FROM ProductSales;


CREATE TABLE SalesData (
    SaleID INT PRIMARY KEY,
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    Region VARCHAR(50),
    Product VARCHAR(100),
    UnitsSold INT,
    UnitPrice DECIMAL(10,2),
    SaleAmount AS (UnitsSold * UnitPrice) PERSISTED,
    SaleDate DATE
);
INSERT INTO SalesData (SaleID, EmployeeID, EmployeeName, Department, Region, Product, UnitsSold, UnitPrice, SaleDate)
VALUES
(1, 101, 'Alice',   'Electronics', 'East',  'Laptop',      2, 750.00, '2024-01-01'),
(2, 102, 'Bob',     'Electronics', 'East',  'Mouse',       5, 20.00,  '2024-01-02'),
(3, 101, 'Alice',   'Electronics', 'East',  'Keyboard',    3, 45.00,  '2024-01-03'),
(4, 103, 'Charlie', 'Home',        'West',  'Toaster',     4, 30.00,  '2024-01-04'),
(5, 104, 'David',   'Home',        'West',  'Microwave',   1, 200.00, '2024-01-05'),
(6, 101, 'Alice',   'Electronics', 'East',  'Monitor',     1, 300.00, '2024-01-06'),
(7, 102, 'Bob',     'Electronics', 'East',  'Mouse',       6, 20.00,  '2024-01-07'),
(8, 103, 'Charlie', 'Home',        'West',  'Blender',     2, 60.00,  '2024-01-08'),
(9, 104, 'David',   'Home',        'West',  'Microwave',   1, 200.00, '2024-01-09'),
(10,101, 'Alice',   'Electronics', 'East',  'Laptop',      1, 750.00, '2024-01-10'),
(11,105, 'Ella',    'Furniture',   'North', 'Chair',       10, 40.00, '2024-01-03'),
(12,105, 'Ella',    'Furniture',   'North', 'Table',       1, 150.00, '2024-01-04'),
(13,106, 'Frank',   'Furniture',   'North', 'Desk',        1, 220.00, '2024-01-05'),
(14,106, 'Frank',   'Furniture',   'North', 'Chair',       5, 40.00,  '2024-01-06'),
(15,107, 'Grace',   'Toys',        'South', 'Drone',       2, 120.00, '2024-01-07'),
(16,107, 'Grace',   'Toys',        'South', 'Puzzle',      6, 15.00,  '2024-01-08'),
(17,108, 'Helen',   'Toys',        'South', 'Puzzle',      4, 15.00,  '2024-01-09'),
(18,108, 'Helen',   'Toys',        'South', 'Board Game',  3, 30.00,  '2024-01-10'),
(19,105, 'Ella',    'Furniture',   'North', 'Table',       1, 150.00, '2024-01-11'),
(20,106, 'Frank',   'Furniture',   'North', 'Desk',        1, 220.00, '2024-01-12');


--7 Write a query to identify sales amounts that are greater than the previous sale's amount  
WITH SalesWithPrev AS (
    SELECT
        SaleID,
        SaleDate,
        SaleAmount,
        LAG(SaleAmount) OVER (ORDER BY SaleDate) AS PrevSaleAmount
    FROM ProductSales
)
SELECT *,
       CASE 
           WHEN PrevSaleAmount IS NULL THEN 'No previous sale'
           WHEN SaleAmount > PrevSaleAmount THEN 'Greater than previous'
           ELSE 'Not greater'
       END AS ComparisonStatus
FROM SalesWithPrev;
--8
SELECT 
    SaleID,
    ProductName,
    SaleDate,
    SaleAmount,
    LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) AS PrevSaleAmount,
    SaleAmount - LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) AS AmountDifference
FROM ProductSales;
--9
SELECT 
    SaleID,
    ProductName,
    SaleDate,
    SaleAmount,
    LEAD(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) AS NextSaleAmount,
    CASE 
        WHEN LEAD(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) IS NOT NULL
             AND SaleAmount <> 0
        THEN 
            CAST(LEAD(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) - SaleAmount AS FLOAT) 
            / SaleAmount * 100
        ELSE NULL
    END AS PercentageChange
FROM ProductSales;

--10
SELECT  SaleID,
    ProductName,
    SaleDate,
    SaleAmount,
    LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) AS PrevSaleAmount,
	SaleAmount/LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) AS Ratio
FROM ProductSales;
--11
WITH FirstSales AS (
    SELECT
        ProductName,
        SaleAmount AS FirstSaleAmount
    FROM (
        SELECT
            ProductName,
            SaleAmount,
            ROW_NUMBER() OVER (PARTITION BY ProductName ORDER BY SaleDate, SaleID) AS rn
        FROM ProductSales
    ) AS ranked
    WHERE rn = 1
)
SELECT
    ps.SaleID,
    ps.ProductName,
    ps.SaleDate,
    ps.SaleAmount,
    fs.FirstSaleAmount,
    ps.SaleAmount - fs.FirstSaleAmount AS DifferenceFromFirst
FROM ProductSales ps
JOIN FirstSales fs ON ps.ProductName = fs.ProductName
ORDER BY ps.ProductName, ps.SaleDate;
--12
select * from (
	SELECT  SaleID,
		ProductName,
		SaleDate,
		SaleAmount,
		LAG(SaleAmount) OVER ( ORDER BY SaleDate) AS PrevSaleAmount
	FROM ProductSales) as sss
	where SaleAmount > PrevSaleAmount
--13
	SELECT  SaleID,
		ProductName,
		SaleDate,
		SaleAmount,
		sum(SaleAmount) OVER ( ORDER BY SaleID) AS PrevSaleAmount
	FROM ProductSales
--14
SELECT 
    SaleID,
    ProductName,
    SaleDate,
    SaleAmount,
    AVG(SaleAmount) OVER (
        ORDER BY SaleDate 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS MovingAvgLast3
FROM ProductSales;
--15
SELECT 
    SaleID,
    ProductName,
    SaleDate,
    SaleAmount,
    SaleAmount - AVG(SaleAmount) OVER () AS DiffFromAvg
FROM ProductSales;
--16
CREATE TABLE Employees1 (
    EmployeeID   INT PRIMARY KEY,
    Name         VARCHAR(50),
    Department   VARCHAR(50),
    Salary       DECIMAL(10,2),
    HireDate     DATE
);

INSERT INTO Employees1 (EmployeeID, Name, Department, Salary, HireDate) VALUES
(1, 'John Smith', 'IT', 60000.00, '2020-03-15'),
(2, 'Emma Johnson', 'HR', 50000.00, '2019-07-22'),
(3, 'Michael Brown', 'Finance', 75000.00, '2018-11-10'),
(4, 'Olivia Davis', 'Marketing', 55000.00, '2021-01-05'),
(5, 'William Wilson', 'IT', 62000.00, '2022-06-12'),
(6, 'Sophia Martinez', 'Finance', 77000.00, '2017-09-30'),
(7, 'James Anderson', 'HR', 52000.00, '2020-04-18'),
(8, 'Isabella Thomas', 'Marketing', 58000.00, '2019-08-25'),
(9, 'Benjamin Taylor', 'IT', 64000.00, '2021-11-17'),
(10, 'Charlotte Lee', 'Finance', 80000.00, '2016-05-09'),
(11, 'Ethan Harris', 'IT', 63000.00, '2023-02-14'),
(12, 'Mia Clark', 'HR', 53000.00, '2022-09-05'),
(13, 'Alexander Lewis', 'Finance', 78000.00, '2015-12-20'),
(14, 'Amelia Walker', 'Marketing', 57000.00, '2020-07-28'),
(15, 'Daniel Hall', 'IT', 61000.00, '2018-10-13'),
(16, 'Harper Allen', 'Finance', 79000.00, '2017-03-22'),
(17, 'Matthew Young', 'HR', 54000.00, '2021-06-30'),
(18, 'Ava King', 'Marketing', 56000.00, '2019-04-16'),
(19, 'Lucas Wright', 'IT', 65000.00, '2022-12-01'),
(20, 'Evelyn Scott', 'Finance', 81000.00, '2016-08-07');

--16
WITH RankedEmployees AS (
    SELECT 
        EmployeeID,
        Department,
        Salary,
        RANK() OVER(ORDER BY Salary DESC) AS SalaryRank
    FROM Employees1
)
SELECT *
FROM RankedEmployees
WHERE SalaryRank IN (
    SELECT SalaryRank
    FROM RankedEmployees
    GROUP BY SalaryRank
    HAVING COUNT(*) > 1
);

--17 Определите 2 самые высокие зарплаты в каждом отделе

select * from (
select *,    DENSE_RANK() OVER(PARTITION BY Department ORDER BY Salary DESC) AS DenseRankNum
 from Employees1) as sss
 where DenseRankNum in (1,2)

 --18 Найдите самого низкооплачиваемого сотрудника в каждом Отделе
 select * from (
select *,    DENSE_RANK() OVER(PARTITION BY Department ORDER BY Salary asc) AS DenseRankNum
 from Employees1) as sss
 where DenseRankNum = 1
 --19 Calculate the Running Total of Salaries in Each Department
SELECT *, 
    SUM(Salary) OVER(PARTITION BY Department ORDER BY Salary ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningTotal
FROM Employees1;
--20
SELECT 
    EmployeeID, 
    Department, 
    Salary, 
    sum(Salary) OVER(PARTITION BY Department) AS DepartmentTotal
FROM Employees1;
--21  Рассчитайте среднюю заработную плату в каждом отделе Без ГРУППИРОВКИ ПО
SELECT 
    EmployeeID, 
    Department, 
    Salary, 
    avg(Salary) OVER(PARTITION BY Department) AS DepartmentTotal
FROM Employees1;

--22 Найдите разницу между зарплатой сотрудника и средним показателем по его отделу
SELECT 
    EmployeeID, 
    Department, 
    Salary, 
    avg(Salary) OVER(PARTITION BY Department) AS DepartmentTotal,
	Salary -avg(Salary) OVER(PARTITION BY Department) AS ss
FROM Employees1
order by Salary desc
--23
select 
    EmployeeID, 
    Department, 
    Salary, 
    avg(Salary) over( order by Salary ROWS  between 1 PRECEDING AND 1 FOLLOWING) AS DepartmentTotal
from Employees1
--24
SELECT SUM(Salary)
FROM (
    SELECT TOP 3 Salary
    FROM Employees1
    ORDER BY HireDate DESC
) AS Last3;

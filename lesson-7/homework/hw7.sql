create database Lesson7

--Aggregate Functions

--Min and Max

select Name, max(salary) from Employees2
group by Name


select name, min(salary) from Employees2

select *from Employees2

--Count

CREATE TABLE EMP ([EmployeeID] INT
      ,[Name] VARCHAR(50)
      ,[DepartmentID] INT
      ,[Salary] FLOAT
      ,[HireDate] DATE)

INSERT INTO EMP (EmployeeID, Name, DepartmentID, Salary, HireDate) VALUES
(1, 'Alice Johnson', 101, 55000, '2020-03-15'),
(2, 'Bob Smith', 102, NULL, '2018-07-23'),
(3, 'Charlie Brown', 103, 62000, '2019-11-05'),
(4, 'David White', 101, NULL, '2021-06-30'),
(5, 'Emma Wilson', 104, 70000, '2017-09-12'),
(6, 'Frank Thomas', 102, 48000, '2022-02-20'),
(7, 'Grace Lee', 103, NULL, '2015-05-10');

select *from EMP

select count (salary) from EMP 
select count (*) from EMP where salary is null

select count(distinct departmentID) from EMP   --Distinct --unique znacheniyalani sanaydi keyn sonini keltirib chiqaradi
--Average

SELECT [DepartmentID],
count(name) as numberofEmp,
      avg([Salary]) as AvgSalary
    FROM [w3resource].[dbo].[Employees2]
  group by [departmentID]

  select count(*) from Employees2

  --Sum

  select 
  productid, 
  count(CustomerID) as count_Cust,
  sum(SaleAmount) as TotalSale
  from Sales
  group by ProductID

  --Having

  select 
  CustomerID,
  count(distinct ProductID) as Products,
  count(SaleID) as SaleCount,
  sum(SaleAmount)
  from Sales
  group by CustomerID      ----har bir client 2 xil productni 4 martadan sotib olgan

  select *from Sales

  select 
  customer_ID,
  count(ord_no) as Orders,
  sum(purch_amt) as Amount
  from Orders
  group by customer_id
  having count(ord_no) > 1     ---where bilan aggregate function ishlatib bolmaydi

  select *from orders
  where ord_no in (select ord_no from orders where ord_no > 1)

  select * from orders
  where ord_no in (select ord_no from orders            --bir martadan kop savdo qilgan customerni topish kere subquery bilan topish kerak.
  where purch_amt > 1000)

  select *from
  (select *from orders where purch_amt > 1000) a   --subquery, 1-skobkani ichi run boladi, keyn tashqaridagi query ishlidi
  where a.customer_id = 3007

  --Pivot and Unpivot

 
CREATE TABLE Sales2 (
    Product VARCHAR(10),
    Year INT,
    Sales INT
);

INSERT INTO Sales2 (Product, Year, Sales) VALUES
('A', 2022, 1000),
('A', 2023, 1500),
('A', 2024, 1700),
('B', 2022, 1200),
('B', 2023, 1800),
('B', 2024, 1900),
('C', 2022, 1100),
('C', 2023, 1400),
('C', 2024, 1600);


CREATE TABLE SalesPivot (
    Product VARCHAR(10),
    [2022] INT,
    [2023] INT,
    [2024] INT
);

INSERT INTO SalesPivot (Product, [2022], [2023], [2024]) VALUES
('A', 1000, 1500, 1700),
('B', 1200, 1800, 1900),
('C', 1100, 1400, 1600);

--Pivot   --rowlani columnlaga aylantirsa boladi

select *from Sales2
Pivot (
sum(Sales) for [Year] in ([2022], [2023], [2024])
) as PivotTable
insert into sales2 values ('A', 2022, 2000)

select *from SalesPivot
Unpivot (
Sales for [Year] in ([2022],[2023],[2024])
) as unpvt                                        --alias надо хорошо изучить

--HW Lesson 7
--1.
select *from products
select  min(price) as minPrice from products


--2.
select  max(price) as maxPrice from Products
--3.
select * from customers
select count (*) as NumberofCustomers from customers

--4.

SELECT COUNT(DISTINCT Category) AS UniqueCategories FROM Products;
--5.
select *from sales 


select 
  productid, 
  sum(SaleAmount) as TotalSale
  from Sales
  group by ProductID

  --6.
  select *from employees
  SELECT AVG(Age) AS AvgEmployeeAge FROM Employees;

  --7. 
  select *from EmployeeDepartments
  select DepartmentName, 
  count(*) as EmployeeCount
   from EmployeeDepartments
  group by DepartmentName

  --8.
  select *from products
  SELECT Category, MIN(Price) AS MinPrice, MAX(Price) AS MaxPrice 
FROM Products 
GROUP BY Category;
--9.
select *from sales
SELECT CustomerID, SUM(SaleAmount) AS TotalSales 
FROM Sales 
GROUP BY CustomerID;

SELECT Region, SUM(SalesAmount) AS TotalSales 
FROM Sales 
GROUP BY Region;

--10.
select*from EmployeeDepartments

select 
  DEpartmentName,
  count(*) as EmployeeCount
   from EmployeeDepartments
  group by DepartmentName
  having count(*) > 5 

  --Medium Tasks

  --11.
  select *from Sales
  
  SELECT ProductID, SUM(SaleAmount) AS TotalSales, AVG(SaleAmount) AS AvgSales
FROM Sales
GROUP BY ProductID;

--12.
select *from Employees

SELECT Job_ID, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY JOB_ID;
--13.
select *from Employees

select Department_ID, min(salary) as minSalary,
max(salary) as MaxSalary
from employees
group by Department_ID
--14.
select *from employees
select Department_ID, avg(salary) as AvgSalary
from employees
group by DEPARTMENT_ID

--15.
select 
DEPARTMENT_ID,
avg(salary) as AvgSalary,
count(*) as EmployeesCount
from employees
group by DEPARTMENT_ID

--16.
select *from products
select 
  ProductName,
  avg(Price) as AvgPrice
   from Products
  group by ProductName
  having avg(price) > 100 

  --17.
  select *from Products

SELECT COUNT(DISTINCT ProductName) AS ProductsAbove100
FROM products
WHERE StockQuantity > 100;
--18.
select *from Sales
SELECT YEAR(SaleDate) AS Year, SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY YEAR(SaleDate);

--19.
select*from orders
SELECT ord_date, COUNT(DISTINCT Customer_ID) AS CustomerCount
FROM Orders
GROUP BY ord_date;

--20.
select *from employees
SELECT DEPARTMENT_ID, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY DEPARTMENT_ID
HAVING SUM(Salary) > 100000;

--21.
select *from Products
select 
  Category,
  avg(Price) as AvgPrice
   from Products
  group by Category
  having avg(price) > 200 

  --22.
  select*from sales
  select saleID,
  sum(SaleAmount) as TotalSales
  from Sales
  group by SaleID
  Having sum(SaleAmount) > 5000;

  --23.
  select *from employees
  select 
DEPARTMENT_ID,
avg(salary) as AvgSalary,
sum(SALARY) as SumSalary
from employees
group by DEPARTMENT_ID
having avg(salary) > 6000;
--24.
select *from orders
select customer_ID, min(purch_amt) as minPurch,
max(purch_amt) as MaxPurch
from orders
group by customer_id
having min(purch_amt) >= 50

--25.
select *from Products_Discontinued
SELECT ProductID, SUM(Price) AS TotalSales, 
COUNT(DISTINCT ProductID) AS UniqueProductsSold
FROM Products_Discontinued
GROUP BY ProductID
HAVING COUNT(DISTINCT ProductID) > 10;

--26.
select *from Products
SELECT Category, MIN(StockQuantity) AS MinOrderQty,
MAX(StockQuantity) AS MaxOrderQty
FROM Products
GROUP BY Category;

--27.
select *from sales

SELECT SaleID, SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY SaleID
HAVING SUM(SaleAmount) > 100;

--28.
SELECT YEAR(SaleDate) AS Year, SUM(SaleAmount) 
AS TotalSales
FROM Sales
GROUP BY YEAR(SaleDate);

--29.
select *from orders
SELECT customer_id, 
COUNT(DISTINCT customer_id) AS CustomerCount
FROM Orders
GROUP BY customer_id;

--30.
select *from employees
SELECT EmployeeID, 
       SUM(CASE WHEN Quarter = 'Q1' THEN SalesAmount ELSE 0 END) AS Q1_Sales,
       SUM(CASE WHEN Quarter = 'Q2' THEN SalesAmount ELSE 0 END) AS Q2_Sales,
       SUM(CASE WHEN Quarter = 'Q3' THEN SalesAmount ELSE 0 END) AS Q3_Sales,
       SUM(CASE WHEN Quarter = 'Q4' THEN SalesAmount ELSE 0 END) AS Q4_Sales
FROM Employees
GROUP BY EmployeeID;


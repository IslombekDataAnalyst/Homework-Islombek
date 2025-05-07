----Subquries,Exists

--Subquries

--Independent Subquery


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

SELECT * FROM EmployeesUpdated WHERE EmployeeID NOT IN (SELECT EmployeeID FROM Employees)

--CAN BE EXECUTED INDEPENDENTLY

create table numbers1 (number int)
insert into numbers1 values (1),(2), (3), (5)

create table numbers2 (number int)
insert into numbers2 values (1),(2), (3), (4)

--FIND THOSE NUMBERS WHICH EXISTS IN THE NUMBERS1 TABLE BUT DOESN'T EXISTS IN THE NUMBERS2 TABLE

SELECT * FROM numbers1 WHERE NUMBER NOT IN (SELECT number FROM numbers2)



SELECT * FROM TSQL2012.SALES.Orders

SELECT COUNT(DISTINCT custid) FROM TSQL2012.SALES.Orders

SELECT COUNT(CUSTID) FROM TSQL2012.Sales.Customers

--FIND THOSE 2 CUSTOMERS WHO HAVEN'T MADE ANY ORDERS

SELECT * FROM TSQL2012.Sales.Customers WHERE custid NOT IN (SELECT DISTINCT custid FROM TSQL2012.SALES.Orders)

Select * from TSQL2012.Sales.Customers where custid not in (select custid from TSQL2012.sales.Orders)


--Correlated Subquery


SELECT custid,MAX(FREIGHT) AS MAXX FROM TSQL2012.SALES.Orders
GROUP BY custid

SELECT C.custid,contactname,contacttitle,address,CITY,MAXX
FROM TSQL2012.Sales.Customers AS C
JOIN 
	(SELECT custid,MAX(FREIGHT) AS MAXX FROM TSQL2012.SALES.Orders
	GROUP BY custid) AS MAX_OS	ON C.custid = MAX_OS.custid
ORDER BY custid



SELECT custid,
	   contactname,
	   contacttitle,
	   address,
	   CITY,
	   (SELECT MAX(FREIGHT) FROM TSQL2012.Sales.Orders AS O WHERE O.custid = C.custid) AS MAXX
FROM TSQL2012.Sales.Customers AS C


SELECT orderID,
		custid,
		(SELECT C.contactname FROM TSQL2012.SALES.Customers AS C  WHERE C.custid = O.custid) AS CUST_NAME,
		(SELECT CONCAT_WS(' ',LASTNAME, firstname) FROM TSQL2012.HR.Employees AS E WHERE E.empid = O.empid) AS EMP_NAME,
		empid,
		orderdate,
		freight 
FROM TSQL2012.Sales.Orders AS O


----I want to find the HIGHEST payment for each PAYER
create table payments (  
    payerid int,  
    payment_amount int,  
    payment_date date  
); 

insert into payments  
values (1, 1000, '01/01/2018'),  
       (1, 1800, '02/07/2018'),  
       (2, 1500, '03/11/2018'),  
       (2, 180, '01/01/2018'),  
       (2, 15750, '03/11/2018'),  
       (3, 1050, '01/01/2018'),  
       (3, 2100, '02/07/2018'),  
       (3, 1300, '03/11/2018');  

create table payer (  
    payerid int,  
    name varchar(20)  
);  

insert into payer  
values (1, 'Sam'),  
       (2, 'Nancy'),  
       (3, 'Rocky'),  
       (4, 'Bek');  


SELECT * FROM payments

SELECT *,(SELECT MAX(payment_amount) FROM payments AS P WHERE P.payerid = PA.payerid) AS MAX_PAYMENT
		,(SELECT MAX(payment_date) FROM payments AS P WHERE P.payerid = PA.payerid) AS MAX_DATE
FROM payer AS PA



select  *,
    (select top 1 payment_date from payments p 
    where payerid=payer.payerid order by payment_date desc ) as last_pay 
from payer




-- Puzzle 3: Find Employees Who Have No Assigned Projects
CREATE TABLE Employees1 (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100)
);

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    EmployeeID INT,
    ProjectName VARCHAR(100),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

INSERT INTO Employees1 (EmployeeID, EmployeeName) VALUES
(1, 'John'),
(2, 'Sarah'),
(3, 'Michael'),
(4, 'Emma');

INSERT INTO Projects (ProjectID, EmployeeID, ProjectName) VALUES
(203, 1, 'Project C'),
(202, 2, 'Project B');

SELECT *,(SELECT TOP 1 PROJECTNAME FROM Projects AS P WHERE P.EmployeeID = E.EmployeeID ORDER BY ProjectID DESC) FROM Employees1 AS E

SELECT * FROM Employees1
SELECT * FROM Projects

SELECT PROJECTNAME FROM Projects AS P WHERE P.EmployeeID = 1




-------------------Exists


--DROP TABLE IF EXISTS 

--exists = bor, mavjud

SELECT * FROM payments WHERE NOT EXISTS (SELECT 1 WHERE 2=1)


SELECT * FROM Employees WHERE EXISTS (SELECT 1 WHERE 2=1)


SELECT * FROM Employees WHERE EXISTS (SELECT 100 )


SELECT * FROM numbers1 AS N1 WHERE  EXISTS (SELECT NUMBER FROM numbers2 AS N2 WHERE N1.number = N2.number)


SELECT * FROM numbers1 AS N1 WHERE EXISTS (SELECT NUMBER FROM numbers2)


SELECT * FROM numbers1 AS N1 WHERE NUMBER IN (SELECT NUMBER FROM numbers2)


SELECT * FROM numbers1
--SELECT * FROM numbers2
--FIND THE 3RD LOWEST NUMBER

--2
SELECT MAX(NUMBER) FROM (
SELECT TOP 3 * FROM numbers1
ORDER BY number ASC) AS A




SELECT TOP 1 NUMBER FROM NUMBERS1
WHERE (NUMBER) IN (SELECT TOP 3 * FROM numbers1 ORDER BY number ASC)
ORDER BY number DESC


SELECT * FROM numbers1
ORDER BY number
--	NEW
--0	NULL
--1	0
--2	1
--3	2
--5	3
--7	5
--9	7
--11	9
INSERT INTO numbers1 VALUES (-1)

SELECT *,(SELECT MAX(NUMBER) FROM numbers1 INS WHERE outs.number > ins.number)  FROM NUMBERS1 OUTS
ORDER BY number

SELECT * FROM numbers1
ORDER BY number


CREATE TABLE #Sales (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT,
    Price DECIMAL(10,2),
    SaleDate DATE
);
INSERT INTO #Sales (CustomerName, Product, Quantity, Price, SaleDate) VALUES
('Alice', 'Laptop', 1, 1200.00, '2024-01-15'),
('Bob', 'Smartphone', 2, 800.00, '2024-02-10'),
('Charlie', 'Tablet', 1, 500.00, '2024-02-20'),
('David', 'Laptop', 1, 1300.00, '2024-03-05'),
('Eve', 'Smartphone', 3, 750.00, '2024-03-12'),
('Frank', 'Headphones', 2, 100.00, '2024-04-08'),
('Grace', 'Smartwatch', 1, 300.00, '2024-04-25'),
('Hannah', 'Tablet', 2, 480.00, '2024-05-05'),
('Isaac', 'Laptop', 1, 1250.00, '2024-05-15'),
('Jack', 'Smartphone', 1, 820.00, '2024-06-01');

--1  1. Найдите клиентов, которые приобрели хотя бы один товар в марте 2024 года с помощью EXISTS

SELECT  *
FROM #Sales s1
WHERE EXISTS (
    SELECT 1
    FROM #Sales s2
    WHERE s1.SaleID = s2.SaleID and year(SaleDate) = 2024 and month(SaleDate)=3
);
--2. Find the product with the highest total sales revenue using a subquery.
select top 1 * from (
    SELECT Product, SUM(Quantity * Price) AS total_revenue
    FROM #Sales
    GROUP BY Product) AS revenue_summary
ORDER BY total_revenue DESC
--3 3. Find the second highest sale amount using a subquery
SELECT TOP 1 SaleID, CustomerName, total_revenue
FROM (
    SELECT SaleID, CustomerName, SUM(Quantity * Price) AS total_revenue
    FROM #Sales
    GROUP BY SaleID, CustomerName
) AS revenue_summary
WHERE total_revenue NOT IN (
    SELECT TOP 1 SUM(Quantity * Price) AS total_revenue
    FROM #Sales
    GROUP BY SaleID, CustomerName
    ORDER BY total_revenue DESC
)
ORDER BY total_revenue DESC;
-- 4. Find the total quantity of products sold per month using a subquery
SELECT sale_year, sale_month, month_name, total_quantity
FROM (
    SELECT 
        DATEPART(YEAR, SaleDate) AS sale_year,
        DATEPART(MONTH, SaleDate) AS sale_month,
        DATENAME(MONTH, SaleDate) AS month_name,
        SUM(Quantity) AS total_quantity
    FROM #Sales
    GROUP BY DATEPART(YEAR, SaleDate), DATEPART(MONTH, SaleDate), DATENAME(MONTH, SaleDate)
) AS monthly_summary
ORDER BY sale_year, sale_month;
--5 5. Find customers who bought same products as another customer using EXISTS
SELECT c1.CustomerName , c1.Product,c1.Quantity
FROM #Sales c1
WHERE EXISTS (
    SELECT 1
    FROM #Sales c2
    WHERE c1.Product = c2.Product
      AND c1.CustomerName <> c2.CustomerName
);
--6 6. Укажите, сколько фруктов есть у каждого человека на индивидуальном уровне фруктов
create table Fruits(Name varchar(50), Fruit varchar(50))
insert into Fruits values ('Francesko', 'Apple'), ('Francesko', 'Apple'), ('Francesko', 'Apple'), ('Francesko', 'Orange'),
							('Francesko', 'Banana'), ('Francesko', 'Orange'), ('Li', 'Apple'), 
							('Li', 'Orange'), ('Li', 'Apple'), ('Li', 'Banana'), ('Mario', 'Apple'), ('Mario', 'Apple'), 
							('Mario', 'Apple'), ('Mario', 'Banana'), ('Mario', 'Banana'), 
							('Mario', 'Orange')



WITH cte AS (
    SELECT 
        name,
        Fruit,
        COUNT(*) AS fruit_count
    FROM Fruits
    GROUP BY name, Fruit
)
SELECT
    name,
    SUM(CASE WHEN Fruit = 'Apple' THEN fruit_count ELSE 0 END) AS Apple,
    SUM(CASE WHEN Fruit = 'Orange' THEN fruit_count ELSE 0 END) AS Orange,
    SUM(CASE WHEN Fruit = 'Banana' THEN fruit_count ELSE 0 END) AS Banana
FROM cte
GROUP BY name;

--7. Return older people in the family with younger ones

create table Family(ParentId int, ChildID int)
insert into Family values (1, 2), (2, 3), (3, 4)

WITH FamilyTree AS (
    SELECT ParentID, ChildID
    FROM Family
    UNION ALL
    SELECT ft.ParentID, f.ChildID
    FROM FamilyTree ft
    JOIN Family f ON ft.ChildID = f.ParentID
)
SELECT *
FROM FamilyTree
ORDER BY ParentID, ChildID;

--8. Write an SQL statement given the following requirements. For every customer that had a delivery to California, provide a result set of the customer orders that were delivered to Texas
CREATE TABLE #Orders
(
CustomerID     INTEGER,
OrderID        INTEGER,
DeliveryState  VARCHAR(100) NOT NULL,
Amount         MONEY NOT NULL,
PRIMARY KEY (CustomerID, OrderID)
);


INSERT INTO #Orders (CustomerID, OrderID, DeliveryState, Amount) VALUES
(1001,1,'CA',340),(1001,2,'TX',950),(1001,3,'TX',670),
(1001,4,'TX',860),(2002,5,'WA',320),(3003,6,'CA',650),
(3003,7,'CA',830),(4004,8,'TX',120);

SELECT *
FROM #Orders o1
WHERE o1.DeliveryState = 'TX'
  AND EXISTS (
      SELECT 1
      FROM #Orders o2
      WHERE o2.CustomerID = o1.CustomerID
        AND o2.DeliveryState = 'CA'
  );


 --9. Insert the names of residents if they are missing
create table #residents(resid int identity, fullname varchar(50), address varchar(100))

insert into #residents values 
('Dragan', 'city=Bratislava country=Slovakia name=Dragan age=45'),
('Diogo', 'city=Lisboa country=Portugal age=26'),
('Celine', 'city=Marseille country=France name=Celine age=21'),
('Theo', 'city=Milan country=Italy age=28'),
('Rajabboy', 'city=Tashkent country=Uzbekistan age=22')

select * from #residents

UPDATE #residents
SET address = address + ' name=' + fullname
WHERE address NOT LIKE '%name=%';


--10
CREATE TABLE #Routes
(
RouteID        INTEGER NOT NULL,
DepartureCity  VARCHAR(30) NOT NULL,
ArrivalCity    VARCHAR(30) NOT NULL,
Cost           MONEY NOT NULL,
PRIMARY KEY (DepartureCity, ArrivalCity)
);

INSERT INTO #Routes (RouteID, DepartureCity, ArrivalCity, Cost) VALUES
(1,'Tashkent','Samarkand',100),
(2,'Samarkand','Bukhoro',200),
(3,'Bukhoro','Khorezm',300),
(4,'Samarkand','Khorezm',400),
(5,'Tashkent','Jizzakh',100),
(6,'Jizzakh','Samarkand',50);

WITH RoutePaths AS (
    SELECT 
        CAST(DepartureCity + ' - ' + ArrivalCity AS VARCHAR(MAX)) AS Route,
        ArrivalCity,
        Cost
    FROM #Routes
    WHERE DepartureCity = 'Tashkent'

    UNION ALL

    SELECT
        rp.Route + ' - ' + r.ArrivalCity,
        r.ArrivalCity,
        rp.Cost + r.Cost
    FROM RoutePaths rp
    JOIN #Routes r ON rp.ArrivalCity = r.DepartureCity
    WHERE rp.Route NOT LIKE '%'+r.ArrivalCity+'%' -- tsikl (aylanish) oldini olish
)

SELECT *
FROM RoutePaths
WHERE ArrivalCity = 'Khorezm';


--1111. Rank products based on their order of insertion.
CREATE TABLE #RankingPuzzle
(
     ID INT
    ,Vals VARCHAR(10)
)

 
INSERT INTO #RankingPuzzle VALUES
(1,'Product'),
(2,'a'),
(3,'a'),
(4,'a'),
(5,'a'),
(6,'Product'),
(7,'b'),
(8,'b'),
(9,'Product'),
(10,'c')

WITH CTE AS (
    SELECT 
        ID,
        Vals,
        CASE WHEN Vals = 'Product' THEN ID ELSE NULL END AS product_start
    FROM #RankingPuzzle
),
RecursiveCTE AS (
    SELECT 
        ID,
        Vals,
        product_start
    FROM CTE
    WHERE product_start IS NOT NULL

    UNION ALL

    SELECT 
        c.ID,
        c.Vals,
        r.product_start
    FROM CTE c
    JOIN RecursiveCTE r ON c.ID = r.ID + 1
    WHERE c.product_start IS NULL
)
SELECT 
    ID,
    Vals,
    DENSE_RANK() OVER (ORDER BY product_start) AS ProductRank
FROM RecursiveCTE
ORDER BY ID;

--12. You have to return Ids, what number of the letter would be next if inserted, the maximum length of the consecutive occurence of the same digit
CREATE TABLE #Consecutives
(
     Id VARCHAR(5)  
    ,Vals INT /* Value can be 0 or 1 */
)
 
INSERT INTO #Consecutives VALUES
('a', 1),
('a', 0),
('a', 1),
('a', 1),
('a', 1),
('a', 0),
('b', 1),
('b', 1),
('b', 0),
('b', 1),
('b', 0)

WITH ConsecutiveRuns AS (
    SELECT 
        Id,
        Vals,
        ROW_NUMBER() OVER (PARTITION BY Id ORDER BY (SELECT NULL)) - 
        ROW_NUMBER() OVER (PARTITION BY Id, Vals ORDER BY (SELECT NULL)) AS GroupID
    FROM #Consecutives
),
RunLength AS (
    SELECT 
        Id, 
        GroupID,
        COUNT(*) AS RunLength
    FROM ConsecutiveRuns
    GROUP BY Id, GroupID
),
MaxRun AS (
    SELECT 
        Id, 
        MAX(RunLength) AS MaxRunLength
    FROM RunLength
    GROUP BY Id
)
SELECT 
    r.Id,
    CASE 
        WHEN MAX(r.Vals) = 1 THEN 0  -- If the last value is 1, the next value will be 0
        ELSE 1  -- Otherwise, the next value will be 1
    END AS NextValue,
    m.MaxRunLength
FROM ConsecutiveRuns r
JOIN RunLength rl ON r.Id = rl.Id
JOIN MaxRun m ON r.Id = m.Id
GROUP BY r.Id, m.MaxRunLength;

--Find employees whose sales were higher than the average sales in their department
CREATE TABLE #EmployeeSales (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    SalesAmount DECIMAL(10,2),
    SalesMonth INT,
    SalesYear INT
);

INSERT INTO #EmployeeSales (EmployeeName, Department, SalesAmount, SalesMonth, SalesYear) VALUES
('Alice', 'Electronics', 5000, 1, 2024),
('Bob', 'Electronics', 7000, 1, 2024),
('Charlie', 'Furniture', 3000, 1, 2024),
('David', 'Furniture', 4500, 1, 2024),
('Eve', 'Clothing', 6000, 1, 2024),
('Frank', 'Electronics', 8000, 2, 2024),
('Grace', 'Furniture', 3200, 2, 2024),
('Hannah', 'Clothing', 7200, 2, 2024),
('Isaac', 'Electronics', 9100, 3, 2024),
('Jack', 'Furniture', 5300, 3, 2024),
('Kevin', 'Clothing', 6800, 3, 2024),
('Laura', 'Electronics', 6500, 4, 2024),
('Mia', 'Furniture', 4000, 4, 2024),
('Nathan', 'Clothing', 7800, 4, 2024);

WITH DepartmentAvgSales AS (
    SELECT Department, AVG(SalesAmount) AS AvgSales
    FROM #EmployeeSales
    GROUP BY Department
)
SELECT e.EmployeeID, e.EmployeeName, e.Department, e.SalesAmount
FROM #EmployeeSales e
JOIN DepartmentAvgSales d
    ON e.Department = d.Department
WHERE e.SalesAmount > d.AvgSales;


--14
SELECT e.EmployeeID, e.EmployeeName, e.Department, e.SalesAmount, e.SalesMonth, e.SalesYear
FROM #EmployeeSales e
WHERE EXISTS (
    SELECT 1
    FROM #EmployeeSales e2
    WHERE e.SalesMonth = e2.SalesMonth
    AND e.SalesYear = e2.SalesYear
    AND e.SalesAmount = (SELECT MAX(SalesAmount) FROM #EmployeeSales WHERE SalesMonth = e2.SalesMonth AND SalesYear = e2.SalesYear)
);

--15. Find employees who made sales in every month using NOT EXISTS
CREATE TABLE Products (
    ProductID   INT PRIMARY KEY,
    Name        VARCHAR(50),
    Category    VARCHAR(50),
    Price       DECIMAL(10,2),
    Stock       INT
);

INSERT INTO Products (ProductID, Name, Category, Price, Stock) VALUES
(1, 'Laptop', 'Electronics', 1200.00, 15),
(2, 'Smartphone', 'Electronics', 800.00, 30),
(3, 'Tablet', 'Electronics', 500.00, 25),
(4, 'Headphones', 'Accessories', 150.00, 50),
(5, 'Keyboard', 'Accessories', 100.00, 40),
(6, 'Monitor', 'Electronics', 300.00, 20),
(7, 'Mouse', 'Accessories', 50.00, 60),
(8, 'Chair', 'Furniture', 200.00, 10),
(9, 'Desk', 'Furniture', 400.00, 5),
(10, 'Printer', 'Office Supplies', 250.00, 12),
(11, 'Scanner', 'Office Supplies', 180.00, 8),
(12, 'Notebook', 'Stationery', 10.00, 100),
(13, 'Pen', 'Stationery', 2.00, 500),
(14, 'Backpack', 'Accessories', 80.00, 30),
(15, 'Lamp', 'Furniture', 60.00, 25);

SELECT e.EmployeeID, e.EmployeeName
FROM #EmployeeSales e
WHERE NOT EXISTS (
    SELECT 1
    FROM (SELECT DISTINCT SalesMonth, SalesYear FROM #EmployeeSales) AS months
    WHERE NOT EXISTS (
        SELECT 1
        FROM #EmployeeSales es
        WHERE es.EmployeeID = e.EmployeeID
        AND es.SalesMonth = months.SalesMonth
        AND es.SalesYear = months.SalesYear
    )
)
GROUP BY e.EmployeeID, e.EmployeeName;


--16
SELECT Name
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);

--17
SELECT Name
FROM Products
WHERE Stock < (SELECT MAX(Stock) FROM Products);
--18
SELECT Name
FROM Products
WHERE Category = (SELECT Category FROM Products WHERE Name = 'Laptop');
--19
SELECT Name
FROM Products
WHERE Price > (SELECT MIN(Price) FROM Products WHERE Category = 'Electronics');
--20. Find the products that have a higher price than the average price of their respective category.
CREATE TABLE Orders (
    OrderID    INT PRIMARY KEY,
    ProductID  INT,
    Quantity   INT,
    OrderDate  DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Orders (OrderID, ProductID, Quantity, OrderDate) VALUES
(1, 1, 2, '2024-03-01'),
(2, 3, 5, '2024-03-05'),
(3, 2, 3, '2024-03-07'),
(4, 5, 4, '2024-03-10'),
(5, 8, 1, '2024-03-12'),
(6, 10, 2, '2024-03-15'),
(7, 12, 10, '2024-03-18'),
(8, 7, 6, '2024-03-20'),
(9, 6, 2, '2024-03-22'),
(10, 4, 3, '2024-03-25'),
(11, 9, 2, '2024-03-28'),
(12, 11, 1, '2024-03-30'),
(13, 14, 4, '2024-04-02'),
(14, 15, 5, '2024-04-05'),
(15, 13, 20, '2024-04-08');

SELECT p.Name
FROM Products p
WHERE p.Price > (
    SELECT AVG(p2.Price)
    FROM Products p2
    WHERE p2.Category = p.Category
);

--21
SELECT DISTINCT p.Name
FROM Products p
JOIN Orders o ON p.ProductID = o.ProductID;
--22
SELECT p.Name
FROM Products p
JOIN Orders o ON p.ProductID = o.ProductID
GROUP BY p.Name
HAVING SUM(o.Quantity) > (
    SELECT AVG(total_quantity)
    FROM (
        SELECT SUM(o2.Quantity) AS total_quantity
        FROM Orders o2
        GROUP BY o2.ProductID
    ) AS avg_quantities
);
--23
SELECT p.Name
FROM Products p
LEFT JOIN Orders o ON p.ProductID = o.ProductID
WHERE o.OrderID IS NULL;
--24
SELECT TOP 1 p.Name, SUM(o.Quantity) AS TotalQuantityOrdered
FROM Products p
JOIN Orders o ON p.ProductID = o.ProductID
GROUP BY p.Name
ORDER BY TotalQuantityOrdered DESC;
--25
SELECT p.Name, COUNT(o.OrderID) AS OrderCount
FROM Products p
JOIN Orders o ON p.ProductID = o.ProductID
GROUP BY p.Name
HAVING COUNT(o.OrderID) > (
    SELECT AVG(OrderCount)
    FROM (
        SELECT COUNT(OrderID) AS OrderCount
        FROM Orders
        GROUP BY ProductID
    ) AS subquery
);

--DERIVED TABLE, CTE, RECURSIVE CTE   --kelib chiqqan table degani manosi

CREATE DATABASE LESSON14

Create Table Movie (movie_length int, movie_name nvarchar(25))

Insert Movie values (45, 'Movie1'), (50, 'Movie2'), (76, 'Movie3'), (88, 'Movie4'),
          (122, 'Movie5'), (164, 'Movie6'), (142, 'Movie7'), (120, 'Movie8'), 
          (166, 'Movie9'), (204, 'Movie10')

SELECT *FROM Movie
SELECT
CASE 
WHEN movie_length < 100 THEN 'SHORT'
WHEN movie_length < 150 THEN 'MEDIUM'
WHEN movie_length < 200 THEN 'LONG'
ELSE 'EPIC'
END AS MovieLength, 
count(*) as NumberOfFilms
FROM Movie
Group by CASE 
WHEN movie_length < 100 THEN 'SHORT'
WHEN movie_length < 150 THEN 'MEDIUM'
WHEN movie_length < 200 THEN 'LONG'
ELSE 'EPIC'
END

Select  
MovieLength, 
count(*) as NumberOfMovies
from
(SELECT
CASE 
WHEN movie_length < 100 THEN 'SHORT'
WHEN movie_length < 150 THEN 'MEDIUM'
WHEN movie_length < 200 THEN 'LONG'
ELSE 'EPIC'
END AS MovieLength 
FROM Movie) as Movies
Group by MovieLength

---1
select  
customer_id,
avg(purch_amt) as AverageSpend
from dbo.orders
group by customer_id
having avg(purch_amt) > 1000

--2
select 
customer_id,
AverageSpend
from
(select  
customer_id,
avg(purch_amt) as AverageSpend
from dbo.orders
group by customer_id) a
where AverageSpend > 1000

select *from customer c, salesman s --xuddi full join kabi
where c.salesman_id = s.salesman_id
select *from salesman

--CTE (common table expression)

With cte as (
select  
customer_id,
avg(purch_amt) as AverageSpend
from dbo.orders
group by customer_id
)

select 
customer_id,
cte - (select max(AverageSpend) from cte) as MaxAverage,
cte - (select min(AverageSpend) from cte) as MinAverage
from cte


--Recursive CTE

;with cte as (
     select 1 as num
	 union ALL
	 select num + 1 from cte where num < 120
)

select *from cte  option (maxrecursion 120)

with cte2 as (
select 1 as num 
union all 
select 1+1
union all
select 1+1+1
union all
select 1+1+1+1
union all
select 1+1+1+1+1
)
select *from cte

--task 1
--1
WITH Numbers AS (
    SELECT 1 AS Number
    UNION ALL
    SELECT Number + 1 FROM Numbers WHERE Number < 10
)
SELECT * FROM Numbers;
--2
WITH DoubleCTE AS (
    SELECT 1 AS Num
    UNION ALL
    SELECT Num * 2 FROM DoubleCTE WHERE Num < 100
)
SELECT * FROM DoubleCTE;
--3
SELECT 
    e.EmployeeID,
   concat(e.FirstName,' ',e.LastName) as FullName,
    SalesSummary.TotalSales
FROM Employees e
JOIN (
    SELECT 
        EmployeeID,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID
) AS SalesSummary
ON e.EmployeeID = SalesSummary.EmployeeID;
--4
WITH AvgSalaryCTE AS (
    SELECT AVG(Salary) AS AvgSalary FROM Employees
)
SELECT * FROM AvgSalaryCTE;
--5
SELECT 
    p.ProductID,
    p.ProductName,
    MaxSales.MaxSale
FROM Products p
JOIN (
    SELECT 
        ProductID,
        MAX(SalesAmount) AS MaxSale
    FROM Sales
    GROUP BY ProductID
) AS MaxSales
ON p.ProductID = MaxSales.ProductID;
--6
WITH SalesCount AS (
    SELECT 
        EmployeeID,
        COUNT(*) AS SaleCount
    FROM Sales
    GROUP BY EmployeeID
)
SELECT e.EmployeeID,concat(e.FirstName,' ',e.LastName) as FullName,SaleCount
FROM Employees e
JOIN SalesCount sc ON e.EmployeeID = sc.EmployeeID
WHERE sc.SaleCount > 5;
--7
WITH HighSales AS (
    SELECT 
        ProductID,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    WHERE SalesAmount > 500
    GROUP BY ProductID
)
SELECT p.ProductID, p.ProductName, hs.TotalSales
FROM Products p
JOIN HighSales hs ON p.ProductID = hs.ProductID;
--8
WITH AvgSalary AS (
    SELECT AVG(Salary) AS AvgSalary FROM Employees
)
SELECT e.EmployeeID, e.FirstName,e.LastName, e.Salary
FROM Employees e
CROSS JOIN AvgSalary a
WHERE e.Salary > a.AvgSalary;
--9
SELECT 
    p.ProductID,
    p.ProductName,
    SalesSummary.TotalSold
FROM Products p
JOIN (
    SELECT 
        ProductID,
        COUNT(*) AS TotalSold
    FROM Sales
    GROUP BY ProductID
) AS SalesSummary
ON p.ProductID = SalesSummary.ProductID;
--10
WITH SoldEmployees AS (
    SELECT DISTINCT EmployeeID FROM Sales
)
SELECT e.EmployeeID,concat(e.FirstName,' ',e.LastName) as FullName
FROM Employees e
LEFT JOIN SoldEmployees se ON e.EmployeeID = se.EmployeeID

--task2
--1
WITH FactorialCTE (n, fact) AS (
    SELECT 1, 1
    UNION ALL
    SELECT n + 1, fact * (n + 1)
    FROM FactorialCTE
    WHERE n < 10
)
SELECT * FROM FactorialCTE;
--2
WITH FibonacciCTE (n, a, b) AS (
    SELECT 1, 0, 1
    UNION ALL
    SELECT n + 1, b, a + b
    FROM FibonacciCTE
    WHERE n < 10
)
SELECT n, a AS Fibonacci FROM FibonacciCTE;
--3
DECLARE @Text NVARCHAR(100) = 'HELLO';

WITH SplitCTE AS (
    SELECT 1 AS pos, SUBSTRING(@Text, 1, 1) AS letter
    UNION ALL
    SELECT pos + 1, SUBSTRING(@Text, pos + 1, 1)
    FROM SplitCTE
    WHERE pos < LEN(@Text)
)
SELECT * FROM SplitCTE;
--4
WITH SalesRank AS (
    SELECT 
        EmployeeID,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID
)
SELECT 
    e.EmployeeID,
    concat(e.FirstName,' ',e.LastName) as FullName,
    sr.TotalSales,
    RANK() OVER (ORDER BY sr.TotalSales DESC) AS Rank
FROM SalesRank sr
JOIN Employees e ON sr.EmployeeID = e.EmployeeID;
--5
SELECT 
    e.EmployeeID,
    e.FirstName,e.LastName,
    OrderCount.TotalOrders
FROM Employees e
JOIN (
    SELECT 
        EmployeeID,
        COUNT(*) AS TotalOrders
    FROM Sales
    GROUP BY EmployeeID
) AS OrderCount
ON e.EmployeeID = OrderCount.EmployeeID
ORDER BY OrderCount.TotalOrders DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;
--6
WITH MonthlySales AS (
    SELECT 
        FORMAT(SaleDate, 'yyyy-MM') AS Month,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY FORMAT(SaleDate, 'yyyy-MM')
),
Diff AS (
    SELECT 
        Month,
        TotalSales,
        LAG(TotalSales) OVER (ORDER BY Month) AS PrevSales
    FROM MonthlySales
)
SELECT 
    Month,
    TotalSales,
    PrevSales,
    TotalSales - PrevSales AS Difference
FROM Diff;
--7
SELECT 
    p.[CategoryID],
    CategorySales.TotalSales
FROM (
    SELECT 
        ProductID,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY ProductID
) AS CategorySales
JOIN Products p ON p.ProductID = CategorySales.ProductID
GROUP BY p.[CategoryID], CategorySales.TotalSales;
--8
WITH LastYearSales AS (
    SELECT 
        ProductID,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    WHERE YEAR(SaleDate) = YEAR(GETDATE()) - 1
    GROUP BY ProductID
)
SELECT 
    p.ProductID,
    p.ProductName,
    l.TotalSales,
    RANK() OVER (ORDER BY l.TotalSales DESC) AS SalesRank
FROM LastYearSales l
JOIN Products p ON p.ProductID = l.ProductID;
--9
SELECT 
    e.EmployeeID,
   concat(e.FirstName,' ',e.LastName) as FullName,
    Quarterly.Quarter,
    Quarterly.TotalSales
FROM Employees e
JOIN (
    SELECT 
        EmployeeID,
        CONCAT('Q', DATEPART(QUARTER, SaleDate), '-', YEAR(SaleDate)) AS Quarter,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID, DATEPART(QUARTER, SaleDate), YEAR(SaleDate)
    HAVING SUM(SalesAmount) > 5000
) AS Quarterly
ON e.EmployeeID = Quarterly.EmployeeID;
--10
SELECT 
    e.EmployeeID,
     concat(e.FirstName,' ',e.LastName) as FullName,
    TopSales.TotalSales
FROM Employees e
JOIN (
    SELECT 
        EmployeeID,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    WHERE 
        MONTH(SaleDate) = MONTH(GETDATE()) - 1 AND
        YEAR(SaleDate) = YEAR(GETDATE())
    GROUP BY EmployeeID
) AS TopSales
ON e.EmployeeID = TopSales.EmployeeID
ORDER BY TopSales.TotalSales DESC
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY;
--task 3
--1
CREATE FUNCTION dbo.fn_NumberPattern (@n INT)
RETURNS @Result TABLE (
    Sequence VARCHAR(MAX)
)
AS
BEGIN
    DECLARE @i INT = 1;
    DECLARE @line VARCHAR(MAX) = '';

    WHILE @i <= @n
    BEGIN
        SET @line = @line + CAST(@i AS VARCHAR);
        INSERT INTO @Result VALUES (@line);
        SET @i = @i + 1;
    END

    RETURN;
END

SELECT * FROM dbo.fn_NumberPattern(10);
--2
SELECT e.EmployeeID, concat(e.FirstName,' ',e.LastName) as FullName, SalesSummary.TotalSales
FROM Employees e
JOIN (
    SELECT 
        EmployeeID,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    WHERE SaleDate >= DATEADD(MONTH, -6, GETDATE())
    GROUP BY EmployeeID
) AS SalesSummary
ON e.EmployeeID = SalesSummary.EmployeeID
WHERE SalesSummary.TotalSales = (
    SELECT MAX(TotalSales)
    FROM (
        SELECT 
            EmployeeID,
            SUM(SalesAmount) AS TotalSales
        FROM Sales
        WHERE SaleDate >= DATEADD(MONTH, -6, GETDATE())
        GROUP BY EmployeeID
    ) AS SubTotals
);
--3
WITH RunningTotalCTE AS (
    -- Boshlanishi
    SELECT 
        Id, 
        StepNumber, 
        [Count],
        CASE 
            WHEN [Count] < 0 THEN 0 
            WHEN [Count] > 10 THEN 10
            ELSE [Count] 
        END AS Total
    FROM Numbers
    WHERE StepNumber = 1

    UNION ALL

    -- Rekursiv qismi
    SELECT 
        n.Id,
        n.StepNumber,
        n.[Count],
        CASE 
            WHEN r.Total + n.[Count] > 10 THEN 10
            WHEN r.Total + n.[Count] < 0 THEN 0
            ELSE r.Total + n.[Count]
        END AS Total
    FROM Numbers n
    JOIN RunningTotalCTE r
        ON n.Id = r.Id AND n.StepNumber = r.StepNumber + 1
)
SELECT * FROM RunningTotalCTE
ORDER BY Id, StepNumber;
--4
SELECT 
    s.[ScheduleID],
    s.StartTime AS ShiftStart,
    s.EndTime AS ShiftEnd,
    ISNULL(a.[ActivityName], 'Work') AS Activity
FROM Schedule s
LEFT JOIN Activity a
    ON s.[ScheduleID] = a.[ScheduleID]
    AND a.StartTime >= s.StartTime
    AND a.EndTime <= s.EndTime;
--5
WITH DepartmentSalesCTE AS (
    SELECT 
        e.EmployeeID,
        d.DepartmentID,
        d.DepartmentName,
        s.ProductID,
        s.SalesAmount
    FROM Sales s
    JOIN Employees e ON s.EmployeeID = e.EmployeeID
    JOIN Departments d ON e.DepartmentID = d.DepartmentID
)

SELECT 
    ds.DepartmentID,
    ds.DepartmentName,
    p.ProductID,
    p.ProductName,
    SUM(ds.SalesAmount) AS TotalSales
FROM DepartmentSalesCTE ds
JOIN (
    SELECT ProductID, ProductName FROM Products
) AS p ON ds.ProductID = p.ProductID
GROUP BY ds.DepartmentID, ds.DepartmentName, p.ProductID, p.ProductName
ORDER BY ds.DepartmentID, p.ProductID;

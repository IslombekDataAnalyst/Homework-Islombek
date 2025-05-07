----Temp Tables, Views, Functions

----TEMP TABLES

----TEMP = TEMPORARY

--CREATE DATABASE LESSON_16

----local temp table

----only available(accessible) in the current query
----CREATE TABLE #Temp_Customers (CustID INT IDENTITY(1,1), Name VARCHAR(30), JoinedDate DATE)

--INSERT INTO #Temp_Customers VALUES ('Josh', '2025-03-10')

--SELECT * FROM #Temp_Customers

----global temp table

--CREATE TABLE ##Temp_Employees (EmpID INT IDENTITY(1,1), Name VARCHAR(30), HireDate DATE)

--DROP TABLE ##Temp_Employees


--INSERT INTO ##Temp_Employees VALUES ('Josh', '2020-01-01')
--INSERT INTO ##Temp_Employees VALUES ('Anna', '2022-10-21')

--SELECT * FROM ##Temp_Employees



--SELECT * FROM #TEMP_Customers

--CREATE TABLE #TEMP_Customers (custid INT, COMPANYNAME VARCHAR(50), CONTACTNAME VARCHAR(50), CONTACTTITLE VARCHAR(50), ADDRESS VARCHAR(200))

--SELECT * FROM #TEMP_Customers

--TRUNCATE TABLE #TEMP_CUSTOMERS

--INSERT INTO #TEMP_Customers 
--SELECT custid,companyname,contactname,contacttitle,address FROM TSQL2012.Sales.Customers

--SELECT * FROM #Temp_Customers

--SELECT * INTO ##Temp2_Customers FROM TSQL2012.Sales.Customers


--DELETE FROM ##Temp2_Customers
--WHERE phone LIKE '%.%' AND phone NOT LIKE '%(%)%'

--SELECT * FROM ##Temp2_Customers

--WHERE phone LIKE '%.%' AND phone NOT LIKE '%(%)%'


--SELECT * FROM TSQL2012.Sales.Customers
--WHERE phone LIKE '%.%' AND phone NOT LIKE '%[()]%'


--Homework_2:
--Generate English alphabet
--using cte and string functions('A', 'Z')

--;WITH CTE AS(
--SELECT ASCII('A') AS ASCII_NUM
--UNION ALL
--SELECT ASCII_NUM + 1 FROM CTE WHERE ASCII_NUM < ASCII('Z')
--)
--SELECT STRING_AGG(CHAR(ASCII_NUM),' ') AS ALPHABET FROM CTE





----------------------VIEWS

--CREATE VIEW Customer_info
--AS
--SELECT custid,
--	   contactname,
--	   contacttitle,
--	   address,
--	   country,
--	   phone
--FROM TSQL2012.SALES.Customers
--;

--SELECT * FROM Customer_info


--CREATE VIEW Sales_info
--AS
--SELECT C.*,
--	   EMP.firstname AS EMP_FIRST_NAME,
--	   EMP.lastname,
--	   EMP.hiredate,
--	   EMP.phone AS EMP_PHONE,
--	   EMP.mgrid,
--	   O.orderid,
--	   O.orderdate,
--	   O.freight,
--	   O.shipaddress,
--	   O.shippostalcode
--FROM TSQL2012.SALES.Orders AS O JOIN Customer_info AS C 
--											ON O.custid = C.custid
--								JOIN TSQL2012.HR.Employees AS EMP 
--											ON O.empid = EMP.empid


--SELECT * FROM Sales_info
--INSERT INTO Sales_info--NOT POSSIBLE TO A VIEW, BECAUSE IT DOESN'T STORE ANY DATA IN ITSELF


--------------------------------------Functions(Scalar valued) --Table valued

--select power(2,6) --scalar valued function (built-in)

--select sqrt(100) --scalar valued function (built-in)

--'user-defined' scalar valued function

--prefix --udf --user-defined function

--CREATE FUNCTION udf_Addition (@num1 INT, @num2 INT)
--RETURNS INT
--AS
--BEGIN
--	RETURN @num1 + @num2
--END

--SELECT dbo.udf_addition(5,2)


--create a function that return the division of 1st provided number by the 2nd provided number


ALTER FUNCTION udf_Division (@num1 INT, @NUM2 INT)
RETURNS FLOAT
AS
BEGIN
	RETURN CASE WHEN @NUM2 = 0 THEN 0 ELSE CAST(@num1 AS FLOAT) / @NUM2 END
END


SELECT dbo.udf_Division(7,0)





--------------------------------------------------------------------------------








CREATE FUNCTION udf_proper_name(@name VARCHAR(1000))
RETURNS VARCHAR(1000)
AS
BEGIN
	;WITH CTE AS
	(
	SELECT LOWER(TRIM(@NAME)) AS FULLNAME,@NAME AS FULLLNAME 
	)
	,PROPER_NAMES AS (
	SELECT FULLNAME,FULLLNAME,
		 LEFT(FULLNAME,CHARINDEX(' ', FULLNAME)-1) AS FIRST_NAME,
		 SUBSTRING(FULLNAME,CHARINDEX(' ', FULLNAME)+1,LEN(FULLNAME)) AS LAST_NAME
	FROM CTE
	)
	SELECT @name = 
	CONCAT_WS(' ',
	CONCAT(UPPER(LEFT(FIRST_NAME,1)),SUBSTRING(FIRST_NAME,2,LEN(FIRST_NAME))),
	CONCAT(UPPER(LEFT(LAST_NAME,1)),SUBSTRING(LAST_NAME,2,LEN(LAST_NAME)))
	)
	FROM PROPER_NAMES
	
		RETURN @name
END



select dbo.udf_proper_name('SANJAR sotimboyev')


select dbo.udf_proper_name(fullname) from People





--DECLARE @NAME VARCHAR(1000) = 'NO NAME'

--;WITH CTE AS
--(
--SELECT LOWER(TRIM(@NAME)) AS FULLNAME,@NAME AS FULLLNAME 
--)
--,PROPER_NAMES AS (
--SELECT FULLNAME,FULLLNAME,
--     LEFT(FULLNAME,CHARINDEX(' ', FULLNAME)-1) AS FIRST_NAME,
--     SUBSTRING(FULLNAME,CHARINDEX(' ', FULLNAME)+1,LEN(FULLNAME)) AS LAST_NAME
--FROM CTE
--)
--SELECT CONCAT_WS(' ',
--CONCAT(UPPER(LEFT(FIRST_NAME,1)),SUBSTRING(FIRST_NAME,2,LEN(FIRST_NAME))),
--CONCAT(UPPER(LEFT(LAST_NAME,1)),SUBSTRING(LAST_NAME,2,LEN(LAST_NAME)))
--) AS FULL_NAME
--FROM PROPER_NAMES

DECLARE @name varchar(50) = 'noname'

set @name = 'Sanjar'

select @name

select @name = 'Azamat'

select @name

use lesson16HW
--task 1 
DROP TABLE IF EXISTS Grouped;
CREATE TABLE Grouped
(
  Product  VARCHAR(100) PRIMARY KEY,
  Quantity INTEGER NOT NULL
);
INSERT INTO Grouped (Product, Quantity) VALUES
('Pencil',3),('Eraser',4),('Notebook',2);

WITH DeGrouped AS (
    SELECT Product, 1 AS Quantity, 1 AS RowNum
    FROM Grouped

    UNION ALL

    SELECT dg.Product, 1 AS Quantity, dg.RowNum + 1
    FROM DeGrouped dg
    JOIN Grouped g ON dg.Product = g.Product
    WHERE dg.RowNum < g.Quantity
)
SELECT Product, Quantity
FROM DeGrouped
ORDER BY Product desc;


--task 2
DROP TABLE IF EXISTS RegionSales;

CREATE TABLE RegionSales
(
  Region      VARCHAR(100),
  Distributor VARCHAR(100),
  Sales       INTEGER NOT NULL,
  PRIMARY KEY (Region, Distributor)
);

INSERT INTO RegionSales (Region, Distributor, Sales) VALUES
('North','ACE',10),
('South','ACE',67),
('East','ACE',54),
('North','ACME',65),
('South','ACME',9),
('East','ACME',1),
('West','ACME',7),
('North','Direct Parts',8),
('South','Direct Parts',7),
('West','Direct Parts',12);

-- 1. Avval barcha distributorga barcha regionlar kombinatsiyasini hosil qilamiz
WITH AllCombinations AS (
    SELECT DISTINCT
        r.Region,
        d.Distributor
    FROM
        (SELECT DISTINCT Region FROM #RegionSales) r
    CROSS JOIN
        (SELECT DISTINCT Distributor FROM #RegionSales) d
)

SELECT 
    ac.Region,
    ac.Distributor,
    ISNULL(rs.Sales, 0) AS Sales
FROM 
    AllCombinations ac
LEFT JOIN 
    #RegionSales rs ON rs.Region = ac.Region AND rs.Distributor = ac.Distributor
ORDER BY 
    ac.Distributor, ac.Region;

	--task 3
	CREATE TABLE Employee (
  id INT,
  name VARCHAR(255),
  department VARCHAR(255),
  managerId INT
);
TRUNCATE TABLE Employee;
INSERT INTO Employee VALUES
(101, 'John', 'A', NULL),
(102, 'Dan', 'A', 101),
(103, 'James', 'A', 101),
(104, 'Amy', 'A', 101),
(105, 'Anne', 'A', 101),
(106, 'Ron', 'B', 101);

SELECT e.name
FROM Employee e
JOIN (
    SELECT managerId
    FROM Employee
    WHERE managerId IS NOT NULL
    GROUP BY managerId
    HAVING COUNT(*) >= 5
) AS m ON e.id = m.managerId;


--taks 4

CREATE TABLE Products (
  product_id INT,
  product_name VARCHAR(40),
  product_category VARCHAR(40)
);
CREATE TABLE Orders (
  product_id INT,
  order_date DATE,
  unit INT
);
TRUNCATE TABLE Products;
INSERT INTO Products VALUES
(1, 'Leetcode Solutions', 'Book'),
(2, 'Jewels of Stringology', 'Book'),
(3, 'HP', 'Laptop'),
(4, 'Lenovo', 'Laptop'),
(5, 'Leetcode Kit', 'T-shirt');
TRUNCATE TABLE Orders;
INSERT INTO Orders VALUES
(1, '2020-02-05', 60),
(1, '2020-02-10', 70),
(2, '2020-01-18', 30),
(2, '2020-02-11', 80),
(3, '2020-02-17', 2),
(3, '2020-02-24', 3),
(4, '2020-03-01', 20),
(4, '2020-03-04', 30),
(4, '2020-03-04', 60),
(5, '2020-02-25', 50),
(5, '2020-02-27', 50),
(5, '2020-03-01', 50);

SELECT 
    p.product_name, 
    o.total_units AS unit
FROM 
    Products p
JOIN (
    SELECT 
        product_id, 
        SUM(unit) AS total_units
    FROM 
        Orders
    WHERE 
        order_date >= '2020-02-01' AND order_date < '2020-03-01'
    GROUP BY 
        product_id
    HAVING 
        SUM(unit) >= 100
) o ON p.product_id = o.product_id;

--5
DROP TABLE  Orders;
CREATE TABLE Orders (
  OrderID     INT PRIMARY KEY,
  CustomerID  INT NOT NULL,
  [Count]     int NOT NULL,
  Vendor      VARCHAR(100) NOT NULL
);
INSERT INTO Orders VALUES
(1, 1001, 12, 'Direct Parts'),
(2, 1001, 54, 'Direct Parts'),
(3, 1001, 32, 'ACME'),
(4, 2002, 7, 'ACME'),
(5, 2002, 16, 'ACME'),
(6, 2002, 5, 'Direct Parts');


SELECT o.CustomerID, o.Vendor
FROM (
    SELECT CustomerID, Vendor, COUNT(*) AS VendorOrderCount
    FROM Orders
    GROUP BY CustomerID, Vendor
) AS o
JOIN (
    SELECT CustomerID, MAX(VendorOrderCount) AS MaxOrders
    FROM (
        SELECT CustomerID, Vendor, COUNT(*) AS VendorOrderCount
        FROM Orders
        GROUP BY CustomerID, Vendor
    ) AS counts
    GROUP BY CustomerID
) AS m
ON o.CustomerID = m.CustomerID AND o.VendorOrderCount = m.MaxOrders;

--6
DECLARE @Check_Prime INT = 91;

WITH Numbers AS (
    SELECT 2 AS num
    UNION ALL
    SELECT num + 1
    FROM Numbers
    WHERE num + 1 <= @Check_Prime / 2
),
Divisors AS (
    SELECT num
    FROM Numbers
    WHERE @Check_Prime % num = 0
)
SELECT 
    CASE 
        WHEN @Check_Prime <= 1 THEN 'This number is not prime'
        WHEN EXISTS (SELECT 1 FROM Divisors) THEN 'This number is not prime'
        ELSE 'This number is prime'
    END AS Result
--7
CREATE TABLE Device (
  Device_id INT,
  Locations VARCHAR(25)
);
INSERT INTO Device VALUES
(12, 'Bangalore'),
(12, 'Bangalore'),
(12, 'Bangalore'),
(12, 'Bangalore'),
(12, 'Hosur'),
(12, 'Hosur'),
(13, 'Hyderabad'),
(13, 'Hyderabad'),
(13, 'Secunderabad'),
(13, 'Secunderabad'),
(13, 'Secunderabad');

WITH SignalCounts AS (
    SELECT 
        Device_id,
        Locations,
        COUNT(*) AS SignalCount
    FROM Device
    GROUP BY Device_id, Locations
),

MaxSignal AS (
    SELECT 
        sc.Device_id,
        sc.Locations AS max_signal_location,
        sc.SignalCount AS no_of_signals
    FROM SignalCounts sc
    WHERE sc.SignalCount = (
        SELECT MAX(sc2.SignalCount)
        FROM SignalCounts sc2
        WHERE sc2.Device_id = sc.Device_id
    )
)

SELECT 
    d.Device_id,
    COUNT(DISTINCT d.Locations) AS no_of_location,
    m.max_signal_location,
    m.no_of_signals
FROM Device d
JOIN MaxSignal m ON d.Device_id = m.Device_id
GROUP BY d.Device_id, m.max_signal_location, m.no_of_signals
ORDER BY d.Device_id;

--8
CREATE TABLE Employee (
  EmpID INT,
  EmpName VARCHAR(30),
  Salary FLOAT,
  DeptID INT
);
INSERT INTO Employee VALUES
(1001, 'Mark', 60000, 2),
(1002, 'Antony', 40000, 2),
(1003, 'Andrew', 15000, 1),
(1004, 'Peter', 35000, 1),
(1005, 'John', 55000, 1),
(1006, 'Albert', 25000, 3),
(1007, 'Donald', 35000, 3);

WITH DeptAvg AS (
    SELECT 
        DeptID,
        AVG(Salary) AS AvgSalary
    FROM Employee
    GROUP BY DeptID
)

SELECT 
    e.EmpID,
    e.EmpName,
    e.Salary
FROM Employee e
JOIN DeptAvg d ON e.DeptID = d.DeptID
WHERE e.Salary > d.AvgSalary;

--9
CREATE TABLE WinningNumbers (Number INT);
INSERT INTO WinningNumbers VALUES (25), (45), (78);

CREATE TABLE Tickets (TicketID VARCHAR(10), Number INT);
INSERT INTO Tickets VALUES
('A23423', 25),
('A23423', 45),
('A23423', 78),
('B35643', 25),
('B35643', 45),
('B35643', 98),
('C98787', 67),
('C98787', 86),
('C98787', 91);

SELECT 
    COUNT(*) * 10 AS [Total Winning]
FROM Tickets t
WHERE EXISTS (
    SELECT 1
    FROM WinningNumbers w
    WHERE w.Number = t.Number
);

--10
CREATE TABLE Spending (
  User_id INT,
  Spend_date DATE,
  Platform VARCHAR(10),
  Amount INT
);
INSERT INTO Spending VALUES
(1,'2019-07-01','Mobile',100),
(1,'2019-07-01','Desktop',100),
(2,'2019-07-01','Mobile',100),
(2,'2019-07-02','Mobile',100),
(3,'2019-07-01','Desktop',100),
(3,'2019-07-02','Desktop',100);
select * from Spending







-- 1: Platformalarga oid statistikani yig'ish
WITH PlatformStats AS (
    SELECT 
        Spend_date,
        Platform,
        SUM(Amount) AS Total_Amount,
        COUNT(DISTINCT User_id) AS Total_users
    FROM Spending
    GROUP BY Spend_date, Platform
),

-- 2: Ikkala platformani ham ishlatgan foydalanuvchilar (Only real 'Both')
BothStatsReal AS (
    SELECT 
        m.Spend_date,
        'Both' AS Platform,
        COUNT(*) AS Total_users,
        SUM(m.Amount + d.Amount) AS Total_Amount
    FROM (
        SELECT User_id, Spend_date, SUM(Amount) AS Amount
        FROM Spending
        WHERE Platform = 'Mobile'
        GROUP BY User_id, Spend_date
    ) m
    INNER JOIN (
        SELECT User_id, Spend_date, SUM(Amount) AS Amount
        FROM Spending
        WHERE Platform = 'Desktop'
        GROUP BY User_id, Spend_date
    ) d
    ON m.User_id = d.User_id AND m.Spend_date = d.Spend_date
    GROUP BY m.Spend_date
),

-- 3: Har bir Spend_date uchun 'Both' satr qo‘shib chiqaramiz
AllDates AS (
    SELECT DISTINCT Spend_date FROM Spending
),
FinalBoth AS (
    SELECT 
        d.Spend_date,
        'Both' AS Platform,
        COALESCE(b.Total_Amount, 0) AS Total_Amount,
        COALESCE(b.Total_users, 0) AS Total_users
    FROM AllDates d
    LEFT JOIN BothStatsReal b ON d.Spend_date = b.Spend_date
),

-- 4: Barchasini birlashtirish
FinalResult AS (
    SELECT Spend_date, Platform, Total_Amount, Total_users FROM PlatformStats
    UNION ALL
    SELECT Spend_date, Platform, Total_Amount, Total_users FROM FinalBoth
)

-- 5: Saralab chiqamiz
SELECT Spend_date, Platform, Total_Amount, Total_users
FROM FinalResult
ORDER BY Spend_date, 
         CASE Platform 
            WHEN 'Mobile' THEN 1 
            WHEN 'Desktop' THEN 2 
            WHEN 'Both' THEN 3 
         END;

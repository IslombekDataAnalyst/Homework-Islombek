-----Stored Procedures, Merge, (Practice)
create database Class19

--stored procedure is an object that stores some code in it

create procedure usp_get_now
as begin
SELECT getdate() as Today
end

EXECUTE dbo.usp_get_now
exec dbo.usp_get_now

create table Birthdate (
        BirthDate DATE
);

INSERT INTO Birthdate VALUES
('1994-12-10')
select *,
DATEDIFF(YEAR,BirthDate,GETDATE())
from Birthdate
--solution of assist
select CASE WHEN '2000-08-20' < GETDATE() THEN DATEDIFF(YEAR,'2000-08-20',GETDATE()) - 1
ELSE DATEDIFF(YEAR,'2000-08-20',GETDATE())
END as Birthdate

DECLARE @BIRTHDATE DATE = '2000-08-20'
select CASE WHEN @BIRTHDATE < GETDATE() THEN DATEDIFF(YEAR,@BIRTHDATE,GETDATE()) - 1
ELSE DATEDIFF(YEAR,@BIRTHDATE,GETDATE())
END as Birthdate

--WITH CREATE PROC WORK
CREATE proc usp_get_age @agedate date
as
begin
  declare @birhdate date = @agedate
  select 
  case when DATEPART(DAYOFYEAR,@birhdate) < datepart(dayofyear, getdate()) then DATEDIFF(year, @birhdate, GETDATE())
  else DATEDIFF(year, @birhdate, GETDATE())-1 end
end

EXEC usp_get_AGE '2002-10-09'  ---SHU JOYDA HOHLAGAN PARAMETR BERSA BOLADI

select dbo

SELECT concat(P.[FirstName], ' ', P.[LastName]) AS Full_Name,  
       EA.EmailAddress,  
       PP.PhoneNumber  ,
     E.Gender,
     E.HireDate
FROM [AdventureWorks2019].[Person].[Person] as P  
JOIN [AdventureWorks2019].[Person].[EmailAddress] as EA  
    ON P.BusinessEntityID = EA.BusinessEntityID  
JOIN [AdventureWorks2019].[Person].[PersonPhone] as PP  
    ON P.BusinessEntityID = PP.BusinessEntityID  
JOIN AdventureWorks2019.HumanResources.Employee as E
  ON PP.BusinessEntityID = E.BusinessEntityID


  --create an Stored Proc that will return info based on Gender parameter
  SELECT concat(P.[FirstName], ' ', P.[LastName]) AS Full_Name,  
       EA.EmailAddress,  
       PP.PhoneNumber  ,
     E.Gender,
     E.HireDate
FROM [AdventureWorks2019].[Person].[Person] as P  
JOIN [AdventureWorks2019].[Person].[EmailAddress] as EA  
    ON P.BusinessEntityID = EA.BusinessEntityID  
JOIN [AdventureWorks2019].[Person].[PersonPhone] as PP  
    ON P.BusinessEntityID = PP.BusinessEntityID  
JOIN AdventureWorks2019.HumanResources.Employee as E
  ON PP.BusinessEntityID = E.BusinessEntityID

  Create PROC usp_get_info_by_gender @gender VARCHAR(1), @HIRED_YEAR INT
AS
BEGIN

  SELECT concat(P.[FirstName], ' ', P.[LastName]) AS Full_Name,  
       EA.EmailAddress,  
       PP.PhoneNumber  ,
     E.Gender,
     E.HireDate
  FROM [AdventureWorks2019].[Person].[Person] as P  
  JOIN [AdventureWorks2019].[Person].[EmailAddress] as EA  
    ON P.BusinessEntityID = EA.BusinessEntityID  
  JOIN [AdventureWorks2019].[Person].[PersonPhone] as PP  
    ON P.BusinessEntityID = PP.BusinessEntityID  
  JOIN AdventureWorks2019.HumanResources.Employee as E
    ON PP.BusinessEntityID = E.BusinessEntityID
  WHERE E.Gender = @gender AND YEAR(E.HireDate) > @HIRED_YEAR
END

exec usp_get_info_by_gender @hired_year = 2008, @gender = 'F'

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

select *from employees
select *from EmployeesUpdated 

delete employees
where employeeID not in (select employeeID from EmployeesUpdated) 

INSERT INTO EMPLOYEES (EmployeeID, NAME, DEPARTMENT, SALARY)
SELECT 
EmployeeID, NAME, DEPARTMENT, SALARY
FROM EmployeesUpdated   where employeeID not in (select employeeID from EmployeesUpdated) 

TRUNCATE TABLE EMPLOYEES
TRUNCATE TABLE EMPLOYEESUPDATED


--MERGE  --BIR NECHTA FUNKSIYALANI BAJARADI

MERGE EMPLOYEES AS TARGET 
USING EMPLOYEESUPDATED AS SOURCE

ON TARGET.EMPLOYEEID= SOURCE.EMPLOYEEID

WHEN MATCHED 

THEN
UPDATE
	SET TARGET.NAME = SOURCE.NAME,
		TARGET.DEPARTMENT = SOURCE.DEPARTMENT,
		TARGET.SALARY = SOURCE.SALARY
WHEN NOT MATCHED BY TARGET --NOT IN EMPLOYEES
THEN 
	INSERT (EMPLOYEEID,NAME,DEPARTMENT,SALARY)
	VALUES (
	SOURCE.EMPLOYEEID,SOURCE.NAME, SOURCE.DEPARTMENT,SOURCE.SALARY)
WHEN NOT MATCHED BY SOURCE
THEN 
	DELETE;

--Homework 19

MERGE INTO Products AS target
USING ProductUpdates AS source
ON target.ProductID = source.ProductID

WHEN MATCHED 
THEN
    UPDATE 
	SET
        target.ProductName = source.ProductName,
        target.Price = source.Price

WHEN NOT MATCHED BY TARGET THEN
    INSERT (ProductID, ProductName, Price)
    VALUES (source.ProductID, source.ProductName, source.Price)
	WHEN NOT MATCHED BY source
THEN 
	DELETE;

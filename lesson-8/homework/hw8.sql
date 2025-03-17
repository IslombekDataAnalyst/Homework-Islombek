--Join

--Inner Join


select 
o.ord_no,
o.purch_amt,
o.ord_date,
o.customer_id as OrderCustomerID,
c.customer_id as CustomerCustomerID,
c.cust_name
from orders o
join customer c on o.customer_id=c.customer_id

create database Lesson8

CREATE TABLE Fruits (Fruit varchar(50))
CREATE TABLE FruitSize (Size varchar(50))

INSERT INTO Fruits VALUES ('Apple'), ('Watermelon')
INSERT INTO FruitSize VALUES ('Small'), ('Medium'), ('Large')

select*from Fruits    --cartesian product
cross join FruitSize

create table Table1 (num1 int)
insert into Table1 values (1),(2),(3),(4)
create table Table2 (num2 int)
insert into Table2 values (3),(4),(5),(6)

select *from Table1
select*from Table2
select *from Table1 a
join Table2 b on a.num1 < b.num2
truncate table Table2

--<>
select *from Table1 a
join Table2 b on a.num1 <> b.num2
select*from Table1
cross join Table2

--ONE-TO-ONE
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Name VARCHAR(100)
);
CREATE TABLE Passports (
    PassportID INT PRIMARY KEY,
    UserID INT UNIQUE,  -- Ensures one user has only one passport
    PassportNumber VARCHAR(50) UNIQUE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE --это позволяет без ошибки удалять строки в таблице
);
INSERT INTO Users (UserID, Name) VALUES 
(1, 'Alice'), 
(2, 'Bob');
INSERT INTO Passports (PassportID, UserID, PassportNumber) VALUES 
(101, 1, 'A1234567'),  -- Alice's passport
(102, 2, 'B9876543');

select u.UserID, u.Name, p.PassportNumber from Users u
join Passports p on u.UserID = p.UserID

--One to many

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100)
);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT,
    Amount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
INSERT INTO Customers (CustomerID, Name, Email) VALUES
(1, 'John Doe', 'john@example.com'),
(2, 'Jane Smith', 'jane@example.com');

INSERT INTO Orders (OrderID, OrderDate, CustomerID, Amount) VALUES
(101, '2025-03-01', 1, 200.50),
(102, '2025-03-02', 1, 150.75),
(103, '2025-03-03', 2, 300.00);

select *from Customers
select*from Orders

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    Name VARCHAR(100)
);
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255)
);

INSERT INTO Authors (AuthorID, Name) VALUES 
(1, 'J.K. Rowling'),
(2, 'J.R.R. Tolkien'),
(3, 'George R.R. Martin'),
(4, 'Terry Pratchett'),
(5, 'Neil Gaiman');

INSERT INTO Books (BookID, Title) VALUES 
(101, 'Harry Potter and the Sorcerers Stone'),
(102, 'The Lord of the Rings'),
(103, 'A Game of Thrones'),
(104, 'Good Omens'),
(105, 'The Colour of Magic');

CREATE TABLE Books_Authors (
    AuthorID INT,
    BookID INT,
    PRIMARY KEY (AuthorID, BookID),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

INSERT INTO Books_Authors (AuthorID, BookID) VALUES 
(1, 101), -- J.K. Rowling wrote "Harry Potter"
(2, 102), -- J.R.R. Tolkien wrote "The Lord of the Rings"
(3, 103), -- George R.R. Martin wrote "A Game of Thrones"
(4, 104), -- Terry Pratchett co-wrote "Good Omens"
(5, 104), -- Neil Gaiman co-wrote "Good Omens"
(4, 105);

select 
a.AuthorID,
a.name,
b.title
from authors a
join Books_Authors ba on a.AuthorID= ba.AuthorID
join Books b on b.BookID = ba.BookID

create database HWLesson8
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Country VARCHAR(50)
);
INSERT INTO Customers (CustomerID, CustomerName, Country) VALUES
(1, 'John Doe', 'USA'),
(2, 'Jane Smith', 'UK'),
(3, 'Michael Johnson', 'Canada'),
(4, 'Sarah Brown', 'Australia'),
(5, 'David Green', 'USA'),
(6, 'Linda White', 'Canada'),
(7, 'James Black', 'UK'),
(8, 'Emily Blue', 'Australia'),
(9, 'Matthew Red', 'USA'),
(10, 'Olivia Yellow', 'Canada'),
(11, 'John Doe', 'Australia'),
(12, 'Jane Smith', 'Canada'),
(13, 'Michael Johnson', 'UK'),
(14, 'Sarah Brown', 'USA'),
(15, 'David Green', 'Canada'),
(16, 'Linda White', 'Australia'),
(17, 'James Black', 'USA'),
(18, 'Emily Blue', 'Canada'),
(19, 'Matthew Red', 'UK'),
(20, 'Olivia Yellow', 'Australia'),
(21, 'John Doe', 'Canada'),
(22, 'Jane Smith', 'Australia'),
(23, 'Michael Johnson', 'USA'),
(24, 'Sarah Brown', 'UK'),
(25, 'David Green', 'Australia'),
(26, 'Linda White', 'USA'),
(27, 'James Black', 'Canada'),
(28, 'Emily Blue', 'UK'),
(29, 'Matthew Red', 'Australia'),
(30, 'Olivia Yellow', 'USA'),
(31, 'John Doe', 'UK'),
(32, 'Jane Smith', 'USA'),
(33, 'Michael Johnson', 'Australia'),
(34, 'Sarah Brown', 'Canada'),
(35, 'David Green', 'UK'),
(36, 'Linda White', 'USA'),
(37, 'James Black', 'Australia'),
(38, 'Emily Blue', 'Canada'),
(39, 'Matthew Red', 'USA'),
(40, 'Olivia Yellow', 'UK');
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);
INSERT INTO Products (ProductID, ProductName, Price) VALUES
(1, 'Laptop', 1200.00),
(2, 'Smartphone', 800.00),
(3, 'Tablet', 400.00),
(4, 'Monitor', 200.00),
(5, 'Keyboard', 50.00),
(6, 'Mouse', 30.00),
(7, 'Printer', 150.00),
(8, 'Headphones', 100.00),
(9, 'Speakers', 80.00),
(10, 'Webcam', 60.00),
(11, 'Laptop', 1100.00),
(12, 'Smartphone', 750.00),
(13, 'Tablet', 420.00),
(14, 'Monitor', 220.00),
(15, 'Keyboard', 55.00),
(16, 'Mouse', 35.00),
(17, 'Printer', 160.00),
(18, 'Headphones', 120.00),
(19, 'Speakers', 90.00),
(20, 'Webcam', 65.00),
(21, 'Laptop', 1300.00),
(22, 'Smartphone', 850.00),
(23, 'Tablet', 380.00),
(24, 'Monitor', 210.00),
(25, 'Keyboard', 60.00),
(26, 'Mouse', 40.00),
(27, 'Printer', 170.00),
(28, 'Headphones', 130.00),
(29, 'Speakers', 95.00),
(30, 'Webcam', 70.00),
(31, 'Laptop', 1400.00),
(32, 'Smartphone', 900.00),
(33, 'Tablet', 430.00),
(34, 'Monitor', 230.00),
(35, 'Keyboard', 65.00),
(36, 'Mouse', 45.00),
(37, 'Printer', 180.00),
(38, 'Headphones', 140.00),
(39, 'Speakers', 100.00),
(40, 'Webcam', 75.00);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    Quantity INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Orders (OrderID, CustomerID, ProductID, OrderDate, Quantity) VALUES
(1, 1, 2, '2023-01-15', 2),
(2, 2, 3, '2023-01-20', 1),
(3, 3, 5, '2023-02-15', 3),
(4, 4, 8, '2023-02-18', 1),
(5, 5, 6, '2023-03-10', 4),
(6, 6, 7, '2023-03-12', 2),
(7, 7, 9, '2023-03-20', 1),
(8, 8, 1, '2023-04-05', 1),
(9, 9, 4, '2023-04-10', 2),
(10, 10, 10, '2023-04-15', 1),
(11, 11, 3, '2023-05-01', 2),
(12, 12, 6, '2023-05-03', 1),
(13, 13, 2, '2023-05-10', 1),
(14, 14, 8, '2023-06-01', 3),
(15, 15, 5, '2023-06-02', 2),
(16, 16, 7, '2023-06-15', 2),
(17, 17, 9, '2023-06-20', 1),
(18, 18, 4, '2023-07-01', 3),
(19, 19, 1, '2023-07-05', 1),
(20, 20, 10, '2023-07-10', 1),
(21, 21, 6, '2023-08-01', 2),
(22, 22, 2, '2023-08-03', 3),
(23, 23, 3, '2023-08-10', 1),
(24, 24, 5, '2023-09-01', 1),
(25, 25, 7, '2023-09-05', 2),
(26, 26, 8, '2023-09-10', 3),
(27, 27, 4, '2023-09-15', 1),
(28, 28, 9, '2023-10-01', 1),
(29, 29, 1, '2023-10-05', 2),
(30, 30, 3, '2023-10-10', 1),
(31, 31, 6, '2023-11-01', 4),
(32, 32, 7, '2023-11-05', 3),
(33, 33, 5, '2023-11-10', 2),
(34, 34, 9, '2023-11-15', 1),
(35, 35, 8, '2023-12-01', 1),
(36, 36, 10, '2023-12-05', 2),
(37, 37, 4, '2023-12-10', 3),
(38, 38, 3, '2023-12-15', 2),
(39, 39, 2, '2023-12-20', 3),
(40, 40, 1, '2023-12-25', 1);

CREATE TABLE EmployeeDepartments (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    DepartmentName VARCHAR(100)
);
INSERT INTO EmployeeDepartments (EmployeeID, EmployeeName, DepartmentName) VALUES
(1, 'John Doe', 'HR'),
(2, 'Jane Smith', 'IT'),
(3, 'Michael Johnson', 'Sales'),
(4, 'Sarah Brown', 'Marketing'),
(5, 'David Green', 'Finance'),
(6, 'Linda White', 'IT'),
(7, 'James Black', 'Sales'),
(8, 'Emily Blue', 'HR'),
(9, 'Matthew Red', 'Marketing'),
(10, 'Olivia Yellow', 'Finance'),
(11, 'John Doe', 'Finance'),
(12, 'Jane Smith', 'Sales'),
(13, 'Michael Johnson', 'IT'),
(14, 'Sarah Brown', 'HR'),
(15, 'David Green', 'Sales'),
(16, 'Linda White', 'Marketing'),
(17, 'James Black', 'Finance'),
(18, 'Emily Blue', 'IT'),
(19, 'Matthew Red', 'HR'),
(20, 'Olivia Yellow', 'Sales'),
(21, 'John Doe', 'Marketing'),
(22, 'Jane Smith', 'HR'),
(23, 'Michael Johnson', 'Finance'),
(24, 'Sarah Brown', 'IT'),
(25, 'David Green', 'HR'),
(26, 'Linda White', 'Sales'),
(27, 'James Black', 'Marketing'),
(28, 'Emily Blue', 'Finance'),
(29, 'Matthew Red', 'HR'),
(30, 'Olivia Yellow', 'IT'),
(31, 'John Doe', 'Sales'),
(32, 'Jane Smith', 'Marketing'),
(33, 'Michael Johnson', 'HR'),
(34, 'Sarah Brown', 'Finance'),
(35, 'David Green', 'Marketing'),
(36, 'Linda White', 'HR'),
(37, 'James Black', 'IT'),
(38, 'Emily Blue', 'Finance'),
(39, 'Matthew Red', 'Sales'),
(40, 'Olivia Yellow', 'HR');

--HW Lesson 8
--1.
SELECT Customers.CustomerName, Orders.OrderDate
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

--2
SELECT Employees.EmployeeID, Employees.Name, EmployeeDetails.Address
FROM Employees
INNER JOIN EmployeeDetails ON Employees.EmployeeID = EmployeeDetails.EmployeeID;
--3
SELECT Products.ProductName, Categories.CategoryName
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID;

--4.
SELECT Customers.CustomerName, Orders.OrderDate
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

--5
SELECT Orders.OrderID, Products.ProductName, OrderDetails.Quantity
FROM Orders
INNER JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID;

--6
SELECT Products.ProductName, Categories.CategoryName
FROM Products
CROSS JOIN Categories;

--7
select *from Customers
select *from Orders
SELECT Customers.CustomerName, Orders.OrderID, Orders.OrderDate
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

--8
SELECT Products.ProductName, Orders.OrderID, Orders.Quantity
FROM Products
CROSS JOIN Orders
WHERE Orders.Quantity > 500;
--9
SELECT Employees.Name, Departments.DepartmentName
FROM Employees
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;
--10
SELECT A.Column1, B.Column2
FROM TableA A
JOIN TableB B ON A.Column1 <> B.Column2;

--11
SELECT Customers.CustomerName, COUNT(Orders.OrderID) AS TotalOrders
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerName;

--12
SELECT Students.StudentName, Courses.CourseName
FROM Students
INNER JOIN StudentCourses ON Students.StudentID = StudentCourses.StudentID
INNER JOIN Courses ON StudentCourses.CourseID = Courses.CourseID;
--13
SELECT Employees.Name, Departments.DepartmentName, Employees.Salary
FROM Employees
CROSS JOIN Departments
WHERE Employees.Salary > 5000;
--14
SELECT Employees.Name, EmployeeDetails.*
FROM Employees
INNER JOIN EmployeeDetails ON Employees.EmployeeID = EmployeeDetails.EmployeeID;
--15
SELECT Products.ProductName, Suppliers.SupplierName
FROM Products
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Suppliers.SupplierName = 'Supplier A';
--16
SELECT Products.ProductName, COALESCE(SUM(Sales.Quantity), 0) AS TotalSales
FROM Products
LEFT JOIN Sales ON Products.ProductID = Sales.ProductID
GROUP BY Products.ProductName;
--17
SELECT Employees.Name, Employees.Salary, Departments.DepartmentName
FROM Employees
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
WHERE Employees.Salary > 4000 AND Departments.DepartmentName = 'HR';

--18
SELECT A.Column1, B.Column2
FROM TableA A
JOIN TableB B ON A.Value >= B.Value;
--19
SELECT Products.ProductName, Products.Price, Suppliers.SupplierName
FROM Products
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Products.Price >= 50;

--20
SELECT Sales.SalesAmount, Regions.RegionName
FROM Sales
CROSS JOIN Regions
WHERE Sales.SalesAmount > 1000;

--21

SELECT Authors.AuthorName, Books.BookTitle
FROM Authors
INNER JOIN AuthorBooks ON Authors.AuthorID = AuthorBooks.AuthorID
INNER JOIN Books ON AuthorBooks.BookID = Books.BookID;
--22
SELECT Products.ProductName, Categories.CategoryName
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE Categories.CategoryName <> 'Electronics';


--23
SELECT Orders.OrderID, Products.ProductName, OrderDetails.Quantity
FROM Orders
CROSS JOIN OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE OrderDetails.Quantity > 100;
--24
SELECT Employees.Name, Departments.DepartmentName, Employees.YearsAtCompany
FROM Employees
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
WHERE Employees.YearsAtCompany > 5;

--25
SELECT Employees.Name, Departments.DepartmentName
FROM Employees
LEFT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

--26
SELECT Products.ProductName, Suppliers.SupplierName
FROM Products
CROSS JOIN Suppliers
WHERE Products.CategoryID IN (SELECT CategoryID FROM Categories WHERE CategoryName = 'Category A');

--27
SELECT Customers.CustomerName, COUNT(Orders.OrderID) AS TotalOrders
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerName
HAVING COUNT(Orders.OrderID) >= 10;

--28
SELECT Courses.CourseName, COUNT(StudentCourses.StudentID) AS TotalStudents
FROM Courses
LEFT JOIN StudentCourses ON Courses.CourseID = StudentCourses.CourseID
GROUP BY Courses.CourseName;

--29
SELECT Employees.Name, Departments.DepartmentName
FROM Employees
LEFT JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
WHERE Departments.DepartmentName = 'Marketing';

--30
SELECT A.Column1, B.Column2
FROM TableA A
JOIN TableB B ON A.Value <= B.Value;

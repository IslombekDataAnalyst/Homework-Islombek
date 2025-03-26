create database lesson11
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    DepartmentID INT
);

-- Insert data into Employees
INSERT INTO Employees (EmployeeID, EmployeeName, DepartmentID) VALUES
(1, 'John', 1),
(2, 'Jane', 1),
(3, 'Jack', 2),
(4, 'Jill', NULL);

-- Create table for Departments
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- Insert data into Departments
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'Engineering');
select *from employees
select *from Departments 
select employees.EmployeeID, employees.employeeName, departments.departmentName
from employees 
left join departments on employees.departmentID = Departments.DepartmentID

--select emp.employeeID, 
emp.employeeName, 
dept.departmentName 
from employees as emp 
left join departments as dept on emp.departmentID = dept.departmentID

--select emp.employeeID, 
emp.employeeName, 
dept.departmentName 
from departments as dept 
right join employees as emp on emp.departmentID = dept.departmentID

select *from employees
cross apply (
select departmentID, DepartmentName
from departments
where employees.departmentID = departmentID
) as dept

--select *from employees as emp
--inner join departments as dept on 
--emp.departmentID = dept.departmentID

select *from employees as emp
left join departments as dept on emp.DepartmentID= dept.DepartmentID

select 'Hello World this is an SQL Lesson'

string_split(string, 'delimiter')
select *from (select 1 as number) as number cross apply string_split('Hello World this is an SQL Lesson', ' ')
create table words (word varchar(1000))
insert into words values ('Hello,World,this,is,an,SQL,Lesson')

select *from words cross apply string_split(word,',')

drop table employees
drop table departments

 drop table departments
## Basic Level

### Task 1: Basic INNER JOIN
Question: Retrieve all employee names along with their corresponding department names.

select *from employees
select*from departments

select emp.EmployeeID, 
emp.name, 
isnull(dept.departmentName, 'No Department') 
from employees as emp
inner join departments as dept 
on emp.DepartmentID= dept.DepartmentID

#### Table Schema:
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    DepartmentID INT
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);
#### Sample Data:
INSERT INTO Employees VALUES
(1, 'Alice', 101),
(2, 'Bob', 102),
(3, 'Charlie', NULL);

INSERT INTO Departments VALUES
(101, 'HR'),
(102, 'IT'),
(103, 'Finance');
---

### Task 2: LEFT JOIN
Question: List all students along with their class names, including students who are not assigned to any class.
select *from students
select *from classes
select students.studentID, students.StudentName, isnull(classes.className, 'No Class')
from students
left join classes on students.classID = classes.classID 
#### Table Schema:
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    ClassID INT
);

CREATE TABLE Classes (
    ClassID INT PRIMARY KEY,
    ClassName VARCHAR(50)
);
#### Sample Data:
INSERT INTO Students VALUES
(1, 'John', 201),
(2, 'Emma', NULL),
(3, 'Liam', 202);

INSERT INTO Classes VALUES
(201, 'Math'),
(202, 'Science');
---

### Task 3: RIGHT JOIN
Question: List all customers and their orders, including customers who haven’t placed any orders.
select *from orders
select*from customers
select orders.orderID, orders.orderdate, customers.customerName
from orders
right join customers on orders.customerID = customers.customerID

#### Table Schema:
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);
#### Sample Data:
INSERT INTO Orders VALUES
(1, 301, '2024-11-01'),
(2, 302, '2024-11-05');

INSERT INTO Customers VALUES
(301, 'Alice'),
(302, 'Bob'),
(303, 'Charlie');
---

### Task 4: FULL OUTER JOIN
Question: Retrieve a list of all products and their sales, including products with no sales 
and sales with invalid product references.

select *from products
select*from sales
select products.productname, sales.saleID,sales.quantity
from products
full outer join sales on products.productID = sales.productID

#### Table Schema:
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT
);
#### Sample Data:
INSERT INTO Products VALUES
(1, 'Laptop'),
(2, 'Tablet'),
(3, 'Phone');

INSERT INTO Sales VALUES
(100, 1, 10),
(101, 2, 5),
(102, NULL, 8);
---

### Task 5: SELF JOIN
Question: Find the names of employees along with the names of their managers.
drop table employees

select *from employees

SELECT EMPl.ID, 
EMPl.NAME AS EMPl_NAME, 
ISNULL(MAN.Name, 'NO MANAGER') AS MANAGERNAME 
FROM EMPLOYEE EMPl 
LEFT JOIN EMPLOYEE MAN ON EMPl.MANAGERID = MAN.ManagerID

#### Table Schema:
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    ManagerID INT
);
#### Sample Data:
INSERT INTO Employees VALUES
(1, 'Alice', NULL),
(2, 'Bob', 1),
(3, 'Charlie', 1),
(4, 'Diana', 2);
---

### Task 6: CROSS JOIN
Question: Generate all possible combinations of colors and sizes.

select *from colors
select *from sizes

select *from colors
cross join sizes 

#### Table Schema:
CREATE TABLE Colors (
    ColorID INT PRIMARY KEY,
    ColorName VARCHAR(50)
);

CREATE TABLE Sizes (
    SizeID INT PRIMARY KEY,
    SizeName VARCHAR(50)
);
#### Sample Data:
INSERT INTO Colors VALUES
(1, 'Red'),
(2, 'Blue');

INSERT INTO Sizes VALUES
(1, 'Small'),
(2, 'Medium');
---

### Task 7: Join with WHERE Clause
Question: Find all movies released after 2015 and their associated actors.

select *from movies
select*from actors
select movies.title, movies.releaseyear, actors.actorID, actors.name
from movies
join actors on  movies.movieID = actors.movieID
where movies.releaseyear > 2015
#### Table Schema:
CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    Title VARCHAR(50),
    ReleaseYear INT
);

CREATE TABLE Actors (
    ActorID INT PRIMARY KEY,
    Name VARCHAR(50),
    MovieID INT
);
#### Sample Data:
INSERT INTO Movies VALUES
(1, 'Inception', 2010),
(2, 'Interstellar', 2014),
(3, 'Dune', 2021);

INSERT INTO Actors VALUES
(101, 'Leonardo DiCaprio', 1),
(102, 'Matthew McConaughey', 2),
(103, 'Timothйe Chalamet', 3);
---

### Task 8: MULTIPLE JOINS
Question: Retrieve the order date, customer name, and the product ID for all orders.
drop table orders

select *from orders
select *from customers
select *from orderdetails

select orders.orderID, orders.orderdate,customers.customername
from orders
join customers on orders.customerID = customers.customerID
join orderdetails on orders.orderID = orderdetails.orderID
#### Table Schema:
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT
);
#### Sample Data:
INSERT INTO Orders VALUES
(1, 401, '2024-11-01'),
(2, 402, '2024-11-05');

INSERT INTO Customers VALUES
(401, 'Alice'),
(402, 'Bob');

INSERT INTO OrderDetails VALUES
(1001, 1, 501),
(1002, 2, 502);
---
### Task 9: JOIN with Aggregation
Question: Calculate the total revenue generated for each product.
drop table sales

select *from sales
select*from products

select p.productid, p.ProductName,
sum(s.quantity*p.price) as SumTotal,
avg (p.price) as avgprice
from sales s
join products p on s.productid = p.productid
group by p.productname, p.productid

#### Table Schema:
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT
);
drop table products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10, 2)
);
#### Sample Data:
INSERT INTO Sales VALUES
(1, 601, 3),
(2, 602, 5),
(3, 601, 2);

INSERT INTO Products VALUES
(601, 'TV', 500.00),
(602, 'Speaker', 150.00);
---

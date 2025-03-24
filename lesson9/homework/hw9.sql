/*
select 
o.ord_no,
c.cust_name,
sum(o.purch_amt) asPurchaseAmount
from Orders o
join customer c on o.customer_id = c.customer_id
group by o.ord_no, c.cust_name

select *from orders
select *from customer

--Left Join

create database Lesson9

CREATE TABLE NUMBERS1 (NUMBER INT)
CREATE TABLE NUMBERS2 (NUMBER INT)

INSERT INTO NUMBERS1 VALUES (1),(2),(3),(4)
INSERT INTO NUMBERS2 VALUES (3),(4),(6),(7)

select *from Numbers1
select *from Numbers2

select *from Numbers1 a
inner join Numbers2 b on a.number = b.number

select *from Numbers1 a
left join Numbers2 b on a.number = b.number   --сначала показывает столбцы 1 табл, потом совпадающие строки во 2 таблице

select *from Numbers1 a
right join Numbers2 b on a.number = b.number
# Lesson 9 Homework Tasks

These homework tasks cover the following topics:
- **Difference Between ON and WHERE Clauses**
- **INNER JOIN with WHERE Clause**
- **Outer Joins (LEFT, RIGHT, FULL)**
- **Self Join**

*/

--##  Easy-Level Tasks 

--//1. Write a query to join Employees and Departments using an INNER JOIN, 
and apply a WHERE clause to show only employees whose salary is greater than 5000.--//

select *from employees
select *from Departments

SELECT Employees.EmployeeID, Employees.Name, Employees.Salary, Departments.DepartmentName
FROM Employees
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
WHERE Employees.Salary > 5000;

--2. Write a query to join Customers and Orders using an INNER JOIN,
and apply the WHERE clause to return only orders placed in 2023.
select *from customers
select *from orders

SELECT Customers.CustomerID, Customers.FirstName, Customers.Lastname, Orders.OrderID, Orders.Orderdate
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Year (Orders.ORderdate) = 2023;

--3. Write a query to demonstrate a LEFT OUTER JOIN between Employees and Departments, 
--showing all employees and their respective departments (including employees without departments).
select *from employees
select*from departments

SELECT Employees.EmployeeID, Employees.Name, Departments.DepartmentID, Departments.DepartmentName
FROM Employees
LEFT OUTER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

--4. Write a query to perform a RIGHT OUTER JOIN between Products and Suppliers, 
--showing all suppliers and the products they supply (including suppliers without products).
select *from products
select *from suppliers
	
SELECT Products.ProductID, Products.ProductName, Suppliers.SupplierID, Suppliers.SupplierName
FROM Products
RIGHT OUTER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;

--5. Write a query to demonstrate a FULL OUTER JOIN between Orders and Payments, 
--showing all orders and their corresponding payments (including orders without payments and payments without orders).
select *from orders
select *from payments

SELECT Orders.OrderID, Orders.OrderDate, Payments.PaymentID, Payments.PaymentDate, Payments.Amount
FROM Orders
FULL OUTER JOIN Payments ON Orders.OrderID = Payments.OrderID;

--6. Write a query to perform a SELF JOIN on the Employees table to display employees 
--and their respective managers (showing EmployeeName and ManagerName).
select *from employees

SELECT e1.EmployeeID, e1.Name, e2.EmployeeID AS ManagerID, e2.Name AS ManagerName
FROM Employees e1
LEFT JOIN Employees e2 ON e1.ManagerID = e2.EmployeeID;

--7. Write a query to join Students and Courses using INNER JOIN, 
--and use the WHERE clause to show only students enrolled in 'Math 101'.(USE ENROLLMENTS TABLE AS A BRIDGE TABLE)
select *from students
select *from courses
SELECT students.studentID, students.Name, courses.CourseName
from students
inner join courses on students.studentID = courses.CourseID 

SELECT Students.StudentID, Students.Name, Courses.CourseID, Courses.CourseName
FROM Students
INNER JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
INNER JOIN Courses ON Enrollments.CourseID = Courses.CourseID
WHERE Courses.CourseName = 'Math 101';


--8. Write a query that uses INNER JOIN between Customers and Orders, 
--and filters the result with a WHERE clause to show customers who have placed more than 3 items at once.
select *from customers
select *from orders
SELECT Customers.CustomerID, Customers.FirstName, Orders.OrderID, Orders.quantity
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.quantity > 3;

--9. Write a query to join Employees and Departments using a LEFT OUTER JOIN 
and use the WHERE clause to filter employees in the 'HR' department(Human Resources).
select *from employees
select *from departments

SELECT Employees.EmployeeID, Employees.Name, Departments.DepartmentID, Departments.DepartmentName
FROM Employees
LEFT OUTER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
WHERE Departments.DepartmentName = 'HR' OR Departments.DepartmentName = 'Human Resources';


--##  Medium-Level Tasks 

--10. Write a query to perform an INNER JOIN between Employees and Departments, 
--and use the HAVING clause to show employees who belong to departments with more than 10 employees.
select *from employees
select *from departments

SELECT Employees.EmployeeID, Employees.Name, Departments.DepartmentID, Departments.DepartmentName
FROM Employees
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
GROUP BY Departments.DepartmentID
HAVING COUNT(Employees.EmployeeID) > 10;

11. Write a query to perform a LEFT OUTER JOIN between Products and Sales, 
and use the WHERE clause to filter only products with no sales.
select *from products
select *from sales

SELECT Products.ProductID, Products.ProductName
FROM Products
LEFT OUTER JOIN Sales ON Products.ProductID = Sales.ProductID
WHERE Sales.ProductID IS NULL;


--12. Write a query to perform a RIGHT OUTER JOIN between Customers and Orders, 
--and filter the result using the HAVING clause to show only customers who have placed at least one order.
select *from customers
select *from orders

SELECT Customers.CustomerID, COUNT(Orders.OrderID) AS OrderCount
FROM Customers
RIGHT OUTER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID
HAVING COUNT(Orders.OrderID) > 0;

--13. Write a query that uses a FULL OUTER JOIN between Employees and Departments, 
and filters out the results where the department is NULL.

SELECT Employees.EmployeeID, Employees.Name, Departments.DepartmentID, Departments.DepartmentName
FROM Employees
FULL OUTER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
WHERE Departments.DepartmentID IS NOT NULL;

--14. Write a query to perform a SELF JOIN on 
the Employees table to show employees who report to the same manager.

SELECT e1.EmployeeID AS EmployeeID_1, e1.Name AS EmployeeName_1, 
       e2.EmployeeID AS EmployeeID_2, e2.Name AS EmployeeName_2
FROM Employees e1
INNER JOIN Employees e2 ON e1.ManagerID = e2.ManagerID
WHERE e1.EmployeeID != e2.EmployeeID;


--15. Write a query to perform a LEFT OUTER JOIN between Orders and Customers, 
followed by a WHERE clause to filter orders placed in the year 2022.

SELECT Orders.OrderID, Orders.OrderDate, Customers.CustomerID, concat (Customers.firstName,' ', customers.lastname) as CustomerName
FROM Orders
LEFT OUTER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE YEAR(Orders.OrderDate) = 2022;

--16. Write a query to use the ON clause with INNER JOIN to return 
only the employees from the 'Sales' department whose salary is greater than 5000.

SELECT Employees.EmployeeID, Employees.Name, Employees.Salary
FROM Employees
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
WHERE Departments.DepartmentName = 'Sales' AND Employees.Salary > 5000;

--17. Write a query to join Employees and Departments using INNER JOIN, 
--and use WHERE to filter employees whose department''s DepartmentName is 'IT'.

SELECT Employees.EmployeeID, Employees.Name, Departments.DepartmentID, Departments.DepartmentName
FROM Employees
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
WHERE Departments.DepartmentName = 'IT';

--18. Write a query to join Orders and Payments using a FULL OUTER JOIN,
--and use the WHERE clause to show only the orders that have corresponding payments.
select *from orders
select *from payments

SELECT Orders.OrderID, Orders.OrderDate, Payments.PaymentID, Payments.PaymentDate, Payments.Amount
FROM Orders
FULL OUTER JOIN Payments ON Orders.OrderID = Payments.OrderID
WHERE Payments.PaymentID IS NOT NULL;

--19. Write a query to perform a LEFT OUTER JOIN between Products and Orders,
and use the WHERE clause to show products that have no orders.

select *from orders
select *from products

SELECT Products.ProductID, Products.ProductName
FROM Products
LEFT OUTER JOIN Orders ON Products.ProductID = Orders.ProductID
WHERE Orders.ProductID IS NULL;

--##  Hard-Level Tasks 

--20. Write a query using a JOIN between Employees and Departments, 
followed by a WHERE clause to show employees whose salary is higher than the average salary of all employees.

SELECT Employees.EmployeeID, Employees.EmployeeName, Employees.Salary, Departments.DepartmentName
FROM Employees
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
WHERE Employees.Salary > (SELECT AVG(Salary) FROM Employees);

--21. Write a query to perform a LEFT OUTER JOIN between Orders and Payments, 
and use the WHERE clause to return all orders placed before 2020 that have not been paid yet.

select*from orders
select *from payments

SELECT Orders.OrderID, Orders.OrderDate, Payments.PaymentID
FROM Orders
LEFT OUTER JOIN Payments ON Orders.OrderID = Payments.OrderID
WHERE Orders.OrderDate < '2020-01-01' AND Payments.PaymentID IS NULL;

--22. Write a query to perform a FULL OUTER JOIN between Products and Categories, 
and use the WHERE clause to filter only products that have no category assigned.
select *from products
select *from categories
select products.productID, products.productname, categories.categoryName
from products
full outer join categories on products.category = categories.categoryID
where categoryName is NULL

SELECT Products.ProductID, Products.ProductName, Categories.CategoryID, Categories.CategoryName
FROM Products
FULL OUTER JOIN Categories ON Products.Category = Categories.CategoryID
WHERE Categories.CategoryID IS NULL;

--23. Write a query to perform a SELF JOIN on the Employees table to find employees 
who report to the same manager and earn more than 5000.
select 

SELECT e1.EmployeeID AS EmployeeID_1, e1.Name AS EmployeeName_1, 
       e2.EmployeeID AS EmployeeID_2, e2.Name AS EmployeeName_2
FROM Employees e1
INNER JOIN Employees e2 ON e1.ManagerID = e2.ManagerID
WHERE e1.EmployeeID != e2.EmployeeID AND e1.Salary > 5000 AND e2.Salary > 5000;


--24. Write a query to join Employees and Departments using a RIGHT OUTER JOIN, 
and use the WHERE clause to show employees from departments where the department name starts with ‘M’.
select *from Employees
select *from departments

SELECT Employees.EmployeeID, Employees.Name, Departments.DepartmentID, Departments.DepartmentName
FROM Employees
RIGHT OUTER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
WHERE Departments.DepartmentName LIKE 'M%';

25. Write a query to join Products and Sales, and use WHERE to filter only sales greater than 1000.
select *from Products
select *from sales

SELECT Products.ProductID, Products.ProductName, Sales.SaleAmount
FROM Products
INNER JOIN Sales ON Products.ProductID = Sales.ProductID
WHERE Sales.SaleAmount > 1000;

--26. Write a query to perform a LEFT OUTER JOIN between Students and Courses,
--and use the WHERE clause to show only students who have not enrolled in 'Math 101'.(USE ENROLLMENTS TABLE AS A BRIDGE TABLE)
select *from students
select *from Courses

SELECT Students.StudentID, Students.Name
FROM Students
LEFT OUTER JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
LEFT OUTER JOIN Courses ON Enrollments.CourseID = Courses.CourseID
WHERE Courses.CourseName != 'Math 101' OR Courses.CourseName IS NULL;

--27. Write a query using a FULL OUTER JOIN between Orders and Payments,
followed by a WHERE clause to filter out the orders with no payment.
select *from orders
select *from payments
select orders.customerID, orders.productID, payments.paymentID
from orders
full outer join payments on orders.orderID = payments.orderID
where payments. paymentID is NULL

SELECT Orders.OrderID, Orders.OrderDate, Payments.PaymentID
FROM Orders
FULL OUTER JOIN Payments ON Orders.OrderID = Payments.OrderID
WHERE Payments.PaymentID IS NULL;

--28. Write a query to join Products and Categories using an INNER JOIN, 
and use the WHERE clause to filter products that belong to either 'Electronics' or 'Furniture'.

SELECT Products.ProductID, Products.ProductName, Categories.CategoryName
FROM Products
INNER JOIN Categories ON Products.Category = Categories.CategoryID
WHERE Categories.CategoryName IN ('Electronics', 'Furniture');

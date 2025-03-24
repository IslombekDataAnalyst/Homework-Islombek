# Lesson 10 Homework Tasks

These homework tasks cover the following topics:
- **Advanced Joins**
- **Cross Apply**
- **Outer Apply**



##  Easy-Level Tasks (7)

1. Write a query to perform an INNER JOIN between Orders and Customers using AND in the ON clause to filter orders placed after 2022.
2. Write a query to join Employees and Departments using OR in the ON clause to show employees in either the 'Sales' or 'Marketing' department.
3. Write a query to demonstrate a CROSS APPLY between Departments and a derived table that shows their Employees, top-performing employee (e.g., top 1 Employee who gets the most salary).
4. Write a query to join Customers and Orders using AND in the ON clause to filter customers who have placed orders in 2023 and who lives in the USA.
5. Write a query to join a derived table (SELECT CustomerID, COUNT(*) FROM Orders GROUP BY CustomerID) with the Customers table to show the number of orders per customer.
6. Write a query to join Products and Suppliers using OR in the ON clause to show products supplied by either 'Gadget Supplies' or 'Clothing Mart'.
7. Write a query to demonstrate the use of OUTER APPLY between Customers and a derived table that returns each Customers''s most recent order.

1. SELECT Orders.OrderID, Orders.OrderDate, Customers.CustomerID, Customers.CustomerName
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
AND Orders.OrderDate > '2022-12-31';

2. SELECT Employees.EmployeeID, Employees.EmployeeName, Departments.DepartmentName
FROM Employees
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
AND (Departments.DepartmentName = 'Sales' OR Departments.DepartmentName = 'Marketing');

SELECT Departments.DepartmentName, Employees.EmployeeName, Employees.Salary
FROM Departments
CROSS APPLY (
    SELECT TOP 1 EmployeeName, Salary
    FROM Employees
    WHERE Employees.DepartmentID = Departments.DepartmentID
    ORDER BY Salary DESC
) AS Employees;

SELECT Customers.CustomerID, Customers.CustomerName, Orders.OrderID, Orders.OrderDate
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
AND YEAR(Orders.OrderDate) = 2023
AND Customers.Country = 'USA';

SELECT Customers.CustomerID, Customers.CustomerName, OrderCount.TotalOrders
FROM Customers
INNER JOIN (
    SELECT CustomerID, COUNT(*) AS TotalOrders
    FROM Orders
    GROUP BY CustomerID
) AS OrderCount ON Customers.CustomerID = OrderCount.CustomerID;

SELECT Products.ProductID, Products.ProductName, Suppliers.SupplierName
FROM Products
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
AND (Suppliers.SupplierName = 'Gadget Supplies' OR Suppliers.SupplierName = 'Clothing Mart');

SELECT Customers.CustomerID, Customers.CustomerName, RecentOrders.OrderID, RecentOrders.OrderDate
FROM Customers
OUTER APPLY (
    SELECT TOP 1 OrderID, OrderDate
    FROM Orders
    WHERE Orders.CustomerID = Customers.CustomerID
    ORDER BY OrderDate DESC
) AS RecentOrders;



##  Medium-Level Tasks (7)

8. Write a query that uses the AND logical operator in the ON clause to join Orders and Customers, and filter customers who placed an order with a total amount greater than 500.
9. Write a query that uses the OR logical operator in the ON clause to join Products and Sales to filter products that were either sold in 2022 or the SaleAmount is more than 400.
10. Write a query to join a derived table that calculates the total sales (SELECT ProductID, SUM(Amount) FROM Sales GROUP BY ProductID) with the Products table to show total sales for each product.
11. Write a query to join Employees and Departments using AND in the ON clause to filter employees who belong to the 'HR' department and whose salary is greater than 50000.
12. Write a query to use OUTER APPLY to return all customers along with their most recent orders, including customers who have not placed any orders.
13. Write a query to join Products and Sales using AND in the ON clause to filter products that were sold in 2023 and StockQuantity is more than 50.
14. Write a query to join Employees and Departments using OR in the ON clause to show employees who either belong to the 'Sales' department or hired after 2020.

SELECT Orders.OrderID, Orders.OrderDate, Customers.CustomerID, Customers.CustomerName, Orders.TotalAmount
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
AND Orders.TotalAmount > 500;

SELECT Products.ProductID, Products.ProductName, Sales.SaleDate, Sales.SaleAmount
FROM Products
INNER JOIN Sales ON Products.ProductID = Sales.ProductID
AND (YEAR(Sales.SaleDate) = 2022 OR Sales.SaleAmount > 400);

SELECT Products.ProductID, Products.ProductName, TotalSales.TotalAmount
FROM Products
INNER JOIN (
    SELECT ProductID, SUM(Amount) AS TotalAmount
    FROM Sales
    GROUP BY ProductID
) AS TotalSales ON Products.ProductID = TotalSales.ProductID;

SELECT Employees.EmployeeID, Employees.EmployeeName, Departments.DepartmentName, Employees.Salary
FROM Employees
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
AND Departments.DepartmentName = 'HR' 
AND Employees.Salary > 50000;

SELECT Customers.CustomerID, Customers.CustomerName, RecentOrders.OrderID, RecentOrders.OrderDate
FROM Customers
OUTER APPLY (
    SELECT TOP 1 OrderID, OrderDate
    FROM Orders
    WHERE Orders.CustomerID = Customers.CustomerID
    ORDER BY OrderDate DESC
) AS RecentOrders;

SELECT Products.ProductID, Products.ProductName, Sales.SaleDate, Products.StockQuantity
FROM Products
INNER JOIN Sales ON Products.ProductID = Sales.ProductID
AND YEAR(Sales.SaleDate) = 2023
AND Products.StockQuantity > 50;

SELECT Employees.EmployeeID, Employees.EmployeeName, Departments.DepartmentName, Employees.HireDate
FROM Employees
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
AND (Departments.DepartmentName = 'Sales' OR Employees.HireDate > '2020-01-01');


##  Hard-Level Tasks (7)

15. Write a query to demonstrate the use of the AND logical operator in the ON clause between Orders and Customers, and filter orders made by customers who are located in 'USA' and lives in an address that starts with 4 digits.
16. Write a query to demonstrate the use of OR in the ON clause when joining Products and Sales to show products that are either part of the 'Electronics' category or Sale amount is greater than 350.
17. Write a query to join a derived table that returns a count of products per category (SELECT CategoryID, COUNT(*) FROM Products GROUP BY CategoryID) with the Categories table to show the count of products in each category.
18. Write a query to join Orders and Customers using AND in the ON clause to show orders where the customer is from 'Los Angeles' and the order amount is greater than 300.
19. Write a query to join Employees and Departments using a complex OR condition in the ON clause to show employees who are in the 'HR' or 'Finance' department, or have at least 4 wowels in their name.
20. Write a query to join Sales and Products using AND in the ON clause to filter products that have both a sales quantity greater than 100 and a price above 500.
21. Write a query to join Employees and Departments using OR in the ON clause to show employees in either the 'Sales' or 'Marketing' department, and with a salary greater than 60000.

SELECT Orders.OrderID, Orders.OrderDate, Customers.CustomerID, Customers.CustomerName
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
AND Customers.Country = 'USA'
AND Customers.Address LIKE '____%';  -- 4 цифры в начале

SELECT Products.ProductID, Products.ProductName, Sales.SaleAmount, Categories.CategoryName
FROM Products
INNER JOIN Sales ON Products.ProductID = Sales.ProductID
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
AND (Categories.CategoryName = 'Electronics' OR Sales.SaleAmount > 350);

SELECT Categories.CategoryID, Categories.CategoryName, ProductCount.ProductCount
FROM Categories
INNER JOIN (
    SELECT CategoryID, COUNT(*) AS ProductCount
    FROM Products
    GROUP BY CategoryID
) AS ProductCount ON Categories.CategoryID = ProductCount.CategoryID;

SELECT Orders.OrderID, Orders.OrderDate, Customers.CustomerID, Customers.CustomerName, Orders.TotalAmount
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
AND Customers.City = 'Los Angeles'
AND Orders.TotalAmount > 300;

SELECT Employees.EmployeeID, Employees.EmployeeName, Departments.DepartmentName
FROM Employees
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
AND (
    Departments.DepartmentName IN ('HR', 'Finance') 
    OR LEN(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(Employees.EmployeeName, 'a', ''), 'e', ''), 'i', ''), 'o', ''), 'u', '')) <= LEN(Employees.EmployeeName) - 4
);

SELECT Sales.ProductID, Products.ProductName, Sales.QuantitySold, Products.Price
FROM Sales
INNER JOIN Products ON Sales.ProductID = Products.ProductID
AND Sales.QuantitySold > 100
AND Products.Price > 500;

SELECT Employees.EmployeeID, Employees.EmployeeName, Departments.DepartmentName, Employees.Salary
FROM Employees
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
AND (Departments.DepartmentName = 'Sales' OR Departments.DepartmentName = 'Marketing')
AND Employees.Salary > 60000;

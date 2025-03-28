create database Lesson5
CREATE TABLE students (Name VARCHAR(50), Age INT)
INSERT INTO students VALUES
('Doston', 21),
('Sarvar', 25),
('Olim', 50),
('Ilhom', 31),
('Rasul', 22)

CREATE TABLE teachers (Name VARCHAR(50), Age INT)
INSERT INTO teachers VALUES
('Aziz', 49),
('Umid', 37),
('Javohir', 28),
('Abdulaziz', 52),
('Shavkat', 54)
select *from teachers 
select*from students

select *from students 
where age > all(select age from teachers)  --max(age) тоже можно использовать

select *from students 
where age >any(select age from teachers)

select [Name] as [StudentNameAll] from students 
where age > all(select age from teachers)
select [Name] as [StudentName]


--Alias

select *from orders as o    --таблицага ном берилади киска ном берса болади with as or without as
join customer as c on o.customer_id = c.customer_id

select o.ord_no, o.purch_amt, o.ord_date, c.cust_name from orders o
join customer c on o.customer_id = c.customer_id

--Union and Union All

create table Numbers1 (Number int)
create table Numbers2 (Number int)

insert into Numbers1 values(1),(2),(3),(4)
insert into Numbers2 values(3),(4),(5),(6)

select *from Numbers1
union
select *from Numbers2
--Datatype bir xil bolishi kere
--Tartibi ham bir xil bolishi kere

--Intersect and Except

select *from Numbers1
intersect                   --- 2 tableda bir xil bolgan znacheniyalani chiqarib beradi
select *from Numbers2
select *from Numbers1  -- 2ta tabledagi bir xil znacheniyalarni chiqarib tashlaydi, eng tepadagidan hisoblab chiqaradi, masalan 1- tableda 1,2 2-tableda yoq, shuning uchun faqat 1,2 qoldi 
except
select *from Numbers2

--Case

select employee_ID,
first_name,
last_name,
salary,
case
    when salary <= 5000 then 'Low'
	when salary > 5000 and salary < 10000 then 'Average'
	Else 'High'
	End as [SalaryGroup]
from employees

--IIF

select 
employee_ID,
first_name,
last_name,
salary,
IIF(salary<5000, 'Low', IIF(salary <10000, 'Average', 'High')) as [SalaryGroup]
from employees

--IF

declare @Grade int
set @Grade = 70

if @Grade >= 90
begin
     print 'Sizning bahoingiz 5. Balingiz' + cast( @grade as varchar) --cast int raqamni textga aylantiradi va boshqa textga qoshishga imkon beradi
end
else if @grade >= 80
begin
print 'Sizning bahoingiz 4. Balingiz' + cast (@grade as varchar)
end

else print 'Siz testdan otolmadingiz'

--While Loop --mobaynida 

declare @Number int 
set @number = 1

while (@number <= 100)
begin
    print @number 
	set @number = @number + 1
end

--juft/toq sonlarni chiqarish

declare @Number2 int 
set @number2 = 1

while (@number2 <= 100)
begin
    if @number2 % 2 = 0
	print cast (@number2 as varchar) + 'juft son'
	else print cast (@number2 as varchar) + 'toq son'
	set @number2 = @number2 + 1
end

-- Group By

select  department_ID from employees
group by DEPARTMENT_ID

 Create database homework5
 Create Customers2 Table
CREATE TABLE Customers2 (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(100),
    LoyaltyStatus VARCHAR(50)
);

-- Insert 40 rows into Customers
INSERT INTO Customers2 VALUES
(1, 'Alice', 'New York', 'Gold'),
(2, 'Bob', 'California', 'Silver'),
(3, 'Charlie', 'Texas', 'Gold'),
(4, 'David', 'Florida', 'Platinum'),
(5, 'Eve', 'California', 'Gold'),
(6, 'Frank', 'Texas', 'Silver'),
(7, 'Grace', 'New York', 'Platinum'),
(8, 'Helen', 'Florida', 'Gold'),
(9, 'Ivan', 'California', 'Silver'),
(10, 'Jack', 'New York', 'Gold'),
(11, 'Kathy', 'Texas', 'Gold'),
(12, 'Leo', 'California', 'Platinum'),
(13, 'Mona', 'New York', 'Silver'),
(14, 'Nina', 'Florida', 'Gold'),
(15, 'Oscar', 'California', 'Silver'),
(16, 'Paul', 'Texas', 'Gold'),
(17, 'Quincy', 'New York', 'Platinum'),
(18, 'Rachel', 'Florida', 'Silver'),
(19, 'Sam', 'California', 'Gold'),
(20, 'Tom', 'Texas', 'Platinum'),
(21, 'Uma', 'New York', 'Gold'),
(22, 'Vera', 'California', 'Platinum'),
(23, 'Walter', 'Florida', 'Silver'),
(24, 'Xander', 'Texas', 'Gold'),
(25, 'Yara', 'New York', 'Silver'),
(26, 'Zoe', 'California', 'Platinum'),
(27, 'Aaron', 'Texas', 'Gold'),
(28, 'Bella', 'Florida', 'Platinum'),
(29, 'Caleb', 'California', 'Silver'),
(30, 'Diana', 'Texas', 'Gold'),
(31, 'Eva', 'New York', 'Silver'),
(32, 'Finn', 'Florida', 'Gold'),
(33, 'Gina', 'California', 'Platinum'),
(34, 'Hank', 'Texas', 'Silver'),
(35, 'Ivy', 'New York', 'Gold'),
(36, 'Jason', 'California', 'Silver'),
(37, 'Ken', 'Texas', 'Platinum'),
(38, 'Lia', 'Florida', 'Gold'),
(39, 'Mick', 'New York', 'Platinum'),
(40, 'Noah', 'California', 'Gold');

-- 2. Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(100),
    Price DECIMAL(10, 2),
    Category VARCHAR(50),
    StockQuantity INT
);

-- Insert 40 rows into Products
INSERT INTO Products VALUES
(1, 'Laptop', 1200.00, 'Electronics', 30),
(2, 'Smartphone', 800.00, 'Electronics', 50),
(3, 'Tablet', 400.00, 'Electronics', 40),
(4, 'Monitor', 250.00, 'Electronics', 60),
(5, 'Keyboard', 50.00, 'Accessories', 100),
(6, 'Mouse', 30.00, 'Accessories', 120),
(7, 'Chair', 150.00, 'Furniture', 80),
(8, 'Desk', 200.00, 'Furniture', 75),
(9, 'Pen', 5.00, 'Stationery', 300),
(10, 'Notebook', 10.00, 'Stationery', 500),
(11, 'Printer', 180.00, 'Electronics', 25),
(12, 'Camera', 500.00, 'Electronics', 40),
(13, 'Flashlight', 25.00, 'Tools', 200),
(14, 'Shirt', 30.00, 'Clothing', 150),
(15, 'Jeans', 45.00, 'Clothing', 120),
(16, 'Jacket', 80.00, 'Clothing', 70),
(17, 'Shoes', 60.00, 'Clothing', 100),
(18, 'Hat', 20.00, 'Accessories', 50),
(19, 'Socks', 10.00, 'Clothing', 200),
(20, 'T-Shirt', 25.00, 'Clothing', 150),
(21, 'Lamp', 60.00, 'Furniture', 40),
(22, 'Coffee Table', 100.00, 'Furniture', 35),
(23, 'Book', 15.00, 'Stationery', 250),
(24, 'Rug', 90.00, 'Furniture', 60),
(25, 'Cup', 5.00, 'Accessories', 500),
(26, 'Bag', 25.00, 'Accessories', 300),
(27, 'Couch', 450.00, 'Furniture', 15),
(28, 'Fridge', 600.00, 'Electronics', 20),
(29, 'Stove', 500.00, 'Electronics', 15),
(30, 'Microwave', 120.00, 'Electronics', 25),
(31, 'Air Conditioner', 350.00, 'Electronics', 10),
(32, 'Washing Machine', 450.00, 'Electronics', 15),
(33, 'Dryer', 400.00, 'Electronics', 10),
(34, 'Hair Dryer', 30.00, 'Accessories', 100),
(35, 'Iron', 40.00, 'Electronics', 50),
(36, 'Coffee Maker', 50.00, 'Electronics', 60),
(37, 'Blender', 35.00, 'Electronics', 40),
(38, 'Juicer', 55.00, 'Electronics', 30),
(39, 'Toaster', 40.00, 'Electronics', 70),
(40, 'Dishwasher', 500.00, 'Electronics', 20);

-- 3. Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    Quantity INT,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert 40 rows into Orders
INSERT INTO Orders VALUES
(1, 1, 2, '2024-01-10', 1, 800.00),
(2, 2, 3, '2024-01-11', 2, 800.00),
(3, 3, 4, '2024-01-12', 1, 250.00),
(4, 4, 5, '2024-01-13', 3, 150.00),
(5, 5, 6, '2024-01-14', 1, 30.00),
(6, 6, 7, '2024-01-15', 2, 300.00),
(7, 7, 8, '2024-01-16', 1, 200.00),
(8, 8, 9, '2024-01-17', 4, 40.00),
(9, 9, 10, '2024-01-18', 1, 10.00),
(10, 10, 11, '2024-01-19', 2, 360.00),
(11, 11, 12, '2024-01-20', 1, 500.00),
(12, 12, 13, '2024-01-21', 1, 25.00),
(13, 13, 14, '2024-01-22', 2, 60.00),
(14, 14, 15, '2024-01-23', 3, 135.00),
(15, 15, 16, '2024-01-24', 1, 80.00),
(16, 16, 17, '2024-01-25', 1, 60.00),
(17, 17, 18, '2024-01-26', 2, 40.00),
(18, 18, 19, '2024-01-27', 5, 50.00),
(19, 19, 20, '2024-01-28', 2, 50.00),
(20, 20, 21, '2024-01-29', 1, 60.00),
(21, 21, 22, '2024-02-01', 1, 100.00),
(22, 22, 23, '2024-02-02', 1, 15.00),
(23, 23, 24, '2024-02-03', 2, 180.00),
(24, 24, 25, '2024-02-04', 3, 15.00),
(25, 25, 26, '2024-02-05', 4, 100.00),
(26, 26, 27, '2024-02-06', 1, 450.00),
(27, 27, 28, '2024-02-07', 1, 600.00),
(28, 28, 29, '2024-02-08', 1, 500.00),
(29, 29, 30, '2024-02-09', 2, 240.00),
(30, 30, 31, '2024-02-10', 1, 350.00),
(31, 31, 32, '2024-02-11', 1, 450.00),
(32, 32, 33, '2024-02-12', 1, 40.00),
(33, 33, 34, '2024-02-13', 2, 100.00),
(34, 34, 35, '2024-02-14', 3, 120.00),
(35, 35, 36, '2024-02-15', 1, 60.00),
(36, 36, 37, '2024-02-16', 1, 35.00),
(37, 37, 38, '2024-02-17', 2, 110.00),
(38, 38, 39, '2024-02-18', 1, 40.00),
(39, 39, 40, '2024-02-19', 3, 120.00),
(40, 40, 1, '2024-02-20', 1, 1200.00);

Lesson 2: DDL and DML Commands
1. Create Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    HireDate DATE
);
2. Insert 40 Rows into Employees Table
INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary, HireDate) VALUES
(1, 'John Doe', 1, 55000.00, '2020-01-01'),
(2, 'Jane Smith', 2, 65000.00, '2019-03-15'),
(3, 'Mary Johnson', 3, 45000.00, '2021-05-10'),
(4, 'James Brown', 1, 60000.00, '2018-07-22'),
(5, 'Patricia Davis', 4, 70000.00, '2017-08-30'),
(6, 'Michael Miller', 2, 75000.00, '2020-12-12'),
(7, 'Linda Wilson', 3, 48000.00, '2016-11-02'),
(8, 'David Moore', 4, 85000.00, '2021-09-01'),
(9, 'Elizabeth Taylor', 1, 60000.00, '2019-05-18'),
(10, 'William Anderson', 2, 64000.00, '2020-04-10'),
(11, 'Susan Thomas', 3, 47000.00, '2017-01-25'),
(12, 'Joseph Jackson', 4, 78000.00, '2016-09-30'),
(13, 'Karen White', 1, 59000.00, '2018-06-10'),
(14, 'Steven Harris', 2, 71000.00, '2021-07-15'),
(15, 'Nancy Clark', 3, 45000.00, '2020-02-20'),
(16, 'George Lewis', 4, 80000.00, '2019-11-10'),
(17, 'Betty Lee', 1, 55000.00, '2017-04-05'),
(18, 'Samuel Walker', 2, 72000.00, '2021-03-22'),
(19, 'Helen Hall', 3, 49000.00, '2018-10-16'),
(20, 'Charles Allen', 4, 90000.00, '2015-08-11'),
(21, 'Betty Young', 1, 53000.00, '2020-05-17'),
(22, 'Frank King', 2, 67000.00, '2021-02-02'),
(23, 'Deborah Scott', 3, 47000.00, '2019-07-09'),
(24, 'Matthew Green', 4, 76000.00, '2021-01-15'),
(25, 'Sandra Adams', 1, 54000.00, '2020-06-21'),
(26, 'Paul Nelson', 2, 71000.00, '2018-12-03'),
(27, 'Margaret Carter', 3, 46000.00, '2020-08-19'),
(28, 'Anthony Mitchell', 4, 82000.00, '2021-04-10'),
(29, 'Lisa Perez', 1, 60000.00, '2021-03-05'),
(30, 'Christopher Roberts', 2, 69000.00, '2019-09-24'),
(31, 'Jessica Gonzalez', 3, 47000.00, '2017-12-13'),
(32, 'Brian Moore', 4, 85000.00, '2018-11-05'),
(33, 'Dorothy Evans', 1, 59000.00, '2019-06-11'),
(34, 'Matthew Carter', 2, 70000.00, '2020-01-29'),
(35, 'Rachel Martinez', 3, 51000.00, '2021-06-06'),
(36, 'Daniel Perez', 4, 83000.00, '2021-07-01'),
(37, 'Catherine Roberts', 1, 60000.00, '2020-09-19'),
(38, 'Ronald Murphy', 2, 68000.00, '2017-02-04'),
(39, 'Angela Jenkins', 3, 52000.00, '2018-04-23'),
(40, 'Gary Wright', 4, 87000.00, '2021-01-10');
________________________________________
3. Create Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);
4. Insert 40 Rows into Departments Table
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Sales'),
(2, 'Human Resources'),
(3, 'IT'),
(4, 'Marketing'),
(5, 'Finance'),
(6, 'Legal'),
(7, 'Operations'),
(8, 'Research & Development'),
(9, 'Customer Support'),
(10, 'Procurement'),
(11, 'Supply Chain'),
(12, 'Logistics'),
(13, 'Design'),
(14, 'Product Management'),
(15, 'Public Relations'),
(16, 'Business Development'),
(17, 'Quality Assurance'),
(18, 'Data Analytics'),
(19, 'Software Engineering'),
(20, 'Compliance'),
(21, 'Audit'),
(22, 'Product Design'),
(23, 'Health & Safety'),
(24, 'Training & Development'),
(25, 'Accounting'),
(26, 'IT Security'),
(27, 'Market Research'),
(28, 'Customer Success'),
(29, 'Talent Acquisition'),
(30, 'Communications'),
(31, 'Sales Support'),
(32, 'Business Intelligence'),
(33, 'Project Management'),
(34, 'Legal Affairs'),
(35, 'Creative Services'),
(36, 'Information Systems'),
(37, 'Corporate Strategy'),
(38, 'Change Management'),
(39, 'Investor Relations'),
(40, 'Employee Relations');
________________________________________
Lesson 3: Importing Data from Files, Constraints 
1. Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(50),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    PostalCode VARCHAR(20)
);
2. Insert 40 Rows into Customers Table
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address, City, State, PostalCode) VALUES
(1, 'John', 'Doe', 'johndoe@example.com', '555-1234', '123 Elm St', 'New York', 'NY', '10001'),
(2, 'Jane', 'Smith', 'janesmith@example.com', '555-2345', '456 Oak St', 'Los Angeles', 'CA', '90001'),
(3, 'Alice', 'Johnson', 'alicej@example.com', '555-3456', '789 Pine St', 'Chicago', 'IL', '60601'),
(4, 'Bob', 'Brown', 'bobbrown@example.com', '555-4567', '101 Maple St', 'Houston', 'TX', '77001'),
(5, 'Charlie', 'Davis', 'charliedavis@example.com', '555-5678', '202 Birch St', 'Phoenix', 'AZ', '85001'),
(6, 'David', 'Martinez', 'davidm@example.com', '555-6789', '303 Cedar St', 'San Diego', 'CA', '92101'),
(7, 'Emily', 'Garcia', 'emilyg@example.com', '555-7890', '404 Redwood St', 'Dallas', 'TX', '75201'),
(8, 'Frank', 'Hernandez', 'frankh@example.com', '555-8901', '505 Willow St', 'Austin', 'TX', '73301'),
(9, 'Grace', 'Lopez', 'gracel@example.com', '555-9012', '606 Aspen St', 'Miami', 'FL', '33101'),
(10, 'Helen', 'Gonzalez', 'heleng@example.com', '555-0123', '707 Fir St', 'San Francisco', 'CA', '94101'),
(11, 'Irene', 'Perez', 'irenep@example.com', '555-1234', '808 Maple Ave', 'Seattle', 'WA', '98101'),
(12, 'Jack', 'Wilson', 'jackw@example.com', '555-2345', '909 Oak Ave', 'Denver', 'CO', '80201'),
(13, 'Kim', 'Anderson', 'kima@example.com', '555-3456', '111 Pine Ave', 'Boston', 'MA', '02101'),
(14, 'Liam', 'Thomas', 'liamt@example.com', '555-4567', '222 Cedar Ave', 'Atlanta', 'GA', '30301'),
(15, 'Megan', 'Taylor', 'megant@example.com', '555-5678', '333 Redwood Ave', 'Washington', 'DC', '20001'),
(16, 'Nathan', 'Moore', 'nathanm@example.com', '555-6789', '444 Willow Ave', 'Detroit', 'MI', '48201'),
(17, 'Olivia', 'Jackson', 'oliviaj@example.com', '555-7890', '555 Birch Ave', 'Portland', 'OR', '97201'),
(18, 'Paul', 'White', 'paulw@example.com', '555-8901', '666 Maple Blvd', 'Minneapolis', 'MN', '55101'),
(19, 'Quincy', 'Lee', 'quincyl@example.com', '555-9012', '777 Oak Blvd', 'Charlotte', 'NC', '28201'),
(20, 'Rachel', 'Harris', 'rachelh@example.com', '555-0123', '888 Pine Blvd', 'Las Vegas', 'NV', '89101'),
(21, 'Sam', 'Clark', 'samc@example.com', '555-1234', '999 Cedar Blvd', 'Orlando', 'FL', '32801'),
(22, 'Tina', 'Allen', 'tinaallen@example.com', '555-2345', '1010 Redwood Blvd', 'New Orleans', 'LA', '70112'),
(23, 'Ursula', 'Scott', 'ursulas@example.com', '555-3456', '1111 Willow Blvd', 'Tampa', 'FL', '33601'),
(24, 'Victor', 'Adams', 'victora@example.com', '555-4567', '1212 Birch Blvd', 'Cleveland', 'OH', '44101'),
(25, 'Walter', 'Baker', 'walterb@example.com', '555-5678', '1313 Oak Blvd', 'Columbus', 'OH', '43201'),
(26, 'Xander', 'Nelson', 'xandern@example.com', '555-6789', '1414 Cedar Blvd', 'Indianapolis', 'IN', '46201'),
(27, 'Yvonne', 'Carter', 'yvonnec@example.com', '555-7890', '1515 Maple Dr', 'Kansas City', 'MO', '64101'),
(28, 'Zane', 'Mitchell', 'zanem@example.com', '555-8901', '1616 Redwood Dr', 'Salt Lake City', 'UT', '84101'),
(29, 'Anna', 'Roberts', 'annar@example.com', '555-9012', '1717 Willow Dr', 'Birmingham', 'AL', '35203'),
(30, 'Ben', 'King', 'benk@example.com', '555-0123', '1818 Birch Dr', 'Nashville', 'TN', '37201'),
(31, 'Chloe', 'Green', 'chloeg@example.com', '555-1234', '1919 Oak Dr', 'Boulder', 'CO', '80301'),
(32, 'Daniel', 'Evans', 'daniele@example.com', '555-2345', '2020 Cedar Dr', 'Sacramento', 'CA', '94201'),
(33, 'Ella', 'Collins', 'ellac@example.com', '555-3456', '2121 Redwood Dr', 'Louisville', 'KY', '40202'),
(34, 'Finn', 'Morris', 'finnm@example.com', '555-4567', '2222 Willow St', 'Cincinnati', 'OH', '45202'),
(35, 'Grace', 'Lee', 'gracel@example.com', '555-5678', '2323 Birch St', 'Baltimore', 'MD', '21201'),
(36, 'Holly', 'Martinez', 'hollym@example.com', '555-6789', '2424 Oak St', 'St. Louis', 'MO', '63101'),
(37, 'Ian', 'Robinson', 'ianr@example.com', '555-7890', '2525 Cedar St', 'Fort Worth', 'TX', '76101'),
(38, 'Jasmine', 'Walker', 'jasminew@example.com', '555-8901', '2626 Redwood St', 'Raleigh', 'NC', '27601'),
(39, 'Kyle', 'Young', 'kyley@example.com', '555-9012', '2727 Willow St', 'Pittsburgh', 'PA', '15201'),
(40, 'Liam', 'Harris', 'liamh@example.com', '555-0123', '2828 Birch St', 'Richmond', 'VA', '23220');
________________________________________
3. Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    Category VARCHAR(100),
    Price DECIMAL(10, 2),
    StockQuantity INT
);
4. Insert 40 Rows into Products Table
INSERT INTO Products (ProductID, ProductName, Category, Price, StockQuantity) VALUES
(1, 'Laptop', 'Electronics', 999.99, 50),
(2, 'Smartphone', 'Electronics', 799.99, 100),
(3, 'Tablet', 'Electronics', 499.99, 200),
(4, 'Wireless Mouse', 'Electronics', 29.99, 500),
(5, 'Keyboard', 'Electronics', 49.99, 300),
(6, 'Monitor', 'Electronics', 199.99, 150),
(7, 'Headphones', 'Electronics', 89.99, 400),
(8, 'Smartwatch', 'Electronics', 159.99, 50),
(9, 'Camera', 'Electronics', 499.99, 75),
(10, 'Smart TV', 'Electronics', 699.99, 30),
(11, 'Sofa', 'Furniture', 299.99, 20),
(12, 'Dining Table', 'Furniture', 399.99, 15),
(13, 'Office Chair', 'Furniture', 99.99, 50),
(14, 'Bookshelf', 'Furniture', 129.99, 35),
(15, 'Lamp', 'Furniture', 29.99, 60),
(16, 'Bed', 'Furniture', 499.99, 10),
(17, 'Refrigerator', 'Appliances', 799.99, 25),
(18, 'Washing Machine', 'Appliances', 699.99, 20),
(19, 'Air Conditioner', 'Appliances', 599.99, 10),
(20, 'Microwave', 'Appliances', 99.99, 100),
(21, 'Jacket', 'Clothing', 79.99, 100),
(22, 'Jeans', 'Clothing', 49.99, 150),
(23, 'T-Shirt', 'Clothing', 19.99, 200),
(24, 'Sweater', 'Clothing', 39.99, 120),
(25, 'Dress', 'Clothing', 59.99, 80),
(26, 'Shoes', 'Clothing', 89.99, 50),
(27, 'Boots', 'Clothing', 119.99, 60),
(28, 'Socks', 'Clothing', 5.99, 500),
(29, 'Scarf', 'Clothing', 14.99, 100),
(30, 'Hat', 'Clothing', 24.99, 75),
(31, 'Blender', 'Appliances', 49.99, 200),
(32, 'Toaster', 'Appliances', 29.99, 150),
(33, 'Electric Kettle', 'Appliances', 39.99, 300),
(34, 'Coffee Maker', 'Appliances', 89.99, 50),
(35, 'Hair Dryer', 'Beauty', 39.99, 120),
(36, 'Shampoo', 'Beauty', 19.99, 300),
(37, 'Conditioner', 'Beauty', 14.99, 400),
(38, 'Nail Polish', 'Beauty', 9.99, 200),
(39, 'Body Lotion', 'Beauty', 15.99, 150),
(40, 'Perfume', 'Beauty', 49.99, 60);
________________________________________
5. Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    Status VARCHAR(50)
);
6. Insert 40 Rows into Orders Table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount, Status) VALUES
(1, 1, '2025-01-10', 1500.00, 'Shipped'),
(2, 2, '2025-01-12', 1200.00, 'Pending'),
(3, 3, '2025-01-15', 250.00, 'Delivered'),
(4, 4, '2025-01-18', 800.00, 'Cancelled'),
(5, 5, '2025-01-20', 950.00, 'Shipped'),
(6, 6, '2025-01-22', 1450.00, 'Shipped'),
(7, 7, '2025-01-25', 320.00, 'Delivered'),
(8, 8, '2025-01-28', 500.00, 'Pending'),
(9, 9, '2025-01-30', 1100.00, 'Shipped'),
(10, 10, '2025-02-02', 1300.00, 'Shipped'),
(11, 11, '2025-02-05', 1700.00, 'Delivered'),
(12, 12, '2025-02-07', 800.00, 'Pending'),
(13, 13, '2025-02-09', 600.00, 'Delivered'),
(14, 14, '2025-02-12', 950.00, 'Shipped'),
(15, 15, '2025-02-15', 1500.00, 'Pending'),
(16, 16, '2025-02-17', 1250.00, 'Shipped'),
(17, 17, '2025-02-20', 2000.00, 'Shipped'),
(18, 18, '2025-02-22', 2200.00, 'Pending'),
(19, 19, '2025-02-25', 1800.00, 'Delivered'),
(20, 20, '2025-02-28', 2100.00, 'Cancelled'),
(21, 21, '2025-03-02', 800.00, 'Shipped'),
(22, 22, '2025-03-04', 900.00, 'Delivered'),
(23, 23, '2025-03-06', 300.00, 'Shipped'),
(24, 24, '2025-03-09', 850.00, 'Shipped'),
(25, 25, '2025-03-12', 750.00, 'Delivered'),
(26, 26, '2025-03-15', 500.00, 'Pending'),
(27, 27, '2025-03-17', 1000.00, 'Shipped'),
(28, 28, '2025-03-20', 450.00, 'Cancelled'),
(29, 29, '2025-03-22', 1250.00, 'Pending'),
(30, 30, '2025-03-25', 300.00, 'Shipped'),
(31, 31, '2025-03-28', 600.00, 'Delivered'),
(32, 32, '2025-03-30', 950.00, 'Shipped'),
(33, 33, '2025-04-02', 700.00, 'Pending'),
(34, 34, '2025-04-05', 1200.00, 'Delivered'),
(35, 35, '2025-04-07', 1500.00, 'Shipped'),
(36, 36, '2025-04-10', 2500.00, 'Pending'),
(37, 37, '2025-04-12', 1000.00, 'Delivered'),
(38, 38, '2025-04-15', 1200.00, 'Shipped'),
(39, 39, '2025-04-18', 1800.00, 'Pending'),
(40, 40, '2025-04-20', 1600.00, 'Shipped');

Lesson 4: Filtering and Ordering Data
1. Create Invoices Table
CREATE TABLE Invoices (
    InvoiceID INT PRIMARY KEY,
    CustomerID INT,
    InvoiceDate DATE,
    TotalAmount DECIMAL(10, 2),
    Status VARCHAR(50)
);
2. Insert 40 Rows into Invoices Table
INSERT INTO Invoices (InvoiceID, CustomerID, InvoiceDate, TotalAmount, Status) VALUES
(1, 1, '2025-01-01', 500.00, 'Paid'),
(2, 2, '2025-01-03', 700.00, 'Pending'),
(3, 3, '2025-01-10', 300.00, 'Paid'),
(4, 4, '2025-01-15', 400.00, 'Overdue'),
(5, 5, '2025-01-18', 600.00, 'Paid'),
(6, 6, '2025-01-20', 800.00, 'Pending'),
(7, 7, '2025-02-01', 200.00, 'Paid'),
(8, 8, '2025-02-05', 350.00, 'Pending'),
(9, 9, '2025-02-07', 450.00, 'Paid'),
(10, 10, '2025-02-10', 550.00, 'Pending'),
(11, 11, '2025-02-15', 650.00, 'Overdue'),
(12, 12, '2025-02-20', 750.00, 'Paid'),
(13, 13, '2025-03-01', 900.00, 'Paid'),
(14, 14, '2025-03-05', 1000.00, 'Pending'),
(15, 15, '2025-03-10', 1200.00, 'Paid'),
(16, 16, '2025-03-12', 1500.00, 'Overdue'),
(17, 17, '2025-03-15', 1800.00, 'Paid'),
(18, 18, '2025-03-20', 2500.00, 'Pending'),
(19, 19, '2025-04-01', 3000.00, 'Paid'),
(20, 20, '2025-04-03', 3500.00, 'Pending'),
(21, 21, '2025-04-05', 4000.00, 'Overdue'),
(22, 22, '2025-04-08', 4500.00, 'Paid'),
(23, 23, '2025-04-10', 5000.00, 'Pending'),
(24, 24, '2025-04-12', 5500.00, 'Paid'),
(25, 25, '2025-04-15', 6000.00, 'Overdue'),
(26, 26, '2025-04-20', 6500.00, 'Paid'),
(27, 27, '2025-05-01', 7000.00, 'Pending'),
(28, 28, '2025-05-03', 7500.00, 'Paid'),
(29, 29, '2025-05-07', 8000.00, 'Pending'),
(30, 30, '2025-05-10', 8500.00, 'Paid'),
(31, 31, '2025-05-12', 9000.00, 'Overdue'),
(32, 32, '2025-05-15', 9500.00, 'Paid'),
(33, 33, '2025-05-18', 10000.00, 'Pending'),
(34, 34, '2025-06-01', 10500.00, 'Paid'),
(35, 35, '2025-06-03', 11000.00, 'Pending'),
(36, 36, '2025-06-05', 11500.00, 'Paid'),
(37, 37, '2025-06-07', 12000.00, 'Overdue'),
(38, 38, '2025-06-10', 12500.00, 'Paid'),
(39, 39, '2025-06-12', 13000.00, 'Pending'),
(40, 40, '2025-06-15', 13500.00, 'Paid');
________________________________________
3. Create Categories Table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100)
);
4. Insert 40 Rows into Categories Table
INSERT INTO Categories (CategoryID, CategoryName) VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Home & Kitchen'),
(4, 'Sports & Outdoors'),
(5, 'Beauty & Personal Care'),
(6, 'Toys & Games'),
(7, 'Books'),
(8, 'Groceries'),
(9, 'Furniture'),
(10, 'Automotive'),
(11, 'Health & Wellness'),
(12, 'Pet Supplies'),
(13, 'Jewelry'),
(14, 'Baby Products'),
(15, 'Music'),
(16, 'Movies & TV Shows'),
(17, 'Office Supplies'),
(18, 'Tools & Home Improvement'),
(19, 'Garden & Outdoor'),
(20, 'Food & Beverages'),
(21, 'Software'),
(22, 'Art & Craft'),
(23, 'Travel Accessories'),
(24, 'Phone Accessories'),
(25, 'Luggage & Bags'),
(26, 'Gifts & Occasions'),
(27, 'Digital Products'),
(28, 'Gaming Consoles'),
(29, 'Cameras & Photography'),
(30, 'Smart Home'),
(31, 'Computers & Laptops'),
(32, 'Appliances'),
(33, 'Musical Instruments'),
(34, 'Party Supplies'),
(35, 'Watches'),
(36, 'Outdoor Gear'),
(37, 'Seasonal Products'),
(38, 'Luxury Goods'),
(39, 'Home Decor'),
(40, 'Art Supplies');
________________________________________
Lesson 5: Aliases, Joining Tables
1. Create EmployeeProjects Table
CREATE TABLE EmployeeProjects (
    EmployeeProjectID INT PRIMARY KEY,
    EmployeeID INT,
    ProjectID INT,
    StartDate DATE,
    EndDate DATE,
    Role VARCHAR(100)
);
2. Insert 40 Rows into EmployeeProjects Table
INSERT INTO EmployeeProjects (EmployeeProjectID, EmployeeID, ProjectID, StartDate, EndDate, Role) VALUES
(1, 1, 1, '2023-01-10', '2023-06-10', 'Lead Developer'),
(2, 2, 2, '2023-02-15', '2023-07-15', 'Project Manager'),
(3, 3, 1, '2023-03-01', '2023-08-01', 'Developer'),
(4, 4, 3, '2023-04-05', '2023-09-05', 'QA Analyst'),
(5, 5, 2, '2023-05-12', '2023-10-12', 'Business Analyst'),
(6, 6, 3, '2023-06-20', '2023-11-20', 'Developer'),
(7, 7, 1, '2023-07-25', '2023-12-25', 'Designer'),
(8, 8, 4, '2023-08-10', '2024-01-10', 'Project Manager'),
(9, 9, 2, '2023-09-15', '2024-02-15', 'Developer'),
(10, 10, 5, '2023-10-05', '2024-03-05', 'QA Analyst'),
(11, 1, 6, '2023-11-15', '2024-04-15', 'Lead Developer'),
(12, 2, 4, '2023-12-01', '2024-05-01', 'Business Analyst'),
(13, 3, 5, '2024-01-10', '2024-06-10', 'Designer'),
(14, 4, 6, '2024-02-15', '2024-07-15', 'Project Manager'),
(15, 5, 7, '2024-03-20', '2024-08-20', 'Developer'),
(16, 6, 8, '2024-04-25', '2024-09-25', 'QA Analyst'),
(17, 7, 7, '2024-05-30', '2024-10-30', 'Lead Developer'),
(18, 8, 9, '2024-06-15', '2024-11-15', 'Project Manager'),
(19, 9, 6, '2024-07-01', '2024-12-01', 'Business Analyst'),
(20, 10, 8, '2024-08-05', '2025-01-05', 'Developer'),
(21, 1, 10, '2024-09-10', '2025-02-10', 'Designer'),
(22, 2, 9, '2024-10-15', '2025-03-15', 'Lead Developer'),
(23, 3, 8, '2024-11-20', '2025-04-20', 'QA Analyst'),
(24, 4, 7, '2024-12-01', '2025-05-01', 'Project Manager'),
(25, 5, 6, '2025-01-10', '2025-06-10', 'Business Analyst'),
(26, 6, 5, '2025-02-20', '2025-07-20', 'Developer'),
(27, 7, 4, '2025-03-25', '2025-08-25', 'Designer'),
(28, 8, 3, '2025-04-10', '2025-09-10', 'Lead Developer'),
(29, 9, 2, '2025-05-05', '2025-10-05', 'QA Analyst'),
(30, 10, 1, '2025-06-15', '2025-11-15', 'Project Manager'),
(31, 1, 5, '2025-07-01', '2025-12-01', 'Developer'),
(32, 2, 4, '2025-08-20', '2026-01-20', 'Lead Developer'),
(33, 3, 6, '2025-09-05', '2026-02-05', 'QA Analyst'),
(34, 4, 7, '2025-10-10', '2026-03-10', 'Business Analyst'),
(35, 5, 8, '2025-11-25', '2026-04-25', 'Designer'),
(36, 6, 9, '2025-12-05', '2026-05-05', 'Project Manager'),
(37, 7, 10, '2026-01-10', '2026-06-10', 'Lead Developer'),
(38, 8, 9, '2026-02-01', '2026-07-01', 'QA Analyst'),
(39, 9, 6, '2026-03-15', '2026-08-15', 'Business Analyst'),
(40, 10, 5, '2026-04-10', '2026-09-10', 'Developer');
________________________________________
3. Create Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(255),
    ManagerID INT
);
4. Insert 40 Rows into Departments Table
INSERT INTO Departments (DepartmentID, DepartmentName, ManagerID) VALUES
(1, 'Sales', 1),
(2, 'Marketing', 2),
(3, 'IT', 3),
(4, 'Human Resources', 4),
(5, 'Finance', 5),
(6, 'Operations', 6),
(7, 'Legal', 7),
(8, 'Customer Support', 8),
(9, 'Product Development', 9),
(10, 'Business Analysis', 10),
(11, 'Design', 1),
(12, 'Research and Development', 2),
(13, 'Purchasing', 3),
(14, 'Supply Chain', 4),
(15, 'Public Relations', 5),
(16, 'Quality Assurance', 6),
(17, 'Logistics', 7),
(18, 'Sales Support', 8),
(19, 'Marketing Communications', 9),
(20, 'Legal Affairs', 10),
(21, 'Product Management', 1),
(22, 'Training and Development', 2),
(23, 'Payroll', 3),
(24, 'Compensation', 4),
(25, 'Recruitment', 5),
(26, 'Executive Management', 6),
(27, 'Audit', 7),
(28, 'Corporate Strategy', 8),
(29, 'Customer Success', 9),
(30, 'Field Operations', 10),
(31, 'Business Intelligence', 1),
(32, 'Risk Management', 2),
(33, 'Treasury', 3),
(34, 'Internal Control', 4),
(35, 'Investor Relations', 5),
(36, 'E-commerce', 6),
(37, 'Real Estate', 7),
(38, 'Branding', 8),
(39, 'Content Creation', 9),
(40, 'Software Development', 10);
________________________________________
Lesson 6: Grouping Data
Here is the SQL code to create the Sales and Transactions tables and insert 40 rows of data for each.
1. Create Sales Table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    SaleDate DATE,
    SaleAmount DECIMAL(10, 2)
);
2. Insert 40 Rows into Sales Table
INSERT INTO Sales (SaleID, ProductID, CustomerID, SaleDate, SaleAmount) VALUES
(1, 1, 1, '2023-01-01', 150.00),
(2, 2, 2, '2023-01-02', 200.00),
(3, 3, 3, '2023-01-03', 250.00),
(4, 4, 4, '2023-01-04', 300.00),
(5, 5, 5, '2023-01-05', 350.00),
(6, 6, 6, '2023-01-06', 400.00),
(7, 7, 7, '2023-01-07', 450.00),
(8, 8, 8, '2023-01-08', 500.00),
(9, 9, 9, '2023-01-09', 550.00),
(10, 10, 10, '2023-01-10', 600.00),
(11, 1, 1, '2023-01-11', 150.00),
(12, 2, 2, '2023-01-12', 200.00),
(13, 3, 3, '2023-01-13', 250.00),
(14, 4, 4, '2023-01-14', 300.00),
(15, 5, 5, '2023-01-15', 350.00),
(16, 6, 6, '2023-01-16', 400.00),
(17, 7, 7, '2023-01-17', 450.00),
(18, 8, 8, '2023-01-18', 500.00),
(19, 9, 9, '2023-01-19', 550.00),
(20, 10, 10, '2023-01-20', 600.00),
(21, 1, 2, '2023-01-21', 150.00),
(22, 2, 3, '2023-01-22', 200.00),
(23, 3, 4, '2023-01-23', 250.00),
(24, 4, 5, '2023-01-24', 300.00),
(25, 5, 6, '2023-01-25', 350.00),
(26, 6, 7, '2023-01-26', 400.00),
(27, 7, 8, '2023-01-27', 450.00),
(28, 8, 9, '2023-01-28', 500.00),
(29, 9, 10, '2023-01-29', 550.00),
(30, 10, 1, '2023-01-30', 600.00),
(31, 1, 2, '2023-02-01', 150.00),
(32, 2, 3, '2023-02-02', 200.00),
(33, 3, 4, '2023-02-03', 250.00),
(34, 4, 5, '2023-02-04', 300.00),
(35, 5, 6, '2023-02-05', 350.00),
(36, 6, 7, '2023-02-06', 400.00),
(37, 7, 8, '2023-02-07', 450.00),
(38, 8, 9, '2023-02-08', 500.00),
(39, 9, 10, '2023-02-09', 550.00),
(40, 10, 1, '2023-02-10', 600.00);
________________________________________
3. Create Transactions Table
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    CustomerID INT,
    TransactionDate DATE,
    Amount DECIMAL(10, 2),
    TransactionType VARCHAR(50)
);
4. Insert 40 Rows into Transactions Table
INSERT INTO Transactions (TransactionID, CustomerID, TransactionDate, Amount, TransactionType) VALUES
(1, 1, '2023-01-01', 100.00, 'Purchase'),
(2, 2, '2023-01-02', 150.00, 'Refund'),
(3, 3, '2023-01-03', 200.00, 'Purchase'),
(4, 4, '2023-01-04', 250.00, 'Refund'),
(5, 5, '2023-01-05', 300.00, 'Purchase'),
(6, 6, '2023-01-06', 350.00, 'Refund'),
(7, 7, '2023-01-07', 400.00, 'Purchase'),
(8, 8, '2023-01-08', 450.00, 'Refund'),
(9, 9, '2023-01-09', 500.00, 'Purchase'),
(10, 10, '2023-01-10', 550.00, 'Refund'),
(11, 1, '2023-01-11', 100.00, 'Refund'),
(12, 2, '2023-01-12', 150.00, 'Purchase'),
(13, 3, '2023-01-13', 200.00, 'Refund'),
(14, 4, '2023-01-14', 250.00, 'Purchase'),
(15, 5, '2023-01-15', 300.00, 'Refund'),
(16, 6, '2023-01-16', 350.00, 'Purchase'),
(17, 7, '2023-01-17', 400.00, 'Refund'),
(18, 8, '2023-01-18', 450.00, 'Purchase'),
(19, 9, '2023-01-19', 500.00, 'Refund'),
(20, 10, '2023-01-20', 550.00, 'Purchase'),
(21, 1, '2023-01-21', 100.00, 'Refund'),
(22, 2, '2023-01-22', 150.00, 'Purchase'),
(23, 3, '2023-01-23', 200.00, 'Refund'),
(24, 4, '2023-01-24', 250.00, 'Purchase'),
(25, 5, '2023-01-25', 300.00, 'Refund'),
(26, 6, '2023-01-26', 350.00, 'Purchase'),
(27, 7, '2023-01-27', 400.00, 'Refund'),
(28, 8, '2023-01-28', 450.00, 'Purchase'),
(29, 9, '2023-01-29', 500.00, 'Refund'),
(30, 10, '2023-01-30', 550.00, 'Purchase'),
(31, 1, '2023-02-01', 100.00, 'Purchase'),
(32, 2, '2023-02-02', 150.00, 'Refund'),
(33, 3, '2023-02-03', 200.00, 'Purchase'),
(34, 4, '2023-02-04', 250.00, 'Refund'),
(35, 5, '2023-02-05', 300.00, 'Purchase'),
(36, 6, '2023-02-06', 350.00, 'Refund'),
(37, 7, '2023-02-07', 400.00, 'Purchase'),
(38, 8, '2023-02-08', 450.00, 'Refund'),
(39, 9, '2023-02-09', 500.00, 'Purchase'),
(40, 10, '2023-02-10', 550.00, 'Refund');
________________________________________
Lesson 7: Aggregate Functions, Pivoting
1. Create Sales Table
sql
КопироватьРедактировать
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    SaleDate DATE,
    SaleAmount DECIMAL(10, 2)
);
2. Insert 40 Rows into Sales Table
sql
КопироватьРедактировать
INSERT INTO Sales (SaleID, ProductID, CustomerID, SaleDate, SaleAmount) VALUES
(1, 1, 1, '2023-01-01', 150.00),
(2, 2, 2, '2023-01-02', 200.00),
(3, 3, 3, '2023-01-03', 250.00),
(4, 4, 4, '2023-01-04', 300.00),
(5, 5, 5, '2023-01-05', 350.00),
(6, 6, 6, '2023-01-06', 400.00),
(7, 7, 7, '2023-01-07', 450.00),
(8, 8, 8, '2023-01-08', 500.00),
(9, 9, 9, '2023-01-09', 550.00),
(10, 10, 10, '2023-01-10', 600.00),
(11, 1, 1, '2023-01-11', 150.00),
(12, 2, 2, '2023-01-12', 200.00),
(13, 3, 3, '2023-01-13', 250.00),
(14, 4, 4, '2023-01-14', 300.00),
(15, 5, 5, '2023-01-15', 350.00),
(16, 6, 6, '2023-01-16', 400.00),
(17, 7, 7, '2023-01-17', 450.00),
(18, 8, 8, '2023-01-18', 500.00),
(19, 9, 9, '2023-01-19', 550.00),
(20, 10, 10, '2023-01-20', 600.00),
(21, 1, 2, '2023-01-21', 150.00),
(22, 2, 3, '2023-01-22', 200.00),
(23, 3, 4, '2023-01-23', 250.00),
(24, 4, 5, '2023-01-24', 300.00),
(25, 5, 6, '2023-01-25', 350.00),
(26, 6, 7, '2023-01-26', 400.00),
(27, 7, 8, '2023-01-27', 450.00),
(28, 8, 9, '2023-01-28', 500.00),
(29, 9, 10, '2023-01-29', 550.00),
(30, 10, 1, '2023-01-30', 600.00),
(31, 1, 2, '2023-02-01', 150.00),
(32, 2, 3, '2023-02-02', 200.00),
(33, 3, 4, '2023-02-03', 250.00),
(34, 4, 5, '2023-02-04', 300.00),
(35, 5, 6, '2023-02-05', 350.00),
(36, 6, 7, '2023-02-06', 400.00),
(37, 7, 8, '2023-02-07', 450.00),
(38, 8, 9, '2023-02-08', 500.00),
(39, 9, 10, '2023-02-09', 550.00),
(40, 10, 1, '2023-02-10', 600.00);

3. Create EmployeePerformance Table
sql
КопироватьРедактировать
CREATE TABLE EmployeePerformance (
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    Year INT,
    Quarter INT,
    PerformanceScore DECIMAL(5, 2)
);
4. Insert 40 Rows into EmployeePerformance Table
sql
КопироватьРедактировать
INSERT INTO EmployeePerformance (EmployeeID, EmployeeName, Year, Quarter, PerformanceScore) VALUES
(1, 'John Doe', 2023, 1, 85.00),
(2, 'Jane Smith', 2023, 1, 90.00),
(3, 'Samuel Brown', 2023, 1, 80.00),
(4, 'Emily White', 2023, 1, 95.00),
(5, 'Michael Green', 2023, 1, 88.00),
(6, 'Sarah Black', 2023, 1, 92.00),
(7, 'David Blue', 2023, 1, 87.00),
(8, 'Linda Purple', 2023, 1, 89.00),
(9, 'Peter Orange', 2023, 1, 91.00),
(10, 'Maria Pink', 2023, 1, 84.00),
(11, 'John Doe', 2023, 2, 88.00),
(12, 'Jane Smith', 2023, 2, 92.00),
(13, 'Samuel Brown', 2023, 2, 81.00),
(14, 'Emily White', 2023, 2, 94.00),
(15, 'Michael Green', 2023, 2, 89.00),
(16, 'Sarah Black', 2023, 2, 93.00),
(17, 'David Blue', 2023, 2, 86.00),
(18, 'Linda Purple', 2023, 2, 90.00),
(19, 'Peter Orange', 2023, 2, 92.00),
(20, 'Maria Pink', 2023, 2, 85.00),
(21, 'John Doe', 2023, 3, 90.00),
(22, 'Jane Smith', 2023, 3, 95.00),
(23, 'Samuel Brown', 2023, 3, 82.00),
(24, 'Emily White', 2023, 3, 96.00),
(25, 'Michael Green', 2023, 3, 90.00),
(26, 'Sarah Black', 2023, 3, 94.00),
(27, 'David Blue', 2023, 3, 88.00),
(28, 'Linda Purple', 2023, 3, 92.00),
(29, 'Peter Orange', 2023, 3, 93.00),
(30, 'Maria Pink', 2023, 3, 86.00),
(31, 'John Doe', 2023, 4, 92.00),
(32, 'Jane Smith', 2023, 4, 96.00),
(33, 'Samuel Brown', 2023, 4, 84.00),
(34, 'Emily White', 2023, 4, 97.00),
(35, 'Michael Green', 2023, 4, 91.00),
(36, 'Sarah Black', 2023, 4, 95.00),
(37, 'David Blue', 2023, 4, 89.00),
(38, 'Linda Purple', 2023, 4, 93.00),
(39, 'Peter Orange', 2023, 4, 94.00),
(40, 'Maria Pink', 2023, 4, 87.00);


Lesson 8: Joins
________________________________________
1. Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Country VARCHAR(50)
);
2. Insert 40 Rows into Customers Table
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
________________________________________
3. Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);
4. Insert 40 Rows into Products Table
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
________________________________________
5. Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    Quantity INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
6. Insert 40 Rows into Orders Table
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
________________________________________
7. Create EmployeeDepartments Table
CREATE TABLE EmployeeDepartments (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    DepartmentName VARCHAR(100)
);
8. Insert 40 Rows into EmployeeDepartments Table
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
________________________________________


Lesson 9: Advanced Joins, Cross Apply, and Outer Apply
________________________________________
1. Create CustomerOrders Table
CREATE TABLE CustomerOrders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    ProductID INT,
    Quantity INT,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
2. Insert 40 Rows into CustomerOrders Table
INSERT INTO CustomerOrders (OrderID, CustomerID, OrderDate, ProductID, Quantity, TotalAmount) VALUES
(1, 1, '2023-01-15', 2, 2, 1600.00),
(2, 2, '2023-01-20', 3, 1, 400.00),
(3, 3, '2023-02-15', 5, 3, 150.00),
(4, 4, '2023-02-18', 8, 1, 100.00),
(5, 5, '2023-03-10', 6, 4, 120.00),
(6, 6, '2023-03-12', 7, 2, 300.00),
(7, 7, '2023-03-20', 9, 1, 80.00),
(8, 8, '2023-04-05', 1, 1, 1200.00),
(9, 9, '2023-04-10', 4, 2, 400.00),
(10, 10, '2023-04-15', 10, 1, 60.00),
(11, 11, '2023-05-01', 3, 2, 800.00),
(12, 12, '2023-05-03', 6, 1, 60.00),
(13, 13, '2023-05-10', 2, 1, 800.00),
(14, 14, '2023-06-01', 8, 3, 300.00),
(15, 15, '2023-06-02', 5, 2, 100.00),
(16, 16, '2023-06-15', 7, 2, 150.00),
(17, 17, '2023-06-20', 9, 1, 80.00),
(18, 18, '2023-07-01', 4, 3, 600.00),
(19, 19, '2023-07-05', 1, 1, 1200.00),
(20, 20, '2023-07-10', 10, 1, 60.00),
(21, 21, '2023-08-01', 6, 2, 120.00),
(22, 22, '2023-08-03', 2, 3, 1200.00),
(23, 23, '2023-08-10', 3, 1, 400.00),
(24, 24, '2023-09-01', 5, 1, 150.00),
(25, 25, '2023-09-05', 7, 2, 300.00),
(26, 26, '2023-09-10', 8, 3, 300.00),
(27, 27, '2023-09-15', 4, 1, 200.00),
(28, 28, '2023-10-01', 9, 1, 80.00),
(29, 29, '2023-10-05', 1, 2, 2400.00),
(30, 30, '2023-10-10', 3, 1, 400.00),
(31, 31, '2023-11-01', 6, 4, 240.00),
(32, 32, '2023-11-05', 7, 3, 450.00),
(33, 33, '2023-11-10', 5, 2, 100.00),
(34, 34, '2023-11-15', 9, 1, 80.00),
(35, 35, '2023-12-01', 8, 1, 100.00),
(36, 36, '2023-12-05', 10, 2, 120.00),
(37, 37, '2023-12-10', 4, 3, 600.00),
(38, 38, '2023-12-15', 3, 2, 800.00),
(39, 39, '2023-12-20', 2, 3, 1200.00),
(40, 40, '2023-12-25', 1, 1, 1200.00);
________________________________________
3. Create ProductCategories Table
CREATE TABLE ProductCategories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100),
    ProductID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
4. Insert 40 Rows into ProductCategories Table
INSERT INTO ProductCategories (CategoryID, CategoryName, ProductID) VALUES
(1, 'Electronics', 1),
(2, 'Electronics', 2),
(3, 'Electronics', 3),
(4, 'Office Equipment', 4),
(5, 'Office Equipment', 5),
(6, 'Accessories', 6),
(7, 'Accessories', 7),
(8, 'Office Equipment', 8),
(9, 'Home Appliances', 9),
(10, 'Home Appliances', 10),
(11, 'Electronics', 1),
(12, 'Electronics', 2),
(13, 'Electronics', 3),
(14, 'Office Equipment', 4),
(15, 'Office Equipment', 5),
(16, 'Accessories', 6),
(17, 'Accessories', 7),
(18, 'Office Equipment', 8),
(19, 'Home Appliances', 9),
(20, 'Home Appliances', 10),
(21, 'Electronics', 1),
(22, 'Electronics', 2),
(23, 'Electronics', 3),
(24, 'Office Equipment', 4),
(25, 'Office Equipment', 5),
(26, 'Accessories', 6),
(27, 'Accessories', 7),
(28, 'Office Equipment', 8),
(29, 'Home Appliances', 9),
(30, 'Home Appliances', 10),
(31, 'Electronics', 1),
(32, 'Electronics', 2),
(33, 'Electronics', 3),
(34, 'Office Equipment', 4),
(35, 'Office Equipment', 5),
(36, 'Accessories', 6),
(37, 'Accessories', 7),
(38, 'Office Equipment', 8),
(39, 'Home Appliances', 9),
(40, 'Home Appliances', 10);
________________________________________


Lesson 10: Advanced Joins and Functions 
________________________________________
1. Create EmployeeRoles Table
CREATE TABLE EmployeeRoles (
    RoleID INT PRIMARY KEY,
    RoleName VARCHAR(100),
    EmployeeID INT,
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    StartDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
2. Insert 40 Rows into EmployeeRoles Table
INSERT INTO EmployeeRoles (RoleID, RoleName, EmployeeID, DepartmentID, Salary, StartDate) VALUES
(1, 'Manager', 1, 1, 75000.00, '2018-01-01'),
(2, 'Developer', 2, 2, 60000.00, '2019-02-01'),
(3, 'Analyst', 3, 3, 55000.00, '2020-03-15'),
(4, 'HR Specialist', 4, 4, 50000.00, '2021-04-10'),
(5, 'Designer', 5, 2, 65000.00, '2017-06-05'),
(6, 'Tester', 6, 3, 45000.00, '2022-07-20'),
(7, 'Developer', 7, 2, 60000.00, '2018-11-15'),
(8, 'Manager', 8, 1, 80000.00, '2016-01-01'),
(9, 'HR Specialist', 9, 4, 47000.00, '2021-08-30'),
(10, 'Analyst', 10, 3, 55000.00, '2020-05-20'),
(11, 'Developer', 11, 2, 63000.00, '2019-03-10'),
(12, 'Manager', 12, 1, 78000.00, '2017-02-01'),
(13, 'Tester', 13, 3, 46000.00, '2020-06-15'),
(14, 'HR Specialist', 14, 4, 50000.00, '2021-07-01'),
(15, 'Developer', 15, 2, 62000.00, '2019-09-10'),
(16, 'Analyst', 16, 3, 54000.00, '2020-10-20'),
(17, 'Manager', 17, 1, 81000.00, '2015-01-01'),
(18, 'Designer', 18, 2, 66000.00, '2018-05-05'),
(19, 'Developer', 19, 2, 61000.00, '2021-06-01'),
(20, 'HR Specialist', 20, 4, 49000.00, '2022-04-15'),
(21, 'Tester', 21, 3, 46000.00, '2022-01-10'),
(22, 'Developer', 22, 2, 63000.00, '2019-11-15'),
(23, 'Manager', 23, 1, 76000.00, '2017-01-10'),
(24, 'HR Specialist', 24, 4, 51000.00, '2021-03-25'),
(25, 'Analyst', 25, 3, 56000.00, '2020-02-15'),
(26, 'Developer', 26, 2, 59000.00, '2019-07-15'),
(27, 'Tester', 27, 3, 47000.00, '2021-12-01'),
(28, 'Manager', 28, 1, 82000.00, '2016-06-05'),
(29, 'Developer', 29, 2, 62000.00, '2019-02-10'),
(30, 'Analyst', 30, 3, 54000.00, '2020-11-01'),
(31, 'HR Specialist', 31, 4, 48000.00, '2021-09-25'),
(32, 'Developer', 32, 2, 65000.00, '2020-04-15'),
(33, 'Manager', 33, 1, 77000.00, '2018-10-05'),
(34, 'Analyst', 34, 3, 53000.00, '2020-09-10'),
(35, 'Tester', 35, 3, 45000.00, '2022-02-01'),
(36, 'Developer', 36, 2, 62000.00, '2020-07-10'),
(37, 'Manager', 37, 1, 78000.00, '2015-11-15'),
(38, 'Designer', 38, 2, 67000.00, '2020-01-01'),
(39, 'HR Specialist', 39, 4, 49000.00, '2021-05-10'),
(40, 'Developer', 40, 2, 65000.00, '2021-12-01');
________________________________________
3. Create ProductDiscounts Table
CREATE TABLE ProductDiscounts (
    DiscountID INT PRIMARY KEY,
    ProductID INT,
    DiscountPercentage DECIMAL(5, 2),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
4. Insert 40 Rows into ProductDiscounts Table
INSERT INTO ProductDiscounts (DiscountID, ProductID, DiscountPercentage, StartDate, EndDate) VALUES
(1, 1, 10.00, '2023-01-01', '2023-01-31'),
(2, 2, 15.00, '2023-02-01', '2023-02-28'),
(3, 3, 20.00, '2023-03-01', '2023-03-31'),
(4, 4, 5.00, '2023-04-01', '2023-04-30'),
(5, 5, 25.00, '2023-05-01', '2023-05-31'),
(6, 6, 30.00, '2023-06-01', '2023-06-30'),
(7, 7, 12.00, '2023-07-01', '2023-07-31'),
(8, 8, 8.00, '2023-08-01', '2023-08-31'),
(9, 9, 18.00, '2023-09-01', '2023-09-30'),
(10, 10, 10.00, '2023-10-01', '2023-10-31'),
(11, 1, 15.00, '2023-11-01', '2023-11-30'),
(12, 2, 20.00, '2023-12-01', '2023-12-31'),
(13, 3, 10.00, '2023-01-01', '2023-01-31'),
(14, 4, 30.00, '2023-02-01', '2023-02-28'),
(15, 5, 5.00, '2023-03-01', '2023-03-31'),
(16, 6, 25.00, '2023-04-01', '2023-04-30'),
(17, 7, 10.00, '2023-05-01', '2023-05-31'),
(18, 8, 20.00, '2023-06-01', '2023-06-30'),
(19, 9, 12.00, '2023-07-01', '2023-07-31'),
(20, 10, 18.00, '2023-08-01', '2023-08-31'),
(21, 1, 8.00, '2023-09-01', '2023-09-30'),
(22, 2, 15.00, '2023-10-01', '2023-10-31'),
(23, 3, 10.00, '2023-11-01', '2023-11-30'),
(24, 4, 5.00, '2023-12-01', '2023-12-31'),
(25, 5, 30.00, '2023-01-01', '2023-01-31'),
(26, 6, 10.00, '2023-02-01', '2023-02-28'),
(27, 7, 25.00, '2023-03-01', '2023-03-31'),
(28, 8, 12.00, '2023-04-01', '2023-04-30'),
(29, 9, 8.00, '2023-05-01', '2023-05-31'),
(30, 10, 20.00, '2023-06-01', '2023-06-30'),
(31, 1, 12.00, '2023-07-01', '2023-07-31'),
(32, 2, 10.00, '2023-08-01', '2023-08-31'),
(33, 3, 18.00, '2023-09-01', '2023-09-30'),
(34, 4, 20.00, '2023-10-01', '2023-10-31'),
(35, 5, 15.00, '2023-11-01', '2023-11-30'),
(36, 6, 10.00, '2023-12-01', '2023-12-31'),
(37, 7, 20.00, '2023-01-01', '2023-01-31'),
(38, 8, 25.00, '2023-02-01', '2023-02-28'),
(39, 9, 10.00, '2023-03-01', '2023-03-31'),
(40, 10, 15.00, '2023-04-01', '2023-04-30');
________________________________________
--Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    Category VARCHAR(100),
    Price DECIMAL(10, 2),
    StockQuantity INT
);
Insert 40 Rows into Products Table
INSERT INTO Products (ProductID, ProductName, Category, Price, StockQuantity) VALUES
(1, 'Laptop', 'Electronics', 999.99, 50),
(2, 'Smartphone', 'Electronics', 799.99, 100),
(3, 'Tablet', 'Electronics', 499.99, 200),
(4, 'Wireless Mouse', 'Electronics', 29.99, 500),
(5, 'Keyboard', 'Electronics', 49.99, 300),
(6, 'Monitor', 'Electronics', 199.99, 150),
(7, 'Headphones', 'Electronics', 89.99, 400),
(8, 'Smartwatch', 'Electronics', 159.99, 50),
(9, 'Camera', 'Electronics', 499.99, 75),
(10, 'Smart TV', 'Electronics', 699.99, 30),
(11, 'Sofa', 'Furniture', 299.99, 20),
(12, 'Dining Table', 'Furniture', 399.99, 15),
(13, 'Office Chair', 'Furniture', 99.99, 50),
(14, 'Bookshelf', 'Furniture', 129.99, 35),
(15, 'Lamp', 'Furniture', 29.99, 60),
(16, 'Bed', 'Furniture', 499.99, 10),
(17, 'Refrigerator', 'Appliances', 799.99, 25),
(18, 'Washing Machine', 'Appliances', 699.99, 20),
(19, 'Air Conditioner', 'Appliances', 599.99, 10),
(20, 'Microwave', 'Appliances', 99.99, 100),
(21, 'Jacket', 'Clothing', 79.99, 100),
(22, 'Jeans', 'Clothing', 49.99, 150),
(23, 'T-Shirt', 'Clothing', 19.99, 200),
(24, 'Sweater', 'Clothing', 39.99, 120),
(25, 'Dress', 'Clothing', 59.99, 80),
(26, 'Shoes', 'Clothing', 89.99, 50),
(27, 'Boots', 'Clothing', 119.99, 60),
(28, 'Socks', 'Clothing', 5.99, 500),
(29, 'Scarf', 'Clothing', 14.99, 100),
(30, 'Hat', 'Clothing', 24.99, 75),
(31, 'Blender', 'Appliances', 49.99, 200),
(32, 'Toaster', 'Appliances', 29.99, 150),
(33, 'Electric Kettle', 'Appliances', 39.99, 300),
(34, 'Coffee Maker', 'Appliances', 89.99, 50),
(35, 'Hair Dryer', 'Beauty', 39.99, 120),
(36, 'Shampoo', 'Beauty', 19.99, 300),
(37, 'Conditioner', 'Beauty', 14.99, 400),
(38, 'Nail Polish', 'Beauty', 9.99, 200),
(39, 'Body Lotion', 'Beauty', 15.99, 150),
(40, 'Perfume', 'Beauty', 49.99, 60);
--Task 1

SELECT ProductName AS Name
FROM Products;
--Write a query that uses an alias to rename the Customers table as Client for easier reference.
SELECT FirstName, LastName  
FROM Customers AS Client;
--Use UNION to combine results from two queries 
--that select ProductName from Products and ProductName from Products_Discontinued.
CREATE TABLE Products_Discontinued (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

INSERT INTO Products_Discontinued (ProductID, ProductName, Price) VALUES
(21, 'DVD Player', 70.00),
(22, 'MP3 Player', 50.00),
(23, 'CRT Monitor', 100.00),
(24, 'Fax Machine', 120.00),
(25, 'Pager', 30.00),
(26, 'VCR', 90.00),
(27, 'Blackberry Phone', 150.00),
(28, 'MiniDisc Player', 80.00),
(29, 'Plasma TV', 600.00),
(30, 'Dot Matrix Printer', 200.00),
(31, 'Slide Projector', 250.00),
(32, 'Camcorder', 400.00),
(33, 'Floppy Disk Drive', 40.00),
(34, 'Cassette Player', 35.00),
(35, 'Typewriter', 180.00),
(36, 'Analog Camera', 220.00),
(37, 'Game Boy', 120.00),
(38, 'Handheld PDA', 175.00),
(39, 'Walkie Talkie', 90.00),
(40, 'Portable CD Player', 55.00);
select *from Products_Discontinued

SELECT ProductName FROM Products  
UNION  
SELECT ProductName FROM Products_Discontinued;

--Write a query to find the intersection of Products and Products_Discontinued tables using INTERSECT.
select *from products
intersect
select*from Products_Discontinued


--Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(50),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    PostalCode VARCHAR(20)
);
-- Insert 40 Rows into Customers Table
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address, City, State, PostalCode) VALUES
(1, 'John', 'Doe', 'johndoe@example.com', '555-1234', '123 Elm St', 'New York', 'NY', '10001'),
(2, 'Jane', 'Smith', 'janesmith@example.com', '555-2345', '456 Oak St', 'Los Angeles', 'CA', '90001'),
(3, 'Alice', 'Johnson', 'alicej@example.com', '555-3456', '789 Pine St', 'Chicago', 'IL', '60601'),
(4, 'Bob', 'Brown', 'bobbrown@example.com', '555-4567', '101 Maple St', 'Houston', 'TX', '77001'),
(5, 'Charlie', 'Davis', 'charliedavis@example.com', '555-5678', '202 Birch St', 'Phoenix', 'AZ', '85001'),
(6, 'David', 'Martinez', 'davidm@example.com', '555-6789', '303 Cedar St', 'San Diego', 'CA', '92101'),
(7, 'Emily', 'Garcia', 'emilyg@example.com', '555-7890', '404 Redwood St', 'Dallas', 'TX', '75201'),
(8, 'Frank', 'Hernandez', 'frankh@example.com', '555-8901', '505 Willow St', 'Austin', 'TX', '73301'),
(9, 'Grace', 'Lopez', 'gracel@example.com', '555-9012', '606 Aspen St', 'Miami', 'FL', '33101'),
(10, 'Helen', 'Gonzalez', 'heleng@example.com', '555-0123', '707 Fir St', 'San Francisco', 'CA', '94101'),
(11, 'Irene', 'Perez', 'irenep@example.com', '555-1234', '808 Maple Ave', 'Seattle', 'WA', '98101'),
(12, 'Jack', 'Wilson', 'jackw@example.com', '555-2345', '909 Oak Ave', 'Denver', 'CO', '80201'),
(13, 'Kim', 'Anderson', 'kima@example.com', '555-3456', '111 Pine Ave', 'Boston', 'MA', '02101'),
(14, 'Liam', 'Thomas', 'liamt@example.com', '555-4567', '222 Cedar Ave', 'Atlanta', 'GA', '30301'),
(15, 'Megan', 'Taylor', 'megant@example.com', '555-5678', '333 Redwood Ave', 'Washington', 'DC', '20001'),
(16, 'Nathan', 'Moore', 'nathanm@example.com', '555-6789', '444 Willow Ave', 'Detroit', 'MI', '48201'),
(17, 'Olivia', 'Jackson', 'oliviaj@example.com', '555-7890', '555 Birch Ave', 'Portland', 'OR', '97201'),
(18, 'Paul', 'White', 'paulw@example.com', '555-8901', '666 Maple Blvd', 'Minneapolis', 'MN', '55101'),
(19, 'Quincy', 'Lee', 'quincyl@example.com', '555-9012', '777 Oak Blvd', 'Charlotte', 'NC', '28201'),
(20, 'Rachel', 'Harris', 'rachelh@example.com', '555-0123', '888 Pine Blvd', 'Las Vegas', 'NV', '89101'),
(21, 'Sam', 'Clark', 'samc@example.com', '555-1234', '999 Cedar Blvd', 'Orlando', 'FL', '32801'),
(22, 'Tina', 'Allen', 'tinaallen@example.com', '555-2345', '1010 Redwood Blvd', 'New Orleans', 'LA', '70112'),
(23, 'Ursula', 'Scott', 'ursulas@example.com', '555-3456', '1111 Willow Blvd', 'Tampa', 'FL', '33601'),
(24, 'Victor', 'Adams', 'victora@example.com', '555-4567', '1212 Birch Blvd', 'Cleveland', 'OH', '44101'),
(25, 'Walter', 'Baker', 'walterb@example.com', '555-5678', '1313 Oak Blvd', 'Columbus', 'OH', '43201'),
(26, 'Xander', 'Nelson', 'xandern@example.com', '555-6789', '1414 Cedar Blvd', 'Indianapolis', 'IN', '46201'),
(27, 'Yvonne', 'Carter', 'yvonnec@example.com', '555-7890', '1515 Maple Dr', 'Kansas City', 'MO', '64101'),
(28, 'Zane', 'Mitchell', 'zanem@example.com', '555-8901', '1616 Redwood Dr', 'Salt Lake City', 'UT', '84101'),
(29, 'Anna', 'Roberts', 'annar@example.com', '555-9012', '1717 Willow Dr', 'Birmingham', 'AL', '35203'),
(30, 'Ben', 'King', 'benk@example.com', '555-0123', '1818 Birch Dr', 'Nashville', 'TN', '37201'),
(31, 'Chloe', 'Green', 'chloeg@example.com', '555-1234', '1919 Oak Dr', 'Boulder', 'CO', '80301'),
(32, 'Daniel', 'Evans', 'daniele@example.com', '555-2345', '2020 Cedar Dr', 'Sacramento', 'CA', '94201'),
(33, 'Ella', 'Collins', 'ellac@example.com', '555-3456', '2121 Redwood Dr', 'Louisville', 'KY', '40202'),
(34, 'Finn', 'Morris', 'finnm@example.com', '555-4567', '2222 Willow St', 'Cincinnati', 'OH', '45202'),
(35, 'Grace', 'Lee', 'gracel@example.com', '555-5678', '2323 Birch St', 'Baltimore', 'MD', '21201'),
(36, 'Holly', 'Martinez', 'hollym@example.com', '555-6789', '2424 Oak St', 'St. Louis', 'MO', '63101'),
(37, 'Ian', 'Robinson', 'ianr@example.com', '555-7890', '2525 Cedar St', 'Fort Worth', 'TX', '76101'),
(38, 'Jasmine', 'Walker', 'jasminew@example.com', '555-8901', '2626 Redwood St', 'Raleigh', 'NC', '27601'),
(39, 'Kyle', 'Young', 'kyley@example.com', '555-9012', '2727 Willow St', 'Pittsburgh', 'PA', '15201'),
(40, 'Liam', 'Harris', 'liamh@example.com', '555-0123', '2828 Birch St', 'Richmond', 'VA', '23220');


--Use UNION ALL to combine two tables, Products and Orders, that have the same structure.

--Write a query to select distinct customer names (CustomerName) 
--and their corresponding Country using SELECT DISTINCT.

SELECT CONCAT(FirstName, ' ', LastName) AS CustomerName
FROM Customers;
SELECT DISTINCT concat(FirstName, LastName) as CustomerName, City  
FROM Customers;

--Write a query that uses CASE to create a conditional column 
--that displays 'High' if Price > 100, and 'Low' if Price <= 100.

select
price ,
case
    when price <= 100.00 then 'Low'
		Else 'High'
	End 
from Products_Discontinued

--Write a query to filter Employees by Department and group them by Country.
select  * from employees
select *from departments
select *from countries

select  department_id from employees
group by DEPARTMENT_id

--Use GROUP BY to find the number of products (ProductID) in each Category.
select category, productID from Products
group by Category

--Use IIF to create a column that shows 'Yes' if Stock > 100, and 'No' otherwise.
select 
stockQuantity,
IIF(stockQuantity>100, 'Yes','No') 
from Products


--Medium tasks
--Write a query that joins the Orders and Customers 
--tables using INNER JOIN and aliases the CustomerName as ClientName.
--SELECT o.OrderID, c.CustomerName AS ClientName, o.OrderDate  
FROM Orders o  
--INNER JOIN Customers c ON o.CustomerID = c.CustomerID;

--select *from orders as o    --таблицага ном берилади киска ном берса болади with as or without as
--join customer as c on o.customer_id = c.customer_id

--select o.ord_no, o.purch_amt, o.ord_date, c.cust_name from orders o
--join customer c on o.customer_id = c.customer_id

select customer_id as ClientID from orders as o
inner join Customers c on o.customer_id = c.customerID;   --notunderstandable


--Use UNION to combine results from two queries that select 
--ProductName from Products and ProductName from OutOfStock tables.  --OutofStock is not exist
select productName from Products
union 
select ProductName from Products_Discontinued

--Write a query that returns the difference between the Products and DiscontinuedProducts tables using EXCEPT.
select ProductName from Products
except 
select ProductName from Products_Discontinued

--Write a query that uses CASE to assign a value of 'Eligible' to 
--customers who have placed more than 5 orders, otherwise 'Not Eligible'.
Create Orders2 Table
CREATE TABLE Orders2 (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    Quantity INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
6. Insert 40 Rows into Orders Table
INSERT INTO Orders2 (OrderID, CustomerID, ProductID, OrderDate, Quantity) VALUES
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


SELECT OrderID, customerID,     --not successful 
       CASE  
           WHEN sum(Quantity) > 5 THEN 'Eligible'  
           ELSE 'Not Eligible'  
       END AS EligibilityStatus  
FROM Orders2 
GROUP BY customerID;

--Create a conditional column using IIF that shows 'Expensive' if 
--the Price is greater than 100, and 'Affordable' if less.
select 
price,
IIF(price >= 100, 'Expensive', 'Affordable')
from Products

--Write a query that uses GROUP BY to count the number of orders per CustomerID in the Orders table.

SELECT CustomerID, COUNT(OrderID) AS OrderCount  
FROM Orders2  
GROUP BY CustomerID;

--Write a query to find employees in the Employees table who have either Age < 25 or Salary > 6000.

SELECT *  
FROM Employees  
WHERE Age < 25 OR Salary > 6000;    ---Age column is not exist

--Use GROUP BY to find the total sales (SalesAmount) per Region in the Sales table.
SELECT CustomerID, SUM(SaleAmount) AS TotalSales  
FROM Sales  
GROUP BY CustomerID;

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    SaleDate DATE,
    SaleAmount DECIMAL(10, 2)
);

2. Insert 40 Rows into Sales Table
sql

INSERT INTO Sales (SaleID, ProductID, CustomerID, SaleDate, SaleAmount) VALUES
(1, 1, 1, '2023-01-01', 150.00),
(2, 2, 2, '2023-01-02', 200.00),
(3, 3, 3, '2023-01-03', 250.00),
(4, 4, 4, '2023-01-04', 300.00),
(5, 5, 5, '2023-01-05', 350.00),
(6, 6, 6, '2023-01-06', 400.00),
(7, 7, 7, '2023-01-07', 450.00),
(8, 8, 8, '2023-01-08', 500.00),
(9, 9, 9, '2023-01-09', 550.00),
(10, 10, 10, '2023-01-10', 600.00),
(11, 1, 1, '2023-01-11', 150.00),
(12, 2, 2, '2023-01-12', 200.00),
(13, 3, 3, '2023-01-13', 250.00),
(14, 4, 4, '2023-01-14', 300.00),
(15, 5, 5, '2023-01-15', 350.00),
(16, 6, 6, '2023-01-16', 400.00),
(17, 7, 7, '2023-01-17', 450.00),
(18, 8, 8, '2023-01-18', 500.00),
(19, 9, 9, '2023-01-19', 550.00),
(20, 10, 10, '2023-01-20', 600.00),
(21, 1, 2, '2023-01-21', 150.00),
(22, 2, 3, '2023-01-22', 200.00),
(23, 3, 4, '2023-01-23', 250.00),
(24, 4, 5, '2023-01-24', 300.00),
(25, 5, 6, '2023-01-25', 350.00),
(26, 6, 7, '2023-01-26', 400.00),
(27, 7, 8, '2023-01-27', 450.00),
(28, 8, 9, '2023-01-28', 500.00),
(29, 9, 10, '2023-01-29', 550.00),
(30, 10, 1, '2023-01-30', 600.00),
(31, 1, 2, '2023-02-01', 150.00),
(32, 2, 3, '2023-02-02', 200.00),
(33, 3, 4, '2023-02-03', 250.00),
(34, 4, 5, '2023-02-04', 300.00),
(35, 5, 6, '2023-02-05', 350.00),
(36, 6, 7, '2023-02-06', 400.00),
(37, 7, 8, '2023-02-07', 450.00),
(38, 8, 9, '2023-02-08', 500.00),
(39, 9, 10, '2023-02-09', 550.00),
(40, 10, 1, '2023-02-10', 600.00);

--Write a query that combines data from the Customers 
--and Orders tables using LEFT JOIN, and create an alias for OrderDate.

SELECT c.CustomerID, c.FirstName, o.OrderID, o.OrderDate AS Order_Date  
FROM Customers c  
LEFT JOIN Orders2 o ON c.CustomerID = o.CustomerID;

SELECT CONCAT(Firstname, ' ', LastName) AS CustomerName
FROM Customers;

--10. Use IF statement to update the salary of an employee based on 
--their department, increase by 10% if they work in 'HR'.

SELECT 
    e.DepartmentName, 
    m.Salary, 
    IIF(e.DepartmentName = 'HR', m.Salary * 1.1, m.Salary) AS Price  
FROM EmployeeDepartments e  
JOIN Employees2 m ON e.EmployeeID = m.EmployeeID;

Create EmployeeDepartments Table
CREATE TABLE EmployeeDepartments (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    DepartmentName VARCHAR(100)
);
8. Insert 40 Rows into EmployeeDepartments Table
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


Create Employees Table
CREATE TABLE Employees2 (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    HireDate DATE
);
2. Insert 40 Rows into Employees Table
INSERT INTO Employees2 (EmployeeID, Name, DepartmentID, Salary, HireDate) VALUES
(1, 'John Doe', 1, 55000.00, '2020-01-01'),
(2, 'Jane Smith', 2, 65000.00, '2019-03-15'),
(3, 'Mary Johnson', 3, 45000.00, '2021-05-10'),
(4, 'James Brown', 1, 60000.00, '2018-07-22'),
(5, 'Patricia Davis', 4, 70000.00, '2017-08-30'),
(6, 'Michael Miller', 2, 75000.00, '2020-12-12'),
(7, 'Linda Wilson', 3, 48000.00, '2016-11-02'),
(8, 'David Moore', 4, 85000.00, '2021-09-01'),
(9, 'Elizabeth Taylor', 1, 60000.00, '2019-05-18'),
(10, 'William Anderson', 2, 64000.00, '2020-04-10'),
(11, 'Susan Thomas', 3, 47000.00, '2017-01-25'),
(12, 'Joseph Jackson', 4, 78000.00, '2016-09-30'),
(13, 'Karen White', 1, 59000.00, '2018-06-10'),
(14, 'Steven Harris', 2, 71000.00, '2021-07-15'),
(15, 'Nancy Clark', 3, 45000.00, '2020-02-20'),
(16, 'George Lewis', 4, 80000.00, '2019-11-10'),
(17, 'Betty Lee', 1, 55000.00, '2017-04-05'),
(18, 'Samuel Walker', 2, 72000.00, '2021-03-22'),
(19, 'Helen Hall', 3, 49000.00, '2018-10-16'),
(20, 'Charles Allen', 4, 90000.00, '2015-08-11'),
(21, 'Betty Young', 1, 53000.00, '2020-05-17'),
(22, 'Frank King', 2, 67000.00, '2021-02-02'),
(23, 'Deborah Scott', 3, 47000.00, '2019-07-09'),
(24, 'Matthew Green', 4, 76000.00, '2021-01-15'),
(25, 'Sandra Adams', 1, 54000.00, '2020-06-21'),
(26, 'Paul Nelson', 2, 71000.00, '2018-12-03'),
(27, 'Margaret Carter', 3, 46000.00, '2020-08-19'),
(28, 'Anthony Mitchell', 4, 82000.00, '2021-04-10'),
(29, 'Lisa Perez', 1, 60000.00, '2021-03-05'),
(30, 'Christopher Roberts', 2, 69000.00, '2019-09-24'),
(31, 'Jessica Gonzalez', 3, 47000.00, '2017-12-13'),
(32, 'Brian Moore', 4, 85000.00, '2018-11-05'),
(33, 'Dorothy Evans', 1, 59000.00, '2019-06-11'),
(34, 'Matthew Carter', 2, 70000.00, '2020-01-29'),
(35, 'Rachel Martinez', 3, 51000.00, '2021-06-06'),
(36, 'Daniel Perez', 4, 83000.00, '2021-07-01'),
(37, 'Catherine Roberts', 1, 60000.00, '2020-09-19'),
(38, 'Ronald Murphy', 2, 68000.00, '2017-02-04'),
(39, 'Angela Jenkins', 3, 52000.00, '2018-04-23'),
(40, 'Gary Wright', 4, 87000.00, '2021-01-10');
select *from Employees2

Create EmployeeRoles Table
CREATE TABLE EmployeeRoles (
    RoleID INT PRIMARY KEY,
    RoleName VARCHAR(100),
    EmployeeID INT,
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    StartDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
2. Insert 40 Rows into EmployeeRoles Table
INSERT INTO EmployeeRoles (RoleID, RoleName, EmployeeID, DepartmentID, Salary, StartDate) VALUES
(1, 'Manager', 1, 1, 75000.00, '2018-01-01'),
(2, 'Developer', 2, 2, 60000.00, '2019-02-01'),
(3, 'Analyst', 3, 3, 55000.00, '2020-03-15'),
(4, 'HR Specialist', 4, 4, 50000.00, '2021-04-10'),
(5, 'Designer', 5, 2, 65000.00, '2017-06-05'),
(6, 'Tester', 6, 3, 45000.00, '2022-07-20'),
(7, 'Developer', 7, 2, 60000.00, '2018-11-15'),
(8, 'Manager', 8, 1, 80000.00, '2016-01-01'),
(9, 'HR Specialist', 9, 4, 47000.00, '2021-08-30'),
(10, 'Analyst', 10, 3, 55000.00, '2020-05-20'),
(11, 'Developer', 11, 2, 63000.00, '2019-03-10'),
(12, 'Manager', 12, 1, 78000.00, '2017-02-01'),
(13, 'Tester', 13, 3, 46000.00, '2020-06-15'),
(14, 'HR Specialist', 14, 4, 50000.00, '2021-07-01'),
(15, 'Developer', 15, 2, 62000.00, '2019-09-10'),
(16, 'Analyst', 16, 3, 54000.00, '2020-10-20'),
(17, 'Manager', 17, 1, 81000.00, '2015-01-01'),
(18, 'Designer', 18, 2, 66000.00, '2018-05-05'),
(19, 'Developer', 19, 2, 61000.00, '2021-06-01'),
(20, 'HR Specialist', 20, 4, 49000.00, '2022-04-15'),
(21, 'Tester', 21, 3, 46000.00, '2022-01-10'),
(22, 'Developer', 22, 2, 63000.00, '2019-11-15'),
(23, 'Manager', 23, 1, 76000.00, '2017-01-10'),
(24, 'HR Specialist', 24, 4, 51000.00, '2021-03-25'),
(25, 'Analyst', 25, 3, 56000.00, '2020-02-15'),
(26, 'Developer', 26, 2, 59000.00, '2019-07-15'),
(27, 'Tester', 27, 3, 47000.00, '2021-12-01'),
(28, 'Manager', 28, 1, 82000.00, '2016-06-05'),
(29, 'Developer', 29, 2, 62000.00, '2019-02-10'),
(30, 'Analyst', 30, 3, 54000.00, '2020-11-01'),
(31, 'HR Specialist', 31, 4, 48000.00, '2021-09-25'),
(32, 'Developer', 32, 2, 65000.00, '2020-04-15'),
(33, 'Manager', 33, 1, 77000.00, '2018-10-05'),
(34, 'Analyst', 34, 3, 53000.00, '2020-09-10'),
(35, 'Tester', 35, 3, 45000.00, '2022-02-01'),
(36, 'Developer', 36, 2, 62000.00, '2020-07-10'),
(37, 'Manager', 37, 1, 78000.00, '2015-11-15'),
(38, 'Designer', 38, 2, 67000.00, '2020-01-01'),
(39, 'HR Specialist', 39, 4, 49000.00, '2021-05-10'),
(40, 'Developer', 40, 2, 65000.00, '2021-12-01');

--1. Write a query that uses UNION ALL to combine two tables, Sales and Returns, and 
--calculate the total sales and returns for each product.
select *from sales
uninon all
select*from returns;

--2.Use INTERSECT to show products that are common between Products and DiscontinuedProducts tables.

select Productname from Products
intersect                   
select ProductName from Products_Discontinued

--3. Write a query that uses CASE to assign 'Top Tier' if TotalSales > 10000, 
--'Mid Tier' if TotalSales BETWEEN 5000 AND 10000, and 'Low Tier' otherwise.
select *from Sales
select salary, 
case 
when salary > 10000 then 'Top tier'
when salary between 5000 and 10000 then 'Mid tier'
else 'Low tier'
end as Salarylevel
from Employees

--4.Write a query that combines multiple conditions using IF and WHILE to iterate over all rows of the 
--Employees table and update their salary based on certain criteria.

--5.Use EXCEPT to find customers who have placed 
--orders but do not have a corresponding record in the Invoices table.

Create Invoices Table
CREATE TABLE Invoices (
    InvoiceID INT PRIMARY KEY,
    CustomerID INT,
    InvoiceDate DATE,
    TotalAmount DECIMAL(10, 2),
    Status VARCHAR(50)
);
2. Insert 40 Rows into Invoices Table
INSERT INTO Invoices (InvoiceID, CustomerID, InvoiceDate, TotalAmount, Status) VALUES
(1, 1, '2025-01-01', 500.00, 'Paid'),
(2, 2, '2025-01-03', 700.00, 'Pending'),
(3, 3, '2025-01-10', 300.00, 'Paid'),
(4, 4, '2025-01-15', 400.00, 'Overdue'),
(5, 5, '2025-01-18', 600.00, 'Paid'),
(6, 6, '2025-01-20', 800.00, 'Pending'),
(7, 7, '2025-02-01', 200.00, 'Paid'),
(8, 8, '2025-02-05', 350.00, 'Pending'),
(9, 9, '2025-02-07', 450.00, 'Paid'),
(10, 10, '2025-02-10', 550.00, 'Pending'),
(11, 11, '2025-02-15', 650.00, 'Overdue'),
(12, 12, '2025-02-20', 750.00, 'Paid'),
(13, 13, '2025-03-01', 900.00, 'Paid'),
(14, 14, '2025-03-05', 1000.00, 'Pending'),
(15, 15, '2025-03-10', 1200.00, 'Paid'),
(16, 16, '2025-03-12', 1500.00, 'Overdue'),
(17, 17, '2025-03-15', 1800.00, 'Paid'),
(18, 18, '2025-03-20', 2500.00, 'Pending'),
(19, 19, '2025-04-01', 3000.00, 'Paid'),
(20, 20, '2025-04-03', 3500.00, 'Pending'),
(21, 21, '2025-04-05', 4000.00, 'Overdue'),
(22, 22, '2025-04-08', 4500.00, 'Paid'),
(23, 23, '2025-04-10', 5000.00, 'Pending'),
(24, 24, '2025-04-12', 5500.00, 'Paid'),
(25, 25, '2025-04-15', 6000.00, 'Overdue'),
(26, 26, '2025-04-20', 6500.00, 'Paid'),
(27, 27, '2025-05-01', 7000.00, 'Pending'),
(28, 28, '2025-05-03', 7500.00, 'Paid'),
(29, 29, '2025-05-07', 8000.00, 'Pending'),
(30, 30, '2025-05-10', 8500.00, 'Paid'),
(31, 31, '2025-05-12', 9000.00, 'Overdue'),
(32, 32, '2025-05-15', 9500.00, 'Paid'),
(33, 33, '2025-05-18', 10000.00, 'Pending'),
(34, 34, '2025-06-01', 10500.00, 'Paid'),
(35, 35, '2025-06-03', 11000.00, 'Pending'),
(36, 36, '2025-06-05', 11500.00, 'Paid'),
(37, 37, '2025-06-07', 12000.00, 'Overdue'),
(38, 38, '2025-06-10', 12500.00, 'Paid'),
(39, 39, '2025-06-12', 13000.00, 'Pending'),
(40, 40, '2025-06-15', 13500.00, 'Paid');

select CustomerID from Orders2  
except
select CustomerID from Invoices

--6.Write a query that uses GROUP BY on three columns: 
--CustomerID, ProductID, and Region, and calculates the total sales.
SELECT 
    CustomerID, 
    ProductID, 
    Region, 
    SUM(TotalSales) AS TotalSalesSum
FROM SalesTable
GROUP BY CustomerID, ProductID, Region;

CREATE TABLE Customers2 (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(100),
    LoyaltyStatus VARCHAR(50)
);

-- Insert 40 rows into Customers
INSERT INTO Customers2 VALUES
(1, 'Alice', 'New York', 'Gold'),
(2, 'Bob', 'California', 'Silver'),
(3, 'Charlie', 'Texas', 'Gold'),
(4, 'David', 'Florida', 'Platinum'),
(5, 'Eve', 'California', 'Gold'),
(6, 'Frank', 'Texas', 'Silver'),
(7, 'Grace', 'New York', 'Platinum'),
(8, 'Helen', 'Florida', 'Gold'),
(9, 'Ivan', 'California', 'Silver'),
(10, 'Jack', 'New York', 'Gold'),
(11, 'Kathy', 'Texas', 'Gold'),
(12, 'Leo', 'California', 'Platinum'),
(13, 'Mona', 'New York', 'Silver'),
(14, 'Nina', 'Florida', 'Gold'),
(15, 'Oscar', 'California', 'Silver'),
(16, 'Paul', 'Texas', 'Gold'),
(17, 'Quincy', 'New York', 'Platinum'),
(18, 'Rachel', 'Florida', 'Silver'),
(19, 'Sam', 'California', 'Gold'),
(20, 'Tom', 'Texas', 'Platinum'),
(21, 'Uma', 'New York', 'Gold'),
(22, 'Vera', 'California', 'Platinum'),
(23, 'Walter', 'Florida', 'Silver'),
(24, 'Xander', 'Texas', 'Gold'),
(25, 'Yara', 'New York', 'Silver'),
(26, 'Zoe', 'California', 'Platinum'),
(27, 'Aaron', 'Texas', 'Gold'),
(28, 'Bella', 'Florida', 'Platinum'),
(29, 'Caleb', 'California', 'Silver'),
(30, 'Diana', 'Texas', 'Gold'),
(31, 'Eva', 'New York', 'Silver'),
(32, 'Finn', 'Florida', 'Gold'),
(33, 'Gina', 'California', 'Platinum'),
(34, 'Hank', 'Texas', 'Silver'),
(35, 'Ivy', 'New York', 'Gold'),
(36, 'Jason', 'California', 'Silver'),
(37, 'Ken', 'Texas', 'Platinum'),
(38, 'Lia', 'Florida', 'Gold'),
(39, 'Mick', 'New York', 'Platinum'),
(40, 'Noah', 'California', 'Gold');

create table Customer (customer_id int, cust_name varchar(25), city varchar(25), grade int, salesman_id int)
iNSERT INTO Customer values
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan', 'London', null , 5001);
select * from Customer

create table nobel_win1 (year int, subject varchar(25), winner varchar(50), country varchar(50), category varchar(20))
iNSERT INTO nobel_win1 values
(1970, 'Physics', 'Hannes Alfven', 'Sweden', 'Scientist'),
(1970, 'Physics', 'Louis Neel', 'France', 'Scientist'),
(1970, 'Chemistry', 'Luis Federico Leloir', 'France', 'Scientist'),
(1970, 'Physiology', 'Ulf von Euler ', 'Sweden', 'Scientist'),
(1970, 'Physiology', 'Bernard Katz', 'Germany', 'Scientist'),
(1970, 'Physiology', 'Aleksandr Solzhenitsyn', ' Russia', 'Linguist'),
(1970, 'Economics ', 'Paul Samuelson', 'USA', 'Economist'),
(1970, 'Physiology', 'Julius Axelrod', 'USA', 'Scientist'),
(1971, 'Physics', 'Dennis Gabor', 'Hungary', 'Scientist');
select * from nobel_win1

create table Orders (ord_no int, purch_amt float, ord_date date, customer_id int, salesman_id int)
iNSERT INTO Orders values
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3001, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27',3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002);
select * from Orders

--Display All Salespeople
CREATE DATABASE HW_Lesson2

CREATE TABLE Salesman1 (ID INT, Name VARCHAR(8000))

INSERT INTO Salesman1 VALUES 
(5001, 'James Hoog', 'New York', '0.15'), 
(5002, 'Nail Knite', 'Paris', '0.13'), 
(5005, 'Pit Alex', 'London', '0.11'),
(5006, 'Mc  Lyon', 'Paris', '0.14'),
(5007, 'Paul Adam', 'Rome', '0.13'), 
(5003, 'Lauson Hen', 'San Jose', '0.12');
SELECT * FROM Salesman1
ALter Table Salesman1
Add City varchar(50);
ALter Table Salesman1
Add Comission varchar(50);

create table item_mast (pro_id int, pro_name varchar(25), pro_price decimal(10,2), pro_com int)
iNSERT INTO item_mast values
(101, 'Mother Board', 3200.00, 15),
(102, 'Key Board', 3200.00, 15),
(103, 'ZIP drive', 3200.00, 15),
(104, 'Speaker', 3200.00, 15),
(105, ' Monitor', 3200.00, 15),
(106, 'DVD drive', 3200.00, 15),
(107, 'CD drive', 3200.00, 15),
(108, 'Printer', 3200.00, 15),
(109, 'Refill cartridge', 3200.00, 15),
(110, 'Mouse ', 3200.00, 15)
select * from item_mast

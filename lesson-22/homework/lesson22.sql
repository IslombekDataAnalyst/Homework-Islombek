--Window Functions
--Built-in Window Functions
--Aggregated Window Functions --Windowed Aggregate Functions

--Built-in Window Functions
--1. Rank Functions
--2. Value Functions

CREATE DATABASE LESSON22


CREATE TABLE transactions (
    transactiondate DATE,
    amount DECIMAL(10, 2)
);

--INSERT INTO transactions (transactiondate, amount) VALUES
--('2018-01-01', 120),
--('2018-02-01', 90),
--('2018-03-01', 110),
--('2018-04-01', 80);

--SELECT * FROM transactions


----('2018-01-01', 100)	100	
----('2018-02-01', 90),	190
----('2018-03-01', 110),	300
----('2018-04-01', 80);	380

--SELECT *,
--(SELECT SUM(amount) FROM transactions AS INS WHERE INS.transactiondate <= OUTS.transactiondate) 
--FROM transactions AS OUTS


--Window Functions
--Row_Number

--ORDER BY
SELECT * FROM transactions
ORDER BY AMOUNT DESC
--SELECT MAX(AMOUNT) FROM transactions WHERE amount < (SELECT MAX(AMOUNT) FROM transactions)

SELECT *,
ROW_NUMBER() OVER (ORDER BY AMOUNT DESC) AS RN_DESC,
ROW_NUMBER() OVER (ORDER BY AMOUNT ASC) AS RN_ASC
--ROW_NUMBER() OVER () AS RN_ASC 
FROM transactions


SELECT *,
--ROW_NUMBER() OVER (ORDER BY TRANSACTIONDATE) WITH_TRAN_DATE,
ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) 
FROM transactions

--PARTITION BY

--WINDOW_FUNCTION_NAME() OVER ([PARTITION BY] ORDER BY)				--SYNTAX

SELECT *,ROW_NUMBER() OVER (PARTITION BY TRANSACTIONDATE ORDER BY AMOUNT) RN_ASC
--ROW_NUMBER() OVER (PARTITION BY TRANSACTIONDATE ORDER BY AMOUNT DESC) RN_DESC
FROM transactions OUTS

--PARTITION BY = GROUP BY


--DENSE_RANK
SELECT *,ROW_NUMBER() OVER (PARTITION BY TRANSACTIONDATE ORDER BY AMOUNT) AS ROW_NUM,
DENSE_RANK() OVER (PARTITION BY TRANSACTIONDATE ORDER BY AMOUNT) AS DENS_RANK

FROM transactions
ORDER BY transactiondate


SELECT *,ROW_NUMBER() OVER (ORDER BY AMOUNT) AS ROW_NUM,
DENSE_RANK() OVER (ORDER BY AMOUNT) AS DENS_RANK
FROM transactions

--RANK


SELECT *,ROW_NUMBER() OVER (ORDER BY AMOUNT) AS ROW_NUM,

DENSE_RANK() OVER (ORDER BY AMOUNT) AS DENS_RANK,

RANK() OVER (ORDER BY AMOUNT) AS RAANK FROM transactions
ORDER BY amount

CREATE TABLE COMPETETION (STUDENT_ID INT, SCORE INT,END_DATE DATETIME)

INSERT INTO COMPETETION  VALUES 
(11, 100, '2025-04-20 15:15:00'),
(2, 95, '2025-04-20 15:03:00'),
(3, 95, '2025-04-20 15:08:00'),
(4, 90, '2025-04-20 14:50:00'),
(5, 90, '2025-04-20 15:03:00'),
(6, 85, '2025-04-20 15:01:00'),
(7, 80, '2025-04-20 14:55:00'),
(8, 80, '2025-04-20 15:03:00'),
(9, 75, '2025-04-20 14:45:00')


SELECT *,RANK() OVER (ORDER BY SCORE DESC,END_DATE) FROM COMPETETION


--1 --20-25
--2	--15-18
--3	13


--N_TILE

SELECT *,NTILE(5) OVER (ORDER BY (SELECT NULL)) N_TILE FROM COMPETETION

;WITH CTE AS(
SELECT NTILE(7) OVER (ORDER BY ORDERID) N_TILE,* FROM TSQL2012.SALES.Orders
)
SELECT N_TILE,COUNT(*) AS CNT
FROM CTE
GROUP BY N_TILE


--ROW_NUMBER
--DENSE_RANK
--RANK
--NTILE
--PARTITION BY


--VALUE WINDOW FUNCTION

--FIRST_VALUE

--LAST_VALUE
CREATE TABLE daily_sales (
    sales_date DATE,
    sales_amount DECIMAL(10, 2)
);


INSERT INTO daily_sales (sales_date, sales_amount)
VALUES 
('2024-09-25', 1000.00),
('2024-09-26', 1500.00),
('2024-09-27', 1200.00),
('2024-09-28', 1800.00),
('2024-09-29', 1300.00);


SELECT *,FIRST_VALUE(STUDENT_ID) OVER (PARTITION BY SCORE ORDER BY SCORE DESC,END_DATE) FROM COMPETETION

SELECT *,FIRST_VALUE(END_DATE) OVER (PARTITION BY SCORE ORDER BY SCORE DESC,END_DATE) AS FIRST_SUB FROM COMPETETION

SELECT *,
LAST_VALUE(STUDENT_ID) OVER (PARTITION BY SCORE ORDER BY SCORE DESC,END_DATE DESC) AS LAST_VAL
FROM COMPETETION




SELECT *,
FIRST_VALUE(STUDENT_ID) OVER (PARTITION BY SCORE ORDER BY SCORE DESC,END_DATE) AS FIRST_VAL
FROM COMPETETION


SELECT *,
LAST_VALUE(STUDENT_ID) OVER (PARTITION BY SCORE ORDER BY SCORE DESC) AS LAST_VAL
FROM COMPETETION



SELECT * FROM COMPETETION
ORDER BY SCORE DESC,END_DATE





--LAG

--LAG(COL_NAME, HOW_MANY_ROWS, [IFNULL])
SELECT *,LAG(sales_amount,2,sales_amount) OVER (ORDER BY SALES_DATE) AS PREV_SALES,
SALES_AMOUNT - LAG(sales_amount,2,sales_amount) OVER (ORDER BY SALES_DATE) AS DIFF 

FROM daily_sales


SELECT *,LAG(sales_amount,1,0) OVER (ORDER BY SALES_DATE) AS PREV_SALES,
SALES_AMOUNT - LAG(sales_amount,1,0) OVER (ORDER BY SALES_DATE) AS DIFF 

FROM daily_sales

--LEAD

SELECT *,LEAD(sales_amount,1,0) OVER (ORDER BY SALES_DATE DESC) AS NEXT_VAL,
SALES_AMOUNT - LEAD(sales_amount,1,0) OVER (ORDER BY SALES_DATE DESC) AS DIFF 
FROM daily_sales



--NEXT LESSON

--AGGREGATED WINDOW FUNCTIONS

--homework 22 

CREATE TABLE sales_data (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    customer_name VARCHAR(100),
    product_category VARCHAR(50),
    product_name VARCHAR(100),
    quantity_sold INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    order_date DATE,
    region VARCHAR(50)
);

INSERT INTO sales_data VALUES
    (1, 101, 'Alice', 'Electronics', 'Laptop', 1, 1200.00, 1200.00, '2024-01-01', 'North'),
    (2, 102, 'Bob', 'Electronics', 'Phone', 2, 600.00, 1200.00, '2024-01-02', 'South'),
    (3, 103, 'Charlie', 'Clothing', 'T-Shirt', 5, 20.00, 100.00, '2024-01-03', 'East'),
    (4, 104, 'David', 'Furniture', 'Table', 1, 250.00, 250.00, '2024-01-04', 'West'),
    (5, 105, 'Eve', 'Electronics', 'Tablet', 1, 300.00, 300.00, '2024-01-05', 'North'),
    (6, 106, 'Frank', 'Clothing', 'Jacket', 2, 80.00, 160.00, '2024-01-06', 'South'),
    (7, 107, 'Grace', 'Electronics', 'Headphones', 3, 50.00, 150.00, '2024-01-07', 'East'),
    (8, 108, 'Hank', 'Furniture', 'Chair', 4, 75.00, 300.00, '2024-01-08', 'West'),
    (9, 109, 'Ivy', 'Clothing', 'Jeans', 1, 40.00, 40.00, '2024-01-09', 'North'),
    (10, 110, 'Jack', 'Electronics', 'Laptop', 2, 1200.00, 2400.00, '2024-01-10', 'South'),
    (11, 101, 'Alice', 'Electronics', 'Phone', 1, 600.00, 600.00, '2024-01-11', 'North'),
    (12, 102, 'Bob', 'Furniture', 'Sofa', 1, 500.00, 500.00, '2024-01-12', 'South'),
    (13, 103, 'Charlie', 'Electronics', 'Camera', 1, 400.00, 400.00, '2024-01-13', 'East'),
    (14, 104, 'David', 'Clothing', 'Sweater', 2, 60.00, 120.00, '2024-01-14', 'West'),
    (15, 105, 'Eve', 'Furniture', 'Bed', 1, 800.00, 800.00, '2024-01-15', 'North'),
    (16, 106, 'Frank', 'Electronics', 'Monitor', 1, 200.00, 200.00, '2024-01-16', 'South'),
    (17, 107, 'Grace', 'Clothing', 'Scarf', 3, 25.00, 75.00, '2024-01-17', 'East'),
    (18, 108, 'Hank', 'Furniture', 'Desk', 1, 350.00, 350.00, '2024-01-18', 'West'),
    (19, 109, 'Ivy', 'Electronics', 'Speaker', 2, 100.00, 200.00, '2024-01-19', 'North'),
    (20, 110, 'Jack', 'Clothing', 'Shoes', 1, 90.00, 90.00, '2024-01-20', 'South'),
    (21, 111, 'Kevin', 'Electronics', 'Mouse', 3, 25.00, 75.00, '2024-01-21', 'East'),
    (22, 112, 'Laura', 'Furniture', 'Couch', 1, 700.00, 700.00, '2024-01-22', 'West'),
    (23, 113, 'Mike', 'Clothing', 'Hat', 4, 15.00, 60.00, '2024-01-23', 'North'),
    (24, 114, 'Nancy', 'Electronics', 'Smartwatch', 1, 250.00, 250.00, '2024-01-24', 'South'),
    (25, 115, 'Oscar', 'Furniture', 'Wardrobe', 1, 1000.00, 1000.00, '2024-01-25', 'East')

--1
SELECT 
    sale_id, 
    customer_id, 
    customer_name, 
    product_name, 
    quantity_sold, 
    unit_price, 
    SUM(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS running_total_sales
FROM sales_data
ORDER BY customer_id, order_date;
--2  Подсчитайте количество заказов по каждой товарной категории
SELECT 
    product_category,
    SUM(quantity_sold) AS total_quantity_sold
FROM sales_data
GROUP BY product_category;
--3 Найдите Максимальное общее количество для каждой категории товаров
SELECT 
    product_category,
    MAX(total_amount) AS max_total_amount
FROM sales_data
group by product_category;
--4 Найдите Минимальную цену Товаров для каждой товарной категории
select 
    product_category,
    min(total_amount) as max_total_amount
from sales_data
group by product_category;

--5 Compute the Moving Average of Sales of 3 days (prev day, curr day, next day)
select *,
    avg(total_amount) over( order by order_date rows  between 1 PRECEDING AND 1 FOLLOWING) as MovingAverage
from sales_data
--6 Найдите общий объем продаж по регионам
 select region,sum(total_amount)  as sss  from sales_data
 group by region
 --7 Рассчитайте рейтинг клиентов на основе их общей суммы покупок
select     
	customer_id, 
    customer_name, 
    SUM(total_amount) AS total_spent,
	Rank() over (order by  SUM(total_amount) desc) AS customer_rank
from sales_data
GROUP BY customer_id, customer_name
ORDER BY customer_rank;

--8
SELECT 
    sale_id,
    customer_id,
    customer_name,
    order_date,
    total_amount,
    LAG(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS prev_amount,
    total_amount - LAG(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS diff_amount
FROM sales_data;
--9  Найдите Топ-3 самых дорогих товара в каждой категории
select * from (
select *,    DENSE_RANK() OVER(PARTITION BY product_category ORDER BY total_amount DESC) AS DenseRankNum
 from sales_data) as sss
 where DenseRankNum in (1,2,3)
 --10
 SELECT 
    region,
    order_date,
    total_amount,
    SUM(total_amount) OVER (PARTITION BY region ORDER BY order_date) AS cumulative_sales
FROM 
    sales_data
ORDER BY 
    region, 
    order_date;
--11
SELECT 
    product_category,
    order_date,
    total_amount,
    SUM(total_amount) OVER (PARTITION BY product_category ORDER BY order_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_revenue
FROM sales_data;
--12  Here you need to find out the sum of previous values. Please go through the sample input and expected output.
CREATE TABLE id (
    ID SMALLINT
);
INSERT INTO id VALUES (1), (2), (3), (4), (5);

select  
	ID,
    sum(ID ) over (ORDER BY ID ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS SumPreValues 
from id;
--13 Sum of Previous Values to Current Value
CREATE TABLE OneColumn (
    Value SMALLINT
);
INSERT INTO OneColumn VALUES (10), (20), (30), (40), (100);
select * from OneColumn

SELECT  
    Value,
    Value + COALESCE(LAG(Value) OVER (ORDER BY Value), 0) AS Sum_of_Current_Prev
FROM OneColumn;

--14
CREATE TABLE Row_Nums (
    Id INT,
    Vals VARCHAR(10)
);
INSERT INTO Row_Nums VALUES
(101,'a'), (102,'b'), (102,'c'), (103,'f'), (103,'e'), (103,'q'), (104,'r'), (105,'p');


WITH cte AS (
    SELECT *, 
           DENSE_RANK() OVER (ORDER BY Id) AS group_rank,
           ROW_NUMBER() OVER (PARTITION BY Id ORDER BY Vals) AS rn_in_group
    FROM Row_Nums
)
SELECT 
    Id,
    Vals,
    (group_rank * 2 - 1) + rn_in_group - 1 AS RowNumber
FROM cte
ORDER BY Id, rn_in_group;


--15
SELECT customer_id, customer_name
FROM sales_data
GROUP BY customer_id, customer_name
HAVING COUNT(DISTINCT product_category) > 1;
--16
SELECT customer_id, customer_name, region, SUM(total_amount) AS customer_total
FROM sales_data
GROUP BY customer_id, customer_name, region
HAVING SUM(total_amount) > (
    SELECT AVG(total_amount)
    FROM sales_data s2
    WHERE s2.region = sales_data.region);
--17
SELECT customer_id, customer_name, region, SUM(total_amount) AS total_spent,
       RANK() OVER (PARTITION BY region ORDER BY SUM(total_amount) DESC) AS spending_rank
FROM sales_data
GROUP BY customer_id, customer_name, region;
--18
SELECT customer_id, customer_name, order_date, total_amount,
       SUM(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date 
                               ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_sales
FROM sales_data;
--19
WITH monthly_sales AS (
    SELECT DATEPART(YEAR, order_date) AS year,
           DATEPART(MONTH, order_date) AS month,
           SUM(total_amount) AS monthly_total
    FROM sales_data
    GROUP BY DATEPART(YEAR, order_date), DATEPART(MONTH, order_date)
)
SELECT year, month, monthly_total,
       LAG(monthly_total) OVER (ORDER BY year, month) AS prev_month_total,
       (monthly_total - LAG(monthly_total) OVER (ORDER BY year, month)) * 1.0 
       / NULLIF(LAG(monthly_total) OVER (ORDER BY year, month), 0) AS growth_rate
FROM monthly_sales;
--20
SELECT *
FROM (
    SELECT sale_id, customer_id, customer_name, order_date, total_amount,
           LAG(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS prev_amount
    FROM sales_data
) AS sub
WHERE total_amount > prev_amount;
--21
SELECT product_name, product_category, unit_price
FROM sales_data
WHERE unit_price > (
    SELECT AVG(unit_price) FROM sales_data
);
--22
CREATE TABLE MyData (
    Id INT, Grp INT, Val1 INT, Val2 INT
);
INSERT INTO MyData VALUES
(1,1,30,29), (2,1,19,0), (3,1,11,45), (4,2,0,0), (5,2,100,17);

SELECT 
    Id,
    Grp,
    Val1,
    Val2,
    CASE 
        WHEN ROW_NUMBER() OVER (PARTITION BY Grp ORDER BY Id) = 1 
        THEN SUM(Val1 + Val2) OVER (PARTITION BY Grp) 
        ELSE NULL 
    END AS Tot
FROM MyData;

--23
CREATE TABLE TheSumPuzzle (
    ID INT, Cost INT, Quantity INT
);
INSERT INTO TheSumPuzzle VALUES
(1234,12,164), (1234,13,164), (1235,100,130), (1235,100,135), (1236,12,136);

SELECT 
    ID, 
    SUM(Cost) AS Cost, 
    SUM(DISTINCT Quantity) AS Quantity
FROM TheSumPuzzle
GROUP BY ID;
--24
CREATE TABLE Seats 
( 
SeatNumber INTEGER 
); 

INSERT INTO Seats VALUES 
(7),(13),(14),(15),(27),(28),(29),(30), 
(31),(32),(33),(34),(35),(52),(53),(54); 


--25

create database Lesson6
--Puzzle 1
CREATE TABLE Task1
(
    [A] [int] NULL,
    [B] [int] NULL,
    [C] [int] NULL,
    [D] [int] NULL
)
GO
 
--Insert Data
INSERT INTO Task1 (A,B,C,D)
VALUES 
    (0,0,0,1),
    (0,0,1,0),
    (0,1,0,0),
    (1,0,0,0),
    (0,0,0,0),
    (1,1,1,0)

	select * from Task1 
	--where A <> 0 or B <> 0 or C<>0 or D <>0
	where a+b+c+d <>0
	
	--solutions by mentor
	select * from Task1 
	where A!=0 or B!=0 or C != 0 or D!=0

	select * from Task1 where A+B+C+D > 0
	
	select * from Task1 
	where NOT (A=0 and B=0 and C = 0 and D=0)

	--Puzzle 2
	CREATE TABLE FruitCount
(
    Name VARCHAR(20),
    Fruit VARCHAR(25)
);
	INSERT INTO FruitCount(Name, Fruit) 
VALUES
    ('Neeraj', 'MANGO'),
    ('Neeraj', 'MANGO'),
    ('Neeraj', 'MANGO'),
    ('Neeraj', 'APPLE'),
    ('Neeraj', 'ORANGE'),
    ('Neeraj', 'LICHI'),
    ('Neeraj', 'LICHI'),
    ('Neeraj', 'LICHI'),
    ('Isha', 'MANGO'),
    ('Isha', 'MANGO'),
    ('Isha', 'APPLE'),
    ('Isha', 'ORANGE'),
    ('Isha', 'LICHI'),
    ('Gopal', 'MANGO'),
    ('Gopal', 'MANGO'),
    ('Gopal', 'APPLE'),
    ('Gopal', 'APPLE'),
    ('Gopal', 'APPLE'),
    ('Gopal', 'ORANGE'),
    ('Gopal', 'LICHI'),
    ('Mayank', 'MANGO'),
    ('Mayank', 'MANGO'),
    ('Mayank', 'APPLE'),
    ('Mayank', 'APPLE'),
    ('Mayank', 'ORANGE'),
    ('Mayank', 'LICHI');
	select *from FruitCount
	
	SELECT --Error
    Name,
    Count(CASE WHEN Fruit = 'Mango' ) AS Mango,
    Count(CASE WHEN Fruit = 'Apple' ) AS Apple,
    Count(CASE WHEN Fruit = 'Lichi' ) AS Lichi,
	Count(CASE WHEN Fruit = 'Orange' ) AS Orange
FROM FruitCount
GROUP BY Name;

select name, 
SUM(case Fruit when 'Mango' then 1 Else 0 end) as Mango,
SUM(case Fruit when 'Apple' then 1 Else 0 end) as Apple,
Sum(case Fruit when 'Lichi' then 1 Else 0 end) as Lichi,
Sum(case Fruit when 'Orange' then 1 Else 0 end) as Orange
from FruitCount
group by Name
	
	--Task3

	create table numbers (number int)

insert into numbers values
(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),
(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),
(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),
(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61),(62),
(63),(64),(65),(66),(67),(68),(69),(70),(71),(72),(73),(74),(75),(76),(77),
(78),(79),(80),(81),(82),(83),(84),(85),(86),(87),(88),(89),(90),(91),(92),
(93),(94),(95),(96),(97),(98),(99),(100)
3 fiz
5 baz
3 5 fizbaz
declare @Number int 
set @number = 1

while (@number <= 100)
begin
    if @number % 15 = 0 
	select cast (@number as varchar) , 'FizzBuzz'
    else if @number % 5 = 0 
	select cast (@number as varchar) , 'Buzz'
	else if @number % 3 = 0
	select cast (@number as varchar) , 'Fizz'
	else select cast (@number as int)
	set @number = @number + 1
end
--с помощью case надо попробовать найти решение для этой задачи
select number, 
SUM(case number % 15 when 'Mango' then 1 Else 0 end) as Mango,
SUM(case Fruit when 'Apple' then 1 Else 0 end) as Apple,
Sum(case Fruit when 'Lichi' then 1 Else 0 end) as Lichi,
Sum(case Fruit when 'Orange' then 1 Else 0 end) as Orange
from numbers

--Puzzle 1: Finding Distinct Values
--Question: Explain at least two ways to find distinct values based on two columns.

Sample data:
CREATE TABLE InputTbl (col1 VARCHAR(1), col2 VARCHAR(1))
INSERT INTO InputTbl VALUES 
('a', 'b'),
('a', 'b'),
('b', 'a'),
('c',  'd'),
('c', 'd'),
('m', 'n'),
('n', 'm')
select *from InputTbl
--1.
SELECT col1, col2 FROM InputTbl WHERE col1 < col2
UNION
SELECT col2, col1 FROM InputTbl WHERE col2 < col1;
--2.
SELECT DISTINCT least(col1, col2) AS col1, greatest(col1, col2) AS col2
FROM InputTbl;

--Puzzle 2: Counting 'a' for Different Types
--Question: Count occurrences of 'a' in columns Value1, Value2, and Value3 for different Typs.

Sample Data:
CREATE TABLE GroupbyMultipleColumns ( ID INT, Typ VARCHAR(1), 
Value1 VARCHAR(1), Value2 VARCHAR(1), Value3 VARCHAR(1) );

INSERT INTO GroupbyMultipleColumns(ID, Typ, Value1, Value2, Value3) VALUES 
(1, 'I', 'a', 'b', ''), (2, 'O', 'a', 'd', 'f'), 
(3, 'I', 'd', 'b', ''), 
(4, 'O', 'g', 'l', ''), (5, 'I', 'z', 'g', 'a'), 
(6, 'I', 'z', 'g', 'a');

SELECT Typ, 
       SUM(CASE WHEN Value1 = 'a' THEN 1 ELSE 0 END) +
       SUM(CASE WHEN Value2 = 'a' THEN 1 ELSE 0 END) +
       SUM(CASE WHEN Value3 = 'a' THEN 1 ELSE 0 END) AS a_count
FROM GroupbyMultipleColumns
GROUP BY Typ;

--Puzzle 3: Finding Duplicate Values
--Question: Find values that appear more than once in the table.

Sample Data:
CREATE TABLE TESTDuplicateCount ( ID INT, EmpName VARCHAR(100), EmpDate DATETIME );

INSERT INTO TESTDuplicateCount(ID,EmpName,EmpDate) 
VALUES 
(1,'Pawan','2014-01-05'), (2,'Pawan','2014-03-05'), 
(3,'Pawan','2014-02-05'), (4,'Manisha','2014-07-05'), 
(5,'Sharlee','2014-09-05'), (6,'Barry','2014-02-05'), 
(7,'Jyoti','2014-04-05'), (8,'Jyoti','2014-05-05');

SELECT EmpName, COUNT(*) AS duplicate_count
FROM TESTDuplicateCount
GROUP BY EmpName
HAVING COUNT(*) > 0;

SELECT EmpName, nan
FROM (
    SELECT EmpName, COUNT(EmpName) AS nan
    FROM TESTDuplicateCount
    WHERE EmpName IN ('Pawan', 'Manisha', 'Sharlee', 'Barry', 'Jyoti')
    GROUP BY EmpName
) AS EmpCounts
WHERE nan > 1;

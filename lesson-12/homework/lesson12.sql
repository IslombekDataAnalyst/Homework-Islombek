--String Functions

--American Standard Code for Information Interchange --ASCII
select ASCII('a')
select ASCII('A')
select ascii('hello') -- = ascii ('h')
--Char
select char(77) -- M javobi
select char(99) -- c javobi

--LEN   string uzunligin topib beradi
SELECT LEN('Hello world')
SELECT LEN('     Hello world')  --oldidan kesa hisobga oladi --Leading
SELECT LEN('Hello world                  ')  --orqadan kelsa hisobga olmaydi  --Trailing

select *, len(name) from boys
select len(2452)              --4

--Reverse --teskarisiga aylantirib beradi
select reverse('Hello')

select *, reverse(item) from Cart1
--Space 
select space(10)

--LTRIM  sapcelarni delete qiladi faqat chap tarafdagini

select ltrim('        hello world')

--RTRIM  --o'ng tarafdagi spacelarni o'chiradi

select rtrim('hello world                         ')

RTRIM(LTRIM(COL_NAME)) --HAM CHAP HAM O'NG TARAFDAGI SPACELARNI O'CHIRADI

--TRIM --BOTH SIDES
SELECT TRIM ('    HELLO WORLD        ')



-----LOWER, UPPER
SELECT LOWER('HELLO WORLD')  --hello world  --kichkina harflar bilan yozadi
select upper('hello world')  --HELLO WORLD  --KATTA HARFLAR BILAN YOZIB KETADI

--LEFT (string, char_count)

SELECT LEFT ('hello world', 2) --'he'

--RIGHT (string, char_count)

SELECT RIGHT ('HELLO WORLD', 8) --'LO WORLD'

---Substring (string, start_pos, char_count)

select substring('hello world',2,3) --'ell'
select substring('+998900260994',5,2)  ---'90'

---Concat

select concat('hello', 'world')  --helloworld
select concat ('hello', ' world') --hello world
select concat ('hello', ',', 'world')  --hello,world

select concat('hello', 'world')  --helloworld
select 'hello' + 'world'

select concat(1,1) --11

select 'Sanjar' + null   --null
select concat('Sanjar',null) --Sanjar

--Concat_WS, concat with a delimiter(separator)

select concat_ws(' ','Hello','world', 'This','is', 'SQL', 'Lesson') --Hello world This is SQL Lesson
select concat_ws('|','Hello','world', 'This','is', 'SQL', 'Lesson') --Hello|world|This|is|SQL|Lesson

--Replace (string, value, new_value)
select replace ('Hello world','o','a')  --Hella warld
select replace ('Hello world This is SQL Lesson','this','it') --Hello world it is SQL Lesson  --this ==>> it

' Hello world This is SQL Lesson   '  --9 space
select replace(' Hello world This is SQL Lesson   ',' ','')
select len(' Hello world This is SQL Lesson   '+'a')-1 - len(replace(' Hello world This is SQL Lesson   ',' ',''))  --9

--Stuff (string, start_pos, char_count, new_string)

select stuff ('Hello world This is SQL Lesson',6,3,'bye') --'Hellobyerld This is SQL Lesson'

select stuff ('Hello world This is SQL Lesson',7,5,'bye')  --'Hello bye This is SQL Lesson'

-- CHARINDEX  (char_to_be)_searched, string, [start_posotion]) --BIZ SORAGAN NARSANI Qayerda ekanini topib beradi
select charindex(' ','Hello world')

select left('hello world',charindex(' ','Hello world')) --'hello '

select left('hello world',charindex(' ','Hello world')-1) --'hello'

select charindex ('o','Hello world')  --5
select charindex ('o',reverse('Hello world'))  --4

select charindex ('o','Hello world',6) --8

--Patindex

select patindex ('%[aeuio]%','hello world') --2

select patindex ('%o%','hello world') --5
select patindex ('%wor%','hello world') --7

SELECT * 
FROM [TSQL2012].[Sales].[Customers]
WHERE 
    ContactName LIKE '%a%a%' 
	    OR ContactName NOT LIKE '_%n%';
--yani agar katakda 2 ta nuqta bo'lsa 2 ta nuqtani orasidagi so'z chiqsin aks holda katakning o'zi

create table two_p (ID int, word varchar(50))
insert into two_p values (1,'hello.world.salom'),
       (2,'maab.school.bootcamp'),
       (3,'xorazm.xonqa.navoiy'),
       (4,'sql.server'),
       (5,'Uzbekistan')
select *from two_p
where word like '%.*.%'

SELECT ID, 
       CASE 
           WHEN LEN(word) - LEN(REPLACE(word, '.', '')) = 2 
           THEN PARSENAME(REPLACE(word, '.', ','), 2) 
           ELSE word 
       END AS result
FROM two_p;






--Homewrok12
--task 1
--1
SELECT ASCII('A') AS AsciiValue;
--2
SELECT LEN('Hello World') AS StringLength;
--3
SELECT REVERSE('OpenAI') AS TeskariMatn;
--4
SELECT CONCAT(SPACE(5), 'OpenAI') AS NewString;
--5
select ltrim(' sss') as CleanString
--6
SELECT UPPER('sql') AS UpperCaseString;
--7
SELECT SUBSTRING('Database', 1, 3) AS FirstThreeChars
--8
select REVERSE(SUBSTRING(REVERSE('Technology') , 1 , 4 )) as sss
--9
select SUBSTRING('Programming',3,6) as ExtractedChars
--10 Write a query to concatenate the strings 'SQL' and 'Server' using Concat().
select Concat('SQL',' ','Server') as FullString
--11
SELECT REPLACE('apple pie', 'apple', 'orange') AS UpdatedString;
--12
select charindex('learn', 'Learn SQL with LearnSQL') AS Position
--13 What function can you use to check if the string 'Server' contains 'er' using SQL?
select patindex('%er%','Server')
--14 
SELECT value 
FROM STRING_SPLIT('apple,orange,banana', ',');
--15
select Power(2, 3)
--16
select SQRT(16) as SquareRoot
---17
SELECT GETDATE() AS CurrentDateTime
--18
select getutcdate() as CurrentUTCDateTime
--19
SELECT DAY('2025-02-03') AS DayOfMonth
--20
SELECT DATEADD(DAY, 10, '2025-02-03') AS NewDate;
--task 2 
--1
SELECT CHAR(65) AS Character;
--2
LTRIM() removes spaces from the left (start) of the string.

RTRIM() removes spaces from the right (end) of the string.
--3 Write a query to find the position of the substring 'SQL' in the string 'Learn SQL basics'.
select charindex('SQL','Learn SQL basics') as SubstringPosition
--4  'SQL' and 'Server' 
SELECT CONCAT_WS(' ', 'SQL', 'Server') AS CONCAT
--5 How would you replace the substring 'test' with 'exam' using Stuff()?
SELECT STUFF('test', 1, 5, 'exam') AS ModifiedString;
--6
SELECT POWER(7, 2) AS SquareOf7;
--7
select SUBSTRING('International',1,5)
--8 Database
select right('Database',2)
--9
select  Patindex('%n%', 'Learn SQL')
--10 How do you calculate the difference in days between '2025-01-01' and '2025-02-03' using Datediff()?
select  DATEDIFF(DAY, '2025-01-01', '2025-02-03') AS DaysDifference
--11 , используя .
select Month('2025-02-03') AS MonthNumber
--12 Use DatePart() to extract the year from the date '2025-02-03'.
select  DATEPART(year,  '2025-02-03') AS YearPart
--13 
SELECT CONVERT(TIME, GETDATE()) AS CurrentTime;
--14 What does the function Sysdatetime() return in SQL?
select Sysdatetime() AS CurrentDateTime;
--15 How would you find the next occurrence of 'Wednesday' from today's date using Dateadd()?
SELECT  DATEADD(DAY, DATEPART(WEEKDAY, GETDATE())-1, getdate()) AS SSS
--16 
GETDATE() serverning mahalliy vaqtiga bog‘liq.

GETUTCDATE() esa doim UTC vaqtni qaytaradi, shuning uchun vaqt zonasi ta’sir qilmaydi.
--17
select Abs(-15) AS AbsoluteValue
--18 How would you round the number 4.57 to the nearest whole number using Ceiling()?
select Ceiling(4.57) AS RoundedValue
--19 Write a SQL query to get the current time using Current_Timestamp.
select CURRENT_TIMESTAMP
--20 Use DateName() to return the day name for the date '2025-02-03'.
select DateName(day,'2025-02-03')
--task 3
--1 Write a query to reverse the string 'SQL Server' and then remove the spaces.
select REVERSE(trim('SQL Server')) AS ReversedString
--2 Write a query that uses String_agg() to concatenate all the values in the 'City' column of a table into a single string, separated by commas.
SELECT STRING_AGG(City, ', ') AS CitiesList
FROM Customers
--3
select charindex('SQL' , 'Server')
--4
select Power(5, 3)  AS CubeOf5
--5 Write a query that splits a string 'apple;orange;banana' by the semicolon and returns each word as a separate row.
SELECT value
FROM STRING_SPLIT('apple;orange;banana', ';');
--6 Use Trim() to remove both leading and trailing spaces from the string ' SQL '.
select Trim(' SQL ') AS TrimmedString;
--7
SELECT DATEDIFF(HOUR, '2025-04-01 08:00:00', '2025-04-02 14:30:00') AS HourDifference;
--8 How would you calculate the number of months between '2023-05-01' and '2025-02-03' using Datepart()?
SELECT 
    (DATEPART(YEAR, '2025-02-03') - DATEPART(YEAR, '2023-05-01')) * 12 +
    (DATEPART(MONTH, '2025-02-03') - DATEPART(MONTH, '2023-05-01')) 
    AS MonthDifference

select abs(DATEDIFF(MONTH, '2025-02-03','2023-05-01'))  AS MonthDifference

--9 Write a query to find the position of the substring 'SQL' from the end of the string 'Learn SQL Server' using Reverse() and Charindex().
select Reverse(Charindex('SQL','Learn SQL Server')) Pozitsiya;
--10
SELECT value AS fruit
FROM STRING_SPLIT('apple,orange,banana', ',');
--11
  SELECT DATEDIFF(DAY, '2025-01-01', GETDATE()) AS DaysDifference;
--12
SELECT LEFT('Data Science', 4) AS FirstFourChars;
--13
SELECT CEILING(SQRT(225)) AS RoundedSquareRoot;
--14
SELECT CONCAT_WS('|', 'Hello', 'World') AS ConcatenatedString;
--15
SELECT PATINDEX('%[0-9]%', 'abc123xyz') AS PositionOfFirstDigit;
--16
SELECT CHARINDEX('SQL', 'SQL Server SQL', CHARINDEX('SQL', 'SQL Server SQL') + 1) AS SecondOccurrence;
--17
SELECT DATEPART(YEAR, GETDATE()) AS CurrentYear;
--18
SELECT DATEADD(DAY, -100, GETDATE()) AS NewDate;
--19
SELECT DATENAME(WEEKDAY, '2025-02-03') AS DayOfWeek;
--20
SELECT POWER(5, 2) AS SquareOfNumber;

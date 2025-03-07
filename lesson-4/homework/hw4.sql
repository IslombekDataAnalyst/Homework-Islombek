create table salesman(
salesman_id int,  name  varchar(50),   city varchar(50), commission float
)
      insert into salesman values 
	    (5001 , 'James Hoog' , 'New York', 0.15),
        (5002 , 'Nail Knite' , 'Paris'   , 0.13),
        (5005 , 'Pit Alex' , 'London'  , 0.11),
        (5006 , 'Mc Lyon' , 'Paris'   , 0.14),
        (5007 , 'Paul Adam' , 'Rome'    , 0.13),
        (5003 , 'Lauson Hen' , 'San Jose', 0.12)
		select *from salesman where city = 'Paris' or city = 'Rome'
		select *from salesman where city not in ('Paris', 'Rome')
		--drop table salesman

		select *from dbo.customer where customer_id in (3007,3008,3009)

		select*from salesman where commission between 0.12 and 0.14
		select*from orders where (purch_amt BETWEEN 500 AND 4000) AND NOT purch_amt IN (948.50, 1983.43);

		select*from salesman where name NOT BETWEEN 'A' AND 'L';
		select *from dbo.customer where cust_name LIKE 'B%';

		select *from dbo.customer where cust_name LIKE '%n';

		select*from salesman where name LIKE 'N__l%';

		select *from dbo.customer where grade IS NULL;
		select *from dbo.customer where grade IS not NULL;
		select*from emp_details where EMP_LNAME like 'D%'

		select first_name +''+ last_name AS Full_Name, salary from employees where salary<6000
		select concat (first_name, last_name) AS Full_Name, salary from employees where salary<6000
		
		select first_name, last_name, department_id, salary from employees where salary >8000
		
		select first_name, last_name, department_id from employees where last_name = 'McEwen'

		select *from employees where department_id IS NULL;

		select *from departments where department_name = 'Marketing';

		select first_name +' '+ last_name as Full_Name, hire_date, salary, department_id from employees WHERE first_name NOT LIKE '%M%'
ORDER BY department_id;

SELECT *
 FROM employees
  WHERE salary BETWEEN 8000 AND 12000 
      AND commission_pct IS NOT NULL
       OR  department_id NOT IN (40 , 120 , 70)
          AND   hire_date < '2003-06-05'

		  select first_name +' '+ last_name AS Full_Name, salary from employees where commission_pct IS NULL;

		  SELECT first_name +' '+ last_name AS Full_Name,
       phone_number +''+ email AS Contact_Details,
       salary AS Remuneration from employees
	   WHERE salary BETWEEN 9000 AND 17000;

/*
How does an Implicit version of CROSS JOIN (also known as Cartesian Join) 
statement syntax look?

SELECT column_name(s)
FROM table1, table2;

How does an Implicit version of INNER JOIN statement syntax look?

SELECT column_name(s)
FROM table1, table2
WHERE table1.column_name = table2.column_name;


Objectives
After completing this lab you will be able to:

Write SQL queries that access more than one table
Compose queries that access multiple tables using a 
nested statement in the WHERE clause
Build queries with multiple tables in the FROM clause
Write Implicit Join queries with join criteria specified in the WHERE clause
Specify aliases for table names and qualify column names with table aliases
*/


/*
Exercise 1: Accessing Multiple Tables with Sub-Queries
*/

-- Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.

select * from employees
where JOB_ID in (select JOB_IDENT from jobs);


-- Retrieve only the list of employees whose JOB_TITLE is Jr. Designer.

select * from employees 
where JOB_ID in (select JOB_IDENT from jobs where JOB_TITLE = "Jr. Designer");


-- Retrieve JOB information and list of employees who earn more than $70,000.

select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT
from jobs 
where JOB_IDENT IN (select JOB_ID from employees where SALARY > 70000 );

-- my point of view 

select * from 
employees as e,job_history as j
 where e.SALARY > 70000 and e.JOB_ID = j.JOBS_ID;
 

-- Retrieve JOB information and list of employees whose birth year is after 1976.

select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT
from jobs 
where JOB_IDENT IN (select JOB_ID from employees where year(B_DATE) > 1976 );


-- Retrieve JOB information and list of female employees whose birth year is after 1976.

select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT
from jobs 
where JOB_IDENT IN (
					select JOB_ID from employees
                    where year(B_DATE) > 1976 and SEX = 'F');


-- Exercise 2: Accessing Multiple Tables with Implicit Joins


-- Perform an implicit cartesian/cross join between EMPLOYEES and JOBS tables.

select * 
from employees, jobs;


-- Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.

select * 
from employees,jobs
where employees.JOB_ID = jobs.JOB_IDENT;


-- Redo the previous query, using shorter aliases for table names. 
select *
from employees as e, jobs as j
where e.JOB_ID = j.JOB_IDENT;

/*
Redo the previous query, but retrieve only the Employee ID, 
Employee Name and Job Title.
*/

select e.EMP_ID,e.F_NAME,e.L_NAME,j.JOB_TITLE
from employees as e, jobs as j
where e.JOB_ID = j.JOB_IDENT;

SELECT User FROM mysql.user;


select * from job_history;

select * from jobs;

select * from employees;


select * from first_table;
drop table  if exists first_table;


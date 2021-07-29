-- Create Tables using SQL Scripts and Load Data into Tables

------------------------------------------
-- DDL statement for table 'HR' database--
--------------------------------------------

-- Drop the tables in case they exist
/*
DROP TABLE if exists EMPLOYEES;
DROP TABLE if exists JOB_HISTORY;
DROP TABLE if exists JOBS;
DROP TABLE if exists DEPARTMENTS;
DROP TABLE if exists LOCATIONS;

-- Create the tables

CREATE TABLE EMPLOYEES (
                          EMP_ID CHAR(9) NOT NULL,
                          F_NAME VARCHAR(15) NOT NULL,
                          L_NAME VARCHAR(15) NOT NULL,
                          SSN CHAR(9),
                          B_DATE DATE,
                          SEX CHAR,
                          ADDRESS VARCHAR(30),
                          JOB_ID CHAR(9),
                          SALARY DECIMAL(10,2),
                          MANAGER_ID CHAR(9),
                          DEP_ID CHAR(9) NOT NULL,
                          PRIMARY KEY (EMP_ID)
                        );

CREATE TABLE JOB_HISTORY (
                            EMPL_ID CHAR(9) NOT NULL,
                            START_DATE DATE,
                            JOBS_ID CHAR(9) NOT NULL,
                            DEPT_ID CHAR(9),
                            PRIMARY KEY (EMPL_ID,JOBS_ID)
                          );

CREATE TABLE JOBS (
                    JOB_IDENT CHAR(9) NOT NULL,
                    JOB_TITLE VARCHAR(15) ,
                    MIN_SALARY DECIMAL(10,2),
                    MAX_SALARY DECIMAL(10,2),
                    PRIMARY KEY (JOB_IDENT)
                  );

CREATE TABLE DEPARTMENTS (
                            DEPT_ID_DEP CHAR(9) NOT NULL,
                            DEP_NAME VARCHAR(15) ,
                            MANAGER_ID CHAR(9),
                            LOC_ID CHAR(9),
                            PRIMARY KEY (DEPT_ID_DEP)
                          );

CREATE TABLE LOCATIONS (
                          LOCT_ID CHAR(9) NOT NULL,
                          DEP_ID_LOC CHAR(9) NOT NULL,
                          PRIMARY KEY (LOCT_ID,DEP_ID_LOC)
                        );
*/

-- Now import the .csv files 

-- String Patterns, Sorting and Grouping

-- Exercise 1: String Patterns

-- Retrieve all employees whose address is in Elgin,IL.

select F_NAME,L_NAME,ADDRESS
from employees
where ADDRESS like '%Elgin,IL%';

-- Retrieve all employees who were born during the 1970's.

select F_NAME,L_NAME,B_DATE
from employees
where B_DATE like '197%';

-- or we can use the year functoins to get year 

SELECT F_NAME,L_NAME,YEAR(B_DATE) AS  year_of_birth
FROM employees
where year(B_DATE) >= 1970 and year(B_DATE)<1980;


/*
Retrieve all employees in department 5 
whose salary is between 60000 and 70000.
*/

select F_NAME,L_NAME,DEP_ID,SALARY
from employees
where DEP_ID = 5 and (SALARY >=60000 and SALARY<=70000);

-- or we can use the between operator 
select F_NAME,L_NAME,DEP_ID,SALARY
from employees
where (SALARY between 60000 and 70000) and DEP_ID=5;


-- Exercise 2: Sorting

-- Retrieve a list of employees ordered by department ID.

select F_NAME, L_NAME,DEP_ID
from employees
order by DEP_ID;


/*
Retrieve a list of employees ordered in descending
order by department ID and with
in each department ordered alphabetically in 
descending order by last name.
*/

select F_NAME,L_NAME,DEP_ID
from employees
order by DEP_ID desc,L_NAME desc;

/*
Retrieve a list of employees ordered by department name, and with
in each department ordered alphabetically in 
descending order by last name.
*/

select e.F_NAME,e.L_NAME,d.DEP_NAME,DEP_ID
from employees as e,departments as d
where e.DEP_ID = d.DEPT_ID_DEP
order by DEP_NAME ,L_NAME desc;


-- Exercise 3: Grouping

/*
For each department ID retrieve the number
 of employees in the department.
*/

select DEP_NAME,count(DEP_ID) as number_of_Employees
from employees as e,departments as d
where e.DEP_ID = d.DEPT_ID_DEP
group by DEP_ID;

-- or 

SELECT DEP_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEP_ID;


/*
For each department retrieve the number of employees
 in the department, and the average employee
salary in the department..
*/
select d.DEP_NAME,avg(e.SALARY) as Average_salary,count(*) as number_of_emp
from employees as e, departments as d
where e.DEP_ID = d.DEPT_ID_DEP
group by DEP_ID
order by Average_salary;

-- limit the result to departments with fewer than 4 employees.

select d.DEP_NAME,avg(e.SALARY) as Average_salary,count(*) as number_of_emp
from employees as e, departments as d
where e.DEP_ID = d.DEPT_ID_DEP
group by DEP_ID
having number_of_emp < 4
order by Average_salary;


-- or 

SELECT DEP_ID, COUNT(*), AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEP_ID;



-- check the data tables. 
select * from employees;
select * from jobs;
select * from locations;
select * from job_history;
select * from departments;





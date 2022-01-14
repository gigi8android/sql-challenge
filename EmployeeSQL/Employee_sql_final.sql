-----------------------------------------------------------------------
-- Step1- Dropping tables and their dependencies if existed
-----------------------------------------------------------------------

DROP TABLE IF EXISTS departments CASCADE ;
DROP TABLE IF EXISTS titles CASCADE ;
DROP TABLE IF EXISTS employees CASCADE ;
DROP TABLE IF EXISTS dept_emp CASCADE ;
DROP TABLE IF EXISTS dept_manager CASCADE ;
DROP TABLE IF EXISTS salaries CASCADE ;

-----------------------------------------------------------------------
-- Step2- Set datestyle to MDY (MM/DD/YYYY) format to accomodate the date's data in the csv files
-----------------------------------------------------------------------

ALTER DATABASE "Employees_db" SET datestyle TO "ISO, MDY";

-----------------------------------------------------------------------
-- Step3- Run the following queries to create tables. (Queries imported from QuickDBD: https://www.quickdatabasediagrams.com/)
-----------------------------------------------------------------------

CREATE TABLE "departments" (
    "dept_no" varchar(4)   NOT NULL,
    "dept_name" varchar(30)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" integer   NOT NULL,
    "dept_no" varchar(4)   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar(4)   NOT NULL,
    "emp_no" integer   NOT NULL
);

CREATE TABLE "salaries" (
    "emp_no" integer   NOT NULL,
    "salary" integer   NOT NULL
);

CREATE TABLE "titles" (
    "title_id" varchar(5)   NOT NULL,
    "title" varchar   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "employees" (
    "emp_no" integer   NOT NULL,
    "emp_title_id" varchar   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "sex" character(1)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

-----------------------------------------------------------------------
-- Step4- Update all tables with their relevant relationships as per QuickDBD ERD
-----------------------------------------------------------------------

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

-----------------------------------------------------------------------
-- Step5- Load csv data files to the newly created tables. 
-- These files can be imported & inserted to the tables either manually one by one via pgadmin GUI or, 
-- in bulk by executing the batch file copydata.bat (needs to be updated with the required server's password) in the command prompt.
-- Note: Based on the database schema, all data files must be imported in the following orders:
-- (a) departments
-- (b) titles
-- (c) employees
-- (d) dept_emp
-- (e) dept_manager
-- (f) salaries
-----------------------------------------------------------------------

-----------------------------------------------------------------------
-- Step6- Run General queries to check the table creations and whether the data had been imported appropriately to the tables.
-----------------------------------------------------------------------

select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;

-----------------------------------------------------------------------
-- Perform data analysis queries as outlined in the homework
-----------------------------------------------------------------------

-----------------------------------------------------------------------
-- Q1: List the following details of each employee: employee number, last name, first name, sex, and salary.
-----------------------------------------------------------------------

drop view if exists employee_details CASCADE;

create view employee_details as
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
	from employees
	left join salaries
	on employees.emp_no = salaries.emp_no;

select * from employee_details;

-----------------------------------------------------------------------
-- Q2: List first name, last name, and hire date for employees who were hired in 1986.
-----------------------------------------------------------------------

select first_name, last_name, hire_date from employees where date_part('year', hire_date) = 1986;

-----------------------------------------------------------------------
-- Q3: List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
-----------------------------------------------------------------------

drop view if exists manager_details CASCADE;

create view manager_details as
select dept_manager.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
	from employees
	left join dept_manager
	on employees.emp_no = dept_manager.emp_no
	inner join departments
	on dept_manager.dept_no = departments.dept_no;

select * from manager_details;

-----------------------------------------------------------------------
-- Q4: List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
-----------------------------------------------------------------------

drop view if exists employment_details CASCADE;

create view employment_details as
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
	from employees
	left join dept_emp
	on employees.emp_no = dept_emp.emp_no
	inner join departments
	on dept_emp.dept_no = departments.dept_no;

select * from employment_details;

-----------------------------------------------------------------------
-- Q5: List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
-----------------------------------------------------------------------

select e.first_name, e.last_name, e.sex 
	from employees e
	where e.first_name = 'Hercules' and e.last_name like 'B%';

-----------------------------------------------------------------------
-- Q6: List all employees in the Sales department, including their employee number, last name, first name, and department name.
-----------------------------------------------------------------------

select *
	from employment_details 
	where dept_name = 'Sales';

-----------------------------------------------------------------------
-- Q7: List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
-----------------------------------------------------------------------

select * 
	from employment_details 
	where dept_name = 'Sales' or dept_name = 'Development';

-----------------------------------------------------------------------
-- Q8: In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
-----------------------------------------------------------------------

select count(last_name) as "Last Name Count", last_name 
	from employees 
	group by last_name 
	order by "Last Name Count" DESC;
	
-----------------------------------------------------------------------
-- Epilogue: Search for the employee with id number = 499942
-----------------------------------------------------------------------

drop view if exists employee_499942;

create view employee_499942 as
select employees.*, employment_details.dept_name, employee_details.salary, titles.title
	from employees 
	inner join titles
	on employees.emp_title_id = titles.title_id
	inner join employment_details
	on employees.emp_no = employment_details.emp_no
	inner join employee_details
	on employees.emp_no = employee_details.emp_no
	where employees.emp_no = 499942;
	
select * from employee_499942;


	



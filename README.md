# sql-challenge

## Homework submission:

The folder structure in this repository is as followed: </br>
1. Folder "data" contains: all the required input csv files and a batch file to import bulk data files to postgresql database called _copydata.bat_
2. Folder "EmployeeSQL" contains: QuickDBD exported DB tables structure, Entity Relationship Diagram (ERD), Postgresql server username & password _postgresql_keys.py_, _Employee_sql_final_ and Jupyter notebook _bonus_final.ipynb_ for the bonus section.

**_Notes:_** </br>
  - The database name is: _Employees_db_
  - File _"postgresql_keys.py"_: needs to be updated with the relevant postgresql server user name and password 
  - Batch file _"copydata.bat"_: needs to be updated with the relevant postgresql server password
  - When importing the csv datafiles to the server for the first time, it's important to import the files in the order as listed in the file _copydata.bat_ or _Employee_sql_final.sql_. Otherwise the data won't be imported to the tables appropriately due to the established relationships between the tables.
  - The csv data files can be manually imported via pgAdmin or bulk import via batch file _copydata.bat_
  - Tables structure and ERD are created by using QuickDBD https://app.quickdatabasediagrams.com/#/

## Initial set-up:

a. Update file _postgresql_keys.py_ with the relevant postgresql server username and password and file _copydata.bat_ with the server's password </br>
b. In pgAdmin, open file _Employee_sql_final.sql_ and execute the queries as per the embedded comments/instructions </br>
c. In Jupyter notebook/lab, open file _bonus_final.ipynb_, restart the kernel and execute codes from the top. 

## Data analysis:

Refer to the embeded comments, output and graphs in files _Employee_sql_final.sql_ and _bonus_final.ipynb_ to address the followings data analysis queries:

1. POSTGRESQL queries:
    * List the following details of each employee: employee number, last name, first name, sex, and salary.
    * List first name, last name, and hire date for employees who were hired in 1986.
    * List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
    * List the department of each employee with the following information: employee number, last name, first name, and department name.
    * List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
    * List all employees in the Sales department, including their employee number, last name, first name, and department name.
    * List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
    * In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
    * Epilogue: show details of employee ID number 499942.

2. Bonus section:
    * Create a histogram to visualize the most common salary ranges for employees.
    * Create a bar chart of average salary by title.
    * Epilogue: show details of employee ID number 499942.



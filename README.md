# sql-challenge

## Homework submission:

The folder structure in this repository is as followed: </br>
1. Folder "data" contains: all the required input csv files and a batch file to import bulk data files to postgresql database called "copydata.bat"
2. Folder "EmployeeSQL" contains: 
    - DB tables structure: QuickDBD-tables.rtf & QuickDBD Tables.txt 
    - Entity Relationshp Diagram (ERD): QuickDBD-ERD.png
    - Postgressql server username & password: postgresql_keys.py
    - Main sql file contains all queries for this homework: Employee_sql_final.sql
    - Jupyter notebook for the bonus section: bonus_final.ipynb

**_Notes:
  - File "postgresql_keys.py": needs to be updated with the relevant postpressql server user name and password 
  - Batch file "copydata.bat": needs to be updated with the relevant postpressql server password
  - When importing the csv datafiles to the server for the first time, it's important to import the files in the order as listed in the file copydata.bat or Employee_sql_final.sql. Otherwise the data won't be imported to the tables appropriately due to the established relationships between the tables.
  - The csv data files can be manually imported via pgAdmin or bulk import via batch file copydata.bat

## Initial set-up:

a. Update files: "postgresql_keys.py" and "copydata.bat" with the relevant postgressql server user name and password </br>
b. 

## Data analysis:

Execute queries & codes in the following files: Employee_sql_final.sql and bonus_final.ipynb. </br>
Refer to the embeded comments, output and graphs to address the followings data analysis queries:

1. POSTGESSQL queries:
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



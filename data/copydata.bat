@echo off
setlocal
set PGPASSWORD=password
echo;
echo/
echo ***** Start inserting data to PostgreSQL tables *****
echo,
echo    ## Copy data to table 01 ##
for %%f in (departments.csv)  do psql -d Employees_db -h localhost -U postgres -p 5432 -c "\COPY public.departments FROM '%%~dpnxf' DELIMITER ',' CSV HEADER;" 
pause

echo    ## Copy data to table 02 ##
for %%f in (titles.csv)  do psql -d Employees_db -h localhost -U postgres -p 5432 -c "\COPY public.titles FROM '%%~dpnxf' DELIMITER ',' CSV HEADER;"
pause

echo    ## Copy data to table 03 ##
for %%f in (employees.csv)  do psql -d Employees_db -h localhost -U postgres -p 5432 -c "\COPY public.employees FROM '%%~dpnxf' DELIMITER ',' CSV HEADER;"
pause

echo    ## Copy data to table 04 ##
for %%f in (dept_emp.csv)  do psql -d Employees_db -h localhost -U postgres -p 5432 -c "\COPY public.dept_emp FROM '%%~dpnxf' DELIMITER ',' CSV HEADER;"
pause

echo    ## Copy data to table 05 ##
for %%f in (dept_manager.csv)  do psql -d Employees_db -h localhost -U postgres -p 5432 -c "\COPY public.dept_manager FROM '%%~dpnxf' DELIMITER ',' CSV HEADER;"
pause

echo    ## Copy data to table 06 ##
for %%f in (salaries.csv)  do psql -d Employees_db -h localhost -U postgres -p 5432 -c "\COPY public.salaries FROM '%%~dpnxf' DELIMITER ',' CSV HEADER;"

echo(
echo ***** Complete inserting data to PostgreSQL tables *****
echo+
echo=


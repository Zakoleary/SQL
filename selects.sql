#Retrieve the list of employees whos first name begins with Cathie, Mark or Nathan. 
SELECT * FROM employees WHERE first_name = 'Cathie' OR first_name = 'Mark' OR first_name = 'Nathan';

#retrieve all employees first names apart from Cathie, Mark, Nathan
SELECT * FROM employees WHERE first_name NOT IN ('Cathie' , 'Mark', 'Nathan');

#% sign at the front means ending in AR, % at the back means starting with AR
SELECT * FROM employees WHERE first_name LIKE ('%ar');  
    
#use the LIKE operator to select the data about all individuals, whose first name starts with “Mark”; specify that the name can be succeeded by any sequence of characters.
SELECT * FROM employees WHERE first_name LIKE ('Mark%');

#Retrieve a list with all employees who have been hired in the year 2000.
SELECT * FROM employees WHERE hire_date LIKE ('%2000%');

#Retrieve a list with all employees whose employee number is written with 5 characters, and starts with “1000”. 
SELECT * FROM employees WHERE emp_no LIKE ('1000_');

#Extract all individuals from the ‘employees’ table whose first name contains “Jack”.
SELECT * FROM employees WHERE first_name LIKE ('%Jack%');

#Once you have done that, extract another list containing the names of employees that do not contain “Jack”.
SELECT * FROM employees WHERE first_name NOT like ('%Jack%');

#Select all the information from the “salaries” table regarding contracts from 66,000 to 70,000 dollars per year.
SELECT * FROM salaries WHERE salary BETWEEN 66000 AND 70000;

#Retrieve a list with all individuals whose employee number is not between ‘10004’ and ‘10012’.
SELECT * FROM salaries WHERE emp_no NOT BETWEEN 10004 AND 10012;

#Select the names of all departments with numbers between ‘d003’ and ‘d006’.
SELECT dept_name FROM departments WHERE dept_no BETWEEN ('d003') AND ('d006');

#Select the names of all departments whose department number value is not null.
SELECT dept_name FROM departments WHERE dept_no IS NOT NULL;

#Retrieve a list with data about all female employees who were hired in the year 2000 or after.
SELECT * FROM employees WHERE gender = 'F' AND hire_date >= '2000-00-00';

#Extract a list with all employees’ salaries higher than $150,000 per annum.
SELECT * FROM salaries WHERE salary > '150000';

#Obtain a list with all different “hire dates” from the “employees” table.
SELECT DISTINCT hire_Date FROM employees;

#How many annual contracts with a value higher than or equal to $100,000 have been registered in the salaries table?
SELECT COUNT(*) FROM salaries WHERE salary >= 10000;

#How many managers do we have in the “employees” database? Use the star symbol (*) in your code to solve this exercise.
SELECT COUNT(*) FROM dept_manager;

#Select all data from the “employees” table, ordering it by “hire date” in descending order.
SELECT * FROM employees order by hire_date desc;

#Retrieve the name and corresponding number of times that name appears in the employees database ordered alphabetically
#Always inlcude the field you have grouped your results by in the SELECT statement
SELECT first_name, COUNT(first_name) from employees GROUP BY first_name ORDER BY first_name;

#Add an alias to the above SQL statement to rename COUNT(first_name) to names_count
SELECT first_name, COUNT(first_name) AS names_count from employees GROUP BY first_name ORDER BY first_name;

#Write a query that obtains an output whose first column must contain annual salaries higher than 80,000 dollars. 
#The second column, renamed to “emps_with_same_salary”, must show the number of employee contracts signed with this salary.
SELECT salary, COUNT(emp_no) AS emps_with_same_salary from salaries WHERE salary > 80000 GROUP BY salary ORDER BY salary;

#Extract all first names that appear more than 250 times in the employees table. 
SELECT first_name, COUNT(first_name) AS names_count from employees GROUP BY first_name HAVING COUNT(first_name) >250 ORDER BY first_name;

#Select all employees whose average salary is higher than $120,000 per annum.
SELECT *,AVG(salary) FROM salaries WHERE salary > 120000 GROUP BY emp_no ORDER BY emp_no; #returns 807

#Since we are using aggregation (AVG) need to use HAVING -> returns 101
SELECT *,AVG(salary) FROM salaries GROUP BY emp_no HAVING avg(salary) > 120000; 

#Extract a list of all names that are encountered less than 200 times. Let the data refer to people hired after the 1st of January 1999. 
select first_name, COUNT(first_name) as names_count 
FROM employees 
WHERE hire_date > '1999-01-01' 
group by first_name 
having count(first_name) < 200 
order by first_name DESC;

#Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000.
SELECT emp_no
from dept_emp 
WHERE from_date > '2000-01-01'
group by emp_no
having count(from_date) > 1
order by emp_no;

#Get the top 10 highest paid salaries from the employees table
SELECT * 
FROM salaries 
order by salary 
DESC LIMIT 10;

#Select the first 100 rows from the ‘dept_emp’ table. 
SELECT * 
FROM dept_emp
LIMIT 100;
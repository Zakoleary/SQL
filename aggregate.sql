#How many departments are there in the “employees” database?
select count(distinct dept_no) from dept_emp;

#What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997?
select sum(salary) from salaries WHERE from_date > '1997-01-01';

#1. Which is the lowest employee number in the database?
select min(emp_no) from employees;

#2. Which is the highest employee number in the database?
select max(emp_no) from employees;

#Which is the average annual salary the companys employee recieved?
select avg(salary) from salaries;

#What is the average annual salary paid to employees who started after the 1st of January 1997?
select avg(salary) from salaries WHERE from_date > '1997-01-01';

#Round the average amount of money spent on salaries for all contracts that started after the 1st of January 1997 to a precision of cents.
select round(avg(salary),2) from salaries WHERE from_date > '1997-01-01';
-- SUBQUERIES WORK

-- Q - Find the employees who's salary is more than the average salary 
-- 	earned by all employees

-- 1) FIND AVERAGE SALARY
-- 2) FILTER THE EMPLOYEES BASED ON THE ABOVE RESULT

SELECT * FROM employee -- outer query
WHERE salary > (SELECT avg(salary) FROM employee) -- subquery/inner query


-- Multiple row subquery 
-- subquery which returns multiple colum and multiple row
-- subquery which returns 1 column and multiple rows.

-- Q - Find the employees who earn the highest salary in each department
-- FIND HIGHEST SALARY IN EACH DEPARTMENT 

SELECT dept_name, max(salary) FROM employee GROUP BY dept_name

-- FILTER OUTER QUERY AND FILTER THE ABOVE 

SELECT * FROM employee WHERE (dept_name, salary) IN (SELECT 
													 dept_name,
													 max(salary)
        										     FROM employee
													 GROUP BY dept_name)

-- Single column multiple row subquery
-- Q - Find department which does not have employees
-- FIND THE DISTINCT DEPARTMENTS FIRST

SELECT DISTINCT dept_name FROM employee

-- Now create outer query for all in department and filter by the above

SELECT *
FROM department
WHERE dept_name NOT IN (SELECT DISTINCT dept_name FROM employee)

-- Correlated subquery
-- A subquery which is related to the outer query. 

-- Q - Find the employees in each department who earns more than the AVG 
-- Salary in that department

-- FIND THE AVERAGE SALARY PER DEPARTMENT 
-- Splitting into two tables 
-- find the initial avg salary

SELECT avg(salary)
FROM employee -- 5791.66
WHERE dept_name = "some specific department"

-- Now split employee into e1 and e2
-- This allows us to compare and keep track of 
-- salary which is > by filtering each dept_name by the previous tables
-- e.g. matching e2.dept_name with e1.dept_name alongside the where clause

SELECT *
FROM employee e1
WHERE salary > (SELECT avg(salary) 
				FROM employee e2
				WHERE e2.dept_name = e1.dept_name
			   )

-- Q - Find the stores who's sales where better than the average sales across
-- All stores

-- 1) Find the total sales for each store
-- 2) Find the average for all the stores 
-- 3) Compare 1 and 2 above

select *
from (select store_name, sum(price) as total_sales
	 from sales
	 group by store_name) sales
join (select avg(total_sales) as avg_sales
	 from (select store_name, sum(price) as total_sales
		  from sales
		  group by store_name) x
	 ) avg_sales
on sales.total_sales > avg_sales.avg_sales;

-- Or using a CTE instead (recommended as 3 subqueries are not great)

with sales as 
	(SELECT store_name, sum(price) as total_sales
	FROM sales
	GROUP BY store_name)
SELECT *
FROM sales
Join (SELECT avg(total_sales) as sales
	 FROM sales x) avg_sales
	 on sales.total_sales > avg_sales.sales



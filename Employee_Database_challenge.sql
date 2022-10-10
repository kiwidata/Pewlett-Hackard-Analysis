-- Drop tables if exists
DROP TABLE employees;
DROP TABLE title;
DROP TABLE retirement_titles;
DROP TABLE unique_titles;
drop table retiring_titles;
DROP TABLE mentorship_eligibility;

-- Create Title Table
CREATE TABLE title(
	emp_no INT not null,
	title VARCHAR NOT NULL,
	from_date date NOT NULL,
	to_date date NOT NULL);

SELECT * FROM title

-- Create employee table
Create Table employees(
    emp_no INT NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    gender VARCHAR NOT NULL,
    hire_date DATE NOT NULL
);

SELECT * FROM employees

-- Deliverable 1
SELECT 	employees.emp_no,
		employees.first_name,
		employees.last_name,
		title.title,
		title.from_date,
		title.to_date
into retirement_titles
FROM employees
inner join title
ON	employees.emp_no=title.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employees.emp_no

SELECT * from retirement_titles

SELECT emp_no, first_name, last_name,title
FROM retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (retirement_titles.emp_no) retirement_titles.emp_no,
retirement_titles.first_name,
retirement_titles.last_name,
retirement_titles.title
INTO unique_titles
FROM retirement_titles
WHERE retirement_titles.to_date = ('9999-01-01')
ORDER BY retirement_titles.emp_no, retirement_titles.to_date DESC;

SELECT * FROM unique_titles

-- Employees about to retire based on job most recent job title
SELECT COUNT(unique_titles.title), unique_titles.title
INTO retiring_titles
FROM unique_titles
GROUP BY unique_titles.title
ORDER BY COUNT(unique_titles.title) DESC;

SELECT * FROM retiring_titles

SELECT DISTINCT ON (e.emp_no) e.emp_no,
		e.first_name,
		e.last_name, e.birth_date,
		d.from_date,d.to_date,
		ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as d
ON (e.emp_no = d.emp_no)
INNER JOIN title as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (d.to_date='9999-01-01')
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibility

--  Data is from https://github.com/vrajmohan/pgsql-sample-data/tree/master/employee

-- Creating tables for PH-EmployeeDB
CREATE TABLE departments (
  dept_no VARCHAR(4) NOT NULL,
  dept_name VARCHAR(40) NOT NULL,
  PRIMARY KEY (dept_no),
  UNIQUE (dept_name)
);

CREATE TABLE employees (
  emp_no INT NOT NULL,
  birth_date DATE NOT NULL,
  first_name VARCHAR NOT NULL,
  last_name VARCHAR NOT NULL,
  gender VARCHAR NOT NULL,
  hire_date DATE NOT NULL,
  PRIMARY KEY (emp_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR(50) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no, title, from_date)
);

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no, from_date)
);

--Deliverable #1 

SELECT emp.emp_no, 
	emp.first_name, 
	emp.last_name, t.title, 
	t.from_date, 
	t.to_date 
INTO Data_Output
FROM titles AS t
FULL OUTER JOIN employees AS emp 
ON emp.emp_no=t.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp.emp_no;

SELECT emp.emp_no, 
	emp.first_name, 
	emp.last_name, 
	t.title, 
	t.from_date, 
	t.to_date 
INTO "Retirement Titles"
FROM titles AS t
FULL OUTER JOIN employees AS emp
ON emp.emp_no=t.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp.emp_no;

--Use Dictinct with Orderby to remove duplicate rows

SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO "Unique Titles"
FROM "Retirement Titles"
WHERE "Retirement Titles".to_date = ('9999-01-01')
ORDER BY "Retirement Titles".emp_no, "Retirement Titles".to_date DESC;

SELECT count(title),
	title	
INTO "Retiring Titles"
FROM "Unique Titles"
GROUP BY "Unique Titles".title
ORDER BY count(title) DESC;

--Deliverable 2: The Employees Eligible for the Mentorship Program

--Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
Select DISTINCT ON (emp.emp_no) emp.emp_no,
	emp.first_name,
	emp.last_name,
	emp.birth_date,
	dept_emp.from_date,
	dept_emp.to_date,
	t.title
INTO "Mentorship Eligibility"
FROM employees AS emp
FULL OUTER JOIN dept_emp
ON emp.emp_no=dept_emp.emp_no
FULL OUTER JOIN titles AS t
ON emp.emp_no=t.emp_no
WHERE dept_emp.to_date = ('9999-01-01') AND birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY emp.emp_no;

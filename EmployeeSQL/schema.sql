DROP TABLE IF EXISTS salary;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;
-------------------------------------------------------------
CREATE TABLE employees(
	emp_no	INT	UNIQUE PRIMARY KEY,
	birth_date	DATE,	
	first_name	VARCHAR(30),	
	last_name	VARCHAR(30),
	gender	VARCHAR(1),
	hire_date	DATE NOT NULL
	);
------------------------------------------------------------
-- DROP TABLE IF EXISTS titles;
CREATE TABLE titles (
	id SERIAL,
	emp_no INT NOT NULL,
	title VARCHAR(30) NOT NULL,
	from_date DATE,	
	to_date	DATE,
	PRIMARY KEY (id),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	);
----------------------------------------------------------------
-- DROP TABLE IF EXISTS departments;
CREATE TABLE departments(
	dept_no	VARCHAR(4),
	dept_name VARCHAR(30),
	PRIMARY KEY (dept_no)
	);
----------------------------------------------------------------
-- DROP TABLE IF EXISTS dept_emp;
CREATE TABLE dept_emp(
	id SERIAL,
	emp_no	INT,
	dept_no	VARCHAR(4),
	from_date DATE NOT NULL,
	to_date	DATE NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
	);

----------------------------------------------------------------
-- DROP TABLE IF EXISTS salary;
CREATE TABLE salaries(
	id SERIAL,
	emp_no	INT,
	salary	INT,	
	from_date	VARCHAR(30),	
	to_date	VARCHAR(30),
	PRIMARY KEY (id),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	);
------------------------------------------------------------------
-- DROP TABLE IF EXISTS dept_manager;
CREATE TABLE dept_manager(
	id SERIAL,
	dept_man_no	VARCHAR(4),
	emp_no	INT,
	from_date	DATE	NOT NULL,
	to_date	DATE	NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (dept_man_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	);

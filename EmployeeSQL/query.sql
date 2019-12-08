-- 1. Employee details: employee number, last name, first name, gender, and salary.
SELECT 
	e.emp_no "Employee Number", 
	e.last_name "Last Name", 
	e.first_name "First Name", 
	e.gender "Gender", 
	s.salary "Salary" 
FROM 
	employees e, 
	salaries s
WHERE e.emp_no = s.emp_no;
--------------------------------------------------------------------------------------------------------------------------
-- 2. Employees who were hired in 1986.
SELECT 
	e.emp_no "Employee Number", 
	e.last_name "Last Name", 
	e.first_name "First Name", 
	e.hire_date "Date Hired"
FROM 
	employees e
WHERE EXTRACT(YEAR FROM e.hire_date) = 1986;
--------------------------------------------------------------------------------------------------------------------------
-- 3. Manager of each department with the detailed information.
SELECT 
	dm.dept_no "Department Number", 
	d.dept_name "Department Name", 
	dm.emp_no "Manager Employee Number", 
	e.last_name "Last Name", 
	e.first_name "First Name" ,
	de.from_date "Start Date",
	de.to_date "End Date"
FROM 
	dept_manager dm,
	departments d,
	employees e,
	dept_emp de
WHERE
	dm.dept_no = d.dept_no
	AND dm.emp_no = e.emp_no
	AND dm.emp_no = de.emp_no
	AND dm.dept_no = de.dept_no
ORDER BY
	"Department Name", "Start Date"
--------------------------------------------------------------------------------------------------------------------------
-- 4. Department of each employee with the following information: employee number, last name, first name, and department name.
SELECT 
	e.emp_no "Employee Number",
	e.last_name "Last Name",
	e.first_name "First Name",
	d.dept_name "Department Name",
	de.from_date "Start Date"
FROM
	employees e,
	dept_emp de,
	departments d
WHERE
	e.emp_no = de.emp_no
	AND de.dept_no = d.dept_no
ORDER BY 
	"Employee Number"
--------------------------------------------------------------------------------------------------------------------------
-- 5. Employees whose first name is "Hercules" and last names begin with "B."
SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name like 'Hercules' AND last_name like 'B%'
--------------------------------------------------------------------------------------------------------------------------
-- 6. Employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e, departments d, dept_emp de
WHERE e.emp_no = de.emp_no
AND de.dept_no = d.dept_no
AND d.dept_name = 'Sales'
--------------------------------------------------------------------------------------------------------------------------
-- 7. Employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e, departments d, dept_emp de
WHERE e.emp_no = de.emp_no
AND de.dept_no = d.dept_no
AND (d.dept_name = 'Sales' OR d.dept_name = 'Development')
--------------------------------------------------------------------------------------------------------------------------
-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(last_name)
FROM employees
GROUP BY last_name
ORDER BY count(last_name) DESC

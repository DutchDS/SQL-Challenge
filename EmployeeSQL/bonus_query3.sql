SELECT t.title, s.salary, e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees e
	INNER JOIN salaries s
	ON e.emp_no=s.emp_no
	INNER JOIN titles t
	ON e.emp_no=t.emp_no
	INNER JOIN dept_emp de
	ON e.emp_no=de.emp_no
	INNER JOIN departments d
	ON de.dept_no=d.dept_no
WHERE e.emp_no=499942

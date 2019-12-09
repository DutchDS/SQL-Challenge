-- Most common salary ranges for employees.
SELECT e.emp_no, s.salary, MAX(s.from_date)
FROM
	employees e
	INNER JOIN salaries s
	ON e.emp_no = s.emp_no
GROUP BY e.emp_no, s.salary
ORDER BY s.salary DESC
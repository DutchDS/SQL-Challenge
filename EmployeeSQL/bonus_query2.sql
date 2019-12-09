SELECT t.title "Title", round(avg(s.salary)) "Average Salary"
FROM employees e
	INNER JOIN salaries s
	ON e.emp_no=s.emp_no
	INNER JOIN titles t
	ON e.emp_no=t.emp_no
GROUP BY t.title
ORDER BY "Average Salary" DESC
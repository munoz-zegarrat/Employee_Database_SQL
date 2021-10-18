--Employee_Database_Challenge
SELECT  e.emp_no,
		e.first_name,
		e.last_name,
		t.title,
		t.from_date,
		t.to_date
INTO employee_titles
FROM employees AS e
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (et.emp_no) et.emp_no,
et.first_name,
et.last_name,
et.title
INTO unique_titles
FROM employee_titles AS et
ORDER BY et.emp_no, et.to_date DESC;

SELECT count(ut.title),
			 ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY count(ut.title) DESC;

SELECT DISTINCT ON (e.emp_no) e.emp_no,
		e.first_name,
		e.last_name,
		e.birth_date,
		de.from_date,
		de.to_date,
		t.title
INTO mentor_table
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE (de.to_date = '9999-01-01') 
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;
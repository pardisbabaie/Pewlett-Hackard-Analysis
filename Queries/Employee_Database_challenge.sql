SELECT e.emp_no,
e.first_name,
e.last_name,
ti.titles,
ti.from_date,
ti.to_date
INTO retirement_titles
FROM employees as e 
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
titles
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT COUNT(ut.titles), titles
-- INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.titles
ORDER BY count DESC

SELECT e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.titles
-- INTO mentorship
FROM employees as e
INNER JOIN dept_employees AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE e.birth_date BETWEEN '1965-01-01' AND '1965-12-31';

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
birth_date,
from_date,
to_date,
titles
INTO mentorship_eligibilty
FROM mentorship
ORDER BY emp_no, to_date DESC;
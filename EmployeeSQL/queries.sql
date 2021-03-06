-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT
	e.emp_no
	,e.last_name
	,e.first_name
	,e.sex
	,s.salary

FROM
	employees e

LEFT JOIN
	salaries s ON e.emp_no = s.emp_no

ORDER BY
	emp_no
;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT
	first_name
	,last_name
	,hire_date
	
FROM
	employees

WHERE EXTRACT
	(year FROM (hire_date)) = 1986
;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT
	d.dept_no
	,d.dept_name
	,dm.emp_no
	,e.last_name
	,e.first_name
	
FROM
	departments d

LEFT JOIN
	dept_manager dm ON d.dept_no = dm.dept_no

LEFT JOIN
	employees e ON e.emp_no = dm.emp_no
;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT
	de.emp_no
	,e.last_name
	,e.first_name
	,d.dept_name
	
FROM 
	departments d
	
INNER JOIN
	dept_emp de ON d.dept_no = de.dept_no
	
INNER JOIN
	employees e ON e.emp_no = de.emp_no
	
ORDER BY
	dept_name ASC
;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT
	first_name
	,last_name
	,sex
	
FROM 
	employees

WHERE
	first_name = 'Hercules' AND last_name like 'B%'
;

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT
	de.emp_no
	,e.last_name
	,e.first_name
	,d.dept_name
	
FROM 
	departments d
	
INNER JOIN
	dept_emp de ON d.dept_no = de.dept_no
	
INNER JOIN
	employees e ON e.emp_no = de.emp_no
	
WHERE
	d.dept_name = 'Sales'
;

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT
	de.emp_no
	,e.last_name
	,e.first_name
	,d.dept_name
	
FROM 
	departments d
	
INNER JOIN
	dept_emp de ON d.dept_no = de.dept_no
	
INNER JOIN
	employees e ON e.emp_no = de.emp_no
	
WHERE
	d.dept_name = 'Sales' OR d.dept_name = 'Development'
	
ORDER BY
	dept_name
;

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT
	last_name
	,count(last_name) AS unique_last_name_count
	
FROM
	employees
	
GROUP BY 1

ORDER BY last_name ASC
;
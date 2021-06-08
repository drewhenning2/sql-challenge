departments
-
dept_no varchar PK
dept_name varchar


employees
-
emp_no int PK
emp_title_id varchar
birth_date date
first_name varchar
last_name varchar
sex varchar
hire_date date


dept_emp
-
emp_no int FK - employees.emp_no
dept_no varchar FK - departments.dept_no


dept_manager
-
dept_no varchar FK - departments.dept_no
emp_no int FK - employees.emp_no


salaries
-
emp_no int FK - employees.emp_no
salary int


titles
-
title_id varchar
title varchar
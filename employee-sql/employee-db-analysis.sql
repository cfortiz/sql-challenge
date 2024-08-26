-- List the employee number, last name, first name, sex, and salary of each
-- employee (2 points)
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employee e
inner join salary s
	on s.emp_no = e.emp_no
;

-- List the first name, last name, and hire date for the employees who were
-- hired in 1986 (2 points)
select first_name, last_name, hire_date
from employee
where hire_date between '1986-01-01' and '1986-12-31'
;

-- List the manager of each department along with their department number,
-- department name, employee number, last name, and first name (2 points)
select d.dept_no, d.dept_name,
	   m.emp_no, m.first_name, m.last_name
from department d
join department_manager dm -- related departments to managers (employees)
	on dm.dept_no = d.dept_no
join employee m -- Managers are employees too
	on m.emp_no = dm.emp_no
;

-- List the department number for each employee along with that employee’s 
-- employee number, last name, first name, and department name (2 points)
select d.dept_no, d.dept_name,
	   e.emp_no, e.first_name, e.last_name
from department d
join department_employee de -- relates departments to employees
	on de.dept_no = d.dept_no
join employee e
	on e.emp_no = de.emp_no
;

-- List first name, last name, and sex of each employee whose first name is
-- Hercules and whose last name begins with the letter B (2 points)
select first_name, last_name, sex
from employee
where first_name = 'Hercules' and last_name like 'B%'
;

-- List each employee in the Sales department, including their employee number,
-- last name, and first name (2 points)
select e.emp_no, e.last_name, e.first_name
from employee e
join department_employee de
    on de.emp_no = e.emp_no
join department d
    on d.dept_no = de.dept_no
where d.dept_name = 'Sales'
;

-- List each employee in the Sales and Development departments, including their
-- employee number, last name, first name, and department name (4 points)
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employee e
join department_employee de
    on de.emp_no = e.emp_no
join department d
    on d.dept_no = de.dept_no
where d.dept_name in ('Sales', 'Development')
;

-- List the frequency counts, in descending order, of all the employee last
-- names (that is, how many employees share each last name) (4 points)
select last_name, count(distinct emp_no)
from employee
group by last_name
order by last_name desc
;

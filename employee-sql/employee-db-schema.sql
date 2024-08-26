-- Drop tables
/* -- Uncomment drop statements to re-create tables.  Requires CSV re-import
DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS title;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS salary;
DROP TABLE IF EXISTS department_employee;
DROP TABLE IF EXISTS department_manager;
*/

-- Create tables

CREATE TABLE IF NOT EXISTS department (
	dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(30) NOT NULL,
    CONSTRAINT department_pkey PRIMARY KEY (dept_no)
);

CREATE TABLE IF NOT EXISTS title (
    title_id CHAR(5) NOT NULL,
    title VARCHAR(20) NOT NULL,
    CONSTRAINT title_pkey PRIMARY KEY (title_id)
);

CREATE TABLE IF NOT EXISTS employee (
    emp_no INT NOT NULL,
    emp_title_id CHAR(5) NOT NULL,
    birth_date VARCHAR(10) NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date VARCHAR(10) NOT NULL,
    CONSTRAINT employee_pkey PRIMARY KEY (emp_no),
    CONSTRAINT employee_title_fkey FOREIGN KEY (emp_title_id)
    REFERENCES title (title_id)
);

CREATE TABLE IF NOT EXISTS salary (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	CONSTRAINT salary_pkey PRIMARY KEY (emp_no),
	CONSTRAINT salary_employee_fkey FOREIGN KEY (emp_no)
		REFERENCES employee (emp_no)
);

CREATE TABLE IF NOT EXISTS department_employee (
    emp_no INT NOT NULL,
    dept_no CHAR(4) NOT NULL,
    CONSTRAINT department_employee_pkey PRIMARY KEY (emp_no, dept_no),
    CONSTRAINT department_employee_employee_fkey FOREIGN KEY (emp_no)
        REFERENCES employee (emp_no),
    CONSTRAINT department_employee_department_fkey FOREIGN KEY (dept_no)
        REFERENCES department (dept_no)
);

CREATE TABLE IF NOT EXISTS department_manager (
    dept_no CHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    CONSTRAINT department_manager_pkey PRIMARY KEY (dept_no, emp_no),
    CONSTRAINT department_manager_department_fkey FOREIGN KEY (dept_no)
        REFERENCES department (dept_no),
    CONSTRAINT department_manager_employee_fkey FOREIGN KEY (emp_no)
        REFERENCES employee (emp_no)
);

-- Parse employee datetime fields
ALTER TABLE employee ADD COLUMN parsed_birth_date DATE;
UPDATE employee
SET parsed_birth_date = TO_DATE(birth_date, 'MM/DD/YYYY');
ALTER TABLE employee DROP COLUMN birth_date;
ALTER TABLE employee RENAME COLUMN parsed_birth_date TO birth_date;

ALTER TABLE employee ADD COLUMN parsed_hire_date DATE;
UPDATE employee
SET parsed_hire_date = TO_DATE(hire_date, 'MM/DD/YYYY');
ALTER TABLE employee DROP COLUMN hire_date;
ALTER TABLE employee RENAME COLUMN parsed_hire_date TO hire_date;

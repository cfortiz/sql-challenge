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

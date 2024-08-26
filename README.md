# Module 9 SQL Challenge

Design DB tables to hold the data from the CSV files, import the CSV files into
the SQL database, and then answer questions about the data.

## Summary

I first analyzed the CSV files using the python repl to determine the minimum
lengths of the text elements.  Then I modeled the employee db tables as the data
suggested.  The provided ER diagrams should detail the relationships between the
entities.

The CSV files cannot account for the myriad of date/time formats possible;
therefore, I first imported them as varchar(10) fields using pgadmin 4.  Once
all of them were imported, I added columns for the parsed birth and hiring dates
as date fields, and updated the table to parse the varchar(10).  Then I removed
the original text columns, and renamed the parsed columns to the original names.

Then I ran the analysis queries.

## Process

To create the db tables in a postgresql db, run the create tables sql script.
If the tables already existed, run the drop tables sql script first.  Then,
import the CSV files using PG Admin 4.  Since the employee CSV file has the
birth and hiring dates as text, run the alter tables sql script to parse the
varchar(10) birth and hiring date fields into the date type.

If importing from the db data sql script, run the drop, create, and alter sql
scripts in order, then run the data sql script.

## Files

* `employee-sql/employee-db-schema-drop-tables.sql`: Queries to drop the
  employee database tables.
* `employee-sql/employee-db-schema-create-tables.sql`: Queries to create the
  employee database tables.
* `employee-sql/employee-db-schema-alter-tables.sql`: Queries to alter the
  employee database table to parse birth and hiring date from `varchar(10)` to
  `date`.
* `employee-sql/employe-db-data.sql`: PostgreSQL db data dump.
* `employee-sql/employee-db-erd.txt`: ER diagram text.
* `employee-sql/employee-db-erd.png`: ER diagram raster image.
* `employee-sql/employee-db-erd.svg`: ER diagram vector image.

* `README.md`: This file.

* `employee-sql/data/departments.csv`: Provided department data in CSV format.
* `employee-sql/data/dept_emp.csv`: Provided department employee data in CSV
  format.
* `employee-sql/data/dept_manager.csv`: Provided department manager data in CSV
  format.
* `employee-sql/data/employees.csv`: Provided employee data in CSV format.
* `employee-sql/data/salaries.csv`: Provided salary data in CSV format.
* `employee-sql/data/titles.csv`: Provided title data in CSV format.

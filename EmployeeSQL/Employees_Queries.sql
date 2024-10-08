-- List the employee number, last name, first name, sex, and salary of each employee.
CREATE VIEW analysis_one AS
    SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
    FROM "Employees" AS e
    JOIN "Salaries" AS s
    ON (e.emp_no = s.emp_no);

-- List the first name, last name, and hire date for the employees who were hired in 1986.
CREATE VIEW analysis_two AS
    SELECT first_name, last_name, hire_date
    FROM "Employees"
    WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
CREATE VIEW analysis_three AS
    SELECT m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
    FROM "Dept_Manager" AS m
        JOIN "Departments" AS d
        ON (m.dept_no = d.dept_no)
            JOIN "Employees" AS e
            ON (m.emp_no = e.emp_no);

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
CREATE VIEW analysis_four AS
    SELECT d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
    FROM "Employees" AS e
        JOIN "Dept_Employees" AS a
        ON (e.emp_no = a.emp_no)
            JOIN "Departments" AS d
            ON (a.dept_no = d.dept_no);

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
CREATE VIEW analysis_five AS
    SELECT first_name, last_name, sex
    FROM "Employees"
    WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
CREATE VIEW analysis_six AS
    SELECT d.dept_no, e.emp_no, e.last_name, e.first_name
    FROM "Employees" AS e
        JOIN "Dept_Employees" AS d
        ON (d.emp_no = e.emp_no)
            JOIN "Departments" AS x
            ON (x.dept_no = d.dept_no)
            WHERE dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
CREATE VIEW analysis_seven AS
    SELECT d.dept_no, e.emp_no, e.last_name, e.first_name, x.dept_name
    FROM "Employees" AS e
        JOIN "Dept_Employees" AS d
        ON (d.emp_no = e.emp_no)
            JOIN "Departments" AS x
            ON (x.dept_no = d.dept_no)
            WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
CREATE VIEW analysis_eight AS
    SELECT last_name, COUNT(*) AS "Frequency of Last Name"
    FROM "Employees"
    GROUP BY last_name
    ORDER BY "Frequency of Last Name" DESC;


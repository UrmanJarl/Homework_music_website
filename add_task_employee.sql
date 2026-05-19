CREATE TABLE IF NOT EXISTS Departments (
	department_id SERIAL PRIMARY KEY,
	name VARCHAR(25) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Employees (
	employee_id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	department_id INTEGER NOT NULL REFERENCES Departments(department_id)
	boss_id INTEGER NULL REFERENCES Employees(employee_id)
);
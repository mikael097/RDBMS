CREATE TABLE employee(
	emp_id INTEGER PRIMARY KEY,
	first_name VARCHAR(10),
	last_name VARCHAR(10),
	birth_date DATE,
	sex VARCHAR(1),
	salary INTEGER, 
	super_id INTEGER,
	branch_id INTEGER
);

CREATE TABLE branch(
	branch_id INTEGER PRIMARY KEY,
	branch_name VARCHAR(10),
	mgr_id INTEGER,
	mgr_start_date DATE,
	FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL 
);

CREATE TABLE client(
	client_id INTEGER PRIMARY KEY,
	client_name VARCHAR(10),
	branch_id INTEGER,
	FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL 
);

CREATE TABLE works_with(
	emp_id INTEGER,
	client_id INTEGER,
	total_sales INTEGER,
	PRIMARY KEY(emp_id,client_id),
	FOREIGN KEY (emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
	FOREIGN KEY (client_id) REFERENCES client(client_id) ON DELETE CASCADE 
	
);
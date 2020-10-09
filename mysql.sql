DROP DATABASE IF EXISTS Employee_Tracker;

CREATE DATABASE Employee_Tracker;

USE Employee_Tracker;

CREATE TABLE department(
id integer AUTO_INCREMENT, 
name VARCHAR(30),
PRIMARY KEY(id)
);

CREATE TABLE role(
id integer AUTO_INCREMENT not null,
title varchar(30) not null,
salary decimal not null,
department_id Integer not null,
constraint fk_department_id foreign key (department_id) references department(id),
primary key(id)
);


CREATE TABLE employee(
id integer auto_increment,
first_name varchar(30),
last_name varchar(30),
role_id integer null,
constraint fk_role_id FOREIGN KEY (role_id) REFERENCES role(id),
manager_id integer ,
constraint fk_manager_id FOREIGN KEY (manager_id) REFERENCES employee(id),
Primary key(id)
);

select * from employee;
select * from role;
select * from department;

INSERT into department (name) VALUES ("Sales");
INSERT into department (name) VALUES ("Engineering");
INSERT into department (name) VALUES ("Finance");
INSERT into department (name) VALUES ("Legal");
INSERT into department (name) VALUES ("Manager");

select * from department;

INSERT into role (title, salary, department_id) VALUES ("Sales Lead", 45000, 1);
INSERT into role (title, salary, department_id) VALUES ("Salesperson", 35000, 1);
INSERT into role (title, salary, department_id) VALUES ("Lead Engineer", 43000, 2);
INSERT into role (title, salary, department_id) VALUES ("Accountant", 50000, 3);
INSERT into role (title, salary, department_id) VALUES ("Legal", 50000, 4);
INSERT into role (title, salary, department_id) VALUES ("Manager", 65000, 5);

select * from role;

INSERT into employee (first_name, last_name, role_id) values ("Mickey", "Mouse", 3); 
INSERT into employee (first_name, last_name, role_id) values ("Peter", "Pan", 4);
INSERT into employee (first_name, last_name, role_id) values ("Anna", "Frozen", 5);
INSERT into employee (first_name, last_name, role_id) values ("Dory", "Fish", 6);
INSERT into employee (first_name, last_name, role_id) values ("Harry", "Potter", 7);
INSERT into employee (first_name, last_name, role_id) values ("Daisy", "Duck", 8);

select * from employee;


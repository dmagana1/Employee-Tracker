DROP DATABASE IF EXISTS Employee_Tracker;

CREATE DATABASE EmployeeTracker;

USE EmployeeTracker;

CREATE TABLE department(
id integer auto_increment not null,
name varchar(30) not null,
primary key(id)
);

CREATE TABLE role(
id integer auto_increment not null,
title varchar(30) not null,
salary decimal not null,
department_id Integer not null,
constraint fk_department_id foreign key (department_id) references department(id),
primary key(id)
);


CREATE TABLE employee(
id integer auto_increment not null,
first_name varchar(30) not null,
last_name varchar(30) not null,
role_id integer not null,
constraint fk_role_id FOREIGN KEY (role_id) REFERENCES role(id),
manager_id integer ,
constraint fk_manager_id FOREIGN KEY (manager_id) REFERENCES employee(id),
Primary key(id)
);

select * from employee;
select * from role;
select * from department;

INSERT into department (name) VALUES ("CEO");
INSERT into department (name) VALUES ("Engineering");
INSERT into department (name) VALUES ("Admin");
INSERT into department (name) VALUES ("Designer");
INSERT into department (name) VALUES ("Intern");

select * from department;

INSERT into role (title, salary, department_id) VALUES ("Owner", 4500000, 1);
INSERT into role (title, salary, department_id) VALUES ("President", 1500000, 1);
INSERT into role (title, salary, department_id) VALUES ("Lead Engineer", 143000, 2);
INSERT into role (title, salary, department_id) VALUES ("Controller", 150000, 3);
INSERT into role (title, salary, department_id) VALUES ("Art Director", 95000, 4);
INSERT into role (title, salary, department_id) VALUES ("Intern", 60000, 5);

select * from role;

INSERT into employee (first_name, last_name, role_id) VALUES ("Mickey", "Mouse", 3); 
INSERT into employee (first_name, last_name, role_id) VALUES ("Peter", "Pan", 4);
INSERT into employee (first_name, last_name, role_id) VALUES ("Anna", "Frozen", 5);
INSERT into employee (first_name, last_name, role_id) VALUES ("Dory", "Fish", 6);
INSERT into employee (first_name, last_name, role_id) VALUES ("Harry", "Potter", 7);
INSERT into employee (first_name, last_name, role_id) VALUES ("Daisy", "Duck", 8);

select * from employee;
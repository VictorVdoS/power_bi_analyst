-- Criação do banco de dados
CREATE DATABASE azure_company;
GO

-- Usar o banco de dados criado
USE azure_company;
GO

-- Criação das tabelas
CREATE TABLE employee (
    Fname VARCHAR(20),
    Minit CHAR(1),
    Lname VARCHAR(20),
    Ssn INT PRIMARY KEY,
    Bdate DATE,
    Address VARCHAR(100),
    Sex CHAR(1),
    Salary DECIMAL(10, 2),
    Superssn INT,
    Dno INT
);

CREATE TABLE dependent (
    Essn INT,
    Dependent_name VARCHAR(20),
    Sex CHAR(1),
    Bdate DATE,
    Relationship VARCHAR(20),
    FOREIGN KEY (Essn) REFERENCES employee(Ssn)
);

CREATE TABLE departament (
    Dname VARCHAR(20),
    Dnumber INT PRIMARY KEY,
    Mgr_ssn INT,
    Start_date DATE,
    End_date DATE,
    FOREIGN KEY (Mgr_ssn) REFERENCES employee(Ssn)
);

CREATE TABLE dept_locations (
    Dnumber INT,
    Dlocation VARCHAR(20),
    FOREIGN KEY (Dnumber) REFERENCES departament(Dnumber)
);

CREATE TABLE project (
    Pname VARCHAR(20),
    Pnumber INT PRIMARY KEY,
    Plocation VARCHAR(20),
    Dnum INT,
    FOREIGN KEY (Dnum) REFERENCES departament(Dnumber)
);

CREATE TABLE works_on (
    Essn INT,
    Pno INT,
    Hours DECIMAL(5, 2),
    PRIMARY KEY (Essn, Pno),
    FOREIGN KEY (Essn) REFERENCES employee(Ssn),
    FOREIGN KEY (Pno) REFERENCES project(Pnumber)
);

-- Inserção dos dados nas tabelas
INSERT INTO employee VALUES 
('John', 'B', 'Smith', 123456789, '1965-01-09', '731-Fondren-Houston-TX', 'M', 30000, 333445555, 5),
('Franklin', 'T', 'Wong', 333445555, '1955-12-08', '638-Voss-Houston-TX', 'M', 40000, 888665555, 5),
('Alicia', 'J', 'Zelaya', 999887777, '1968-01-19', '3321-Castle-Spring-TX', 'F', 25000, 987654321, 4),
('Jennifer', 'S', 'Wallace', 987654321, '1941-06-20', '291-Berry-Bellaire-TX', 'F', 43000, 888665555, 4),
('Ramesh', 'K', 'Narayan', 666884444, '1962-09-15', '975-Fire-Oak-Humble-TX', 'M', 38000, 333445555, 5),
('Joyce', 'A', 'English', 453453453, '1972-07-31', '5631-Rice-Houston-TX', 'F', 25000, 333445555, 5),
('Ahmad', 'V', 'Jabbar', 987987987, '1969-03-29', '980-Dallas-Houston-TX', 'M', 25000, 987654321, 4),
('James', 'E', 'Borg', 888665555, '1937-11-10', '450-Stone-Houston-TX', 'M', 55000, NULL, 1);

INSERT INTO dependent VALUES 
(333445555, 'Alice', 'F', '1986-04-05', 'Daughter'),
(333445555, 'Theodore', 'M', '1983-10-25', 'Son'),
(333445555, 'Joy', 'F', '1958-05-03', 'Spouse'),
(987654321, 'Abner', 'M', '1942-02-28', 'Spouse'),
(123456789, 'Michael', 'M', '1988-01-04', 'Son'),
(123456789, 'Alice', 'F', '1988-12-30', 'Daughter'),
(123456789, 'Elizabeth', 'F', '1967-05-05', 'Spouse');

INSERT INTO departament VALUES 
('Research', 5, 333445555, '1988-05-22', '1986-05-22'),
('Administration', 4, 987654321, '1995-01-01', '1994-01-01'),
('Headquarters', 1, 888665555, '1981-06-19', '1980-06-19');

INSERT INTO dept_locations VALUES 
(1, 'Houston'),
(4, 'Stafford'),
(5, 'Bellaire'),
(5, 'Sugarland'),
(5, 'Houston');

INSERT INTO project VALUES 
('ProductX', 1, 'Bellaire', 5),
('ProductY', 2, 'Sugarland', 5),
('ProductZ', 3, 'Houston', 5),
('Computerization', 10, 'Stafford', 4),
('Reorganization', 20, 'Houston', 1),
('Newbenefits', 30, 'Stafford', 4);

INSERT INTO works_on VALUES 
(123456789, 1, 32.5),
(123456789, 2, 7.5),
(666884444, 3, 40.0),
(453453453, 1, 20.0),
(453453453, 2, 20.0),
(333445555, 2, 10.0),
(333445555, 3, 10.0),
(333445555, 10, 10.0),
(333445555, 20, 10.0),
(999887777, 30, 30.0),
(999887777, 10, 10.0),
(987987987, 10, 35.0),
(987987987, 30, 5.0),
(987654321, 30, 20.0),
(987654321, 20, 15.0),
(888665555, 20, 0.0);

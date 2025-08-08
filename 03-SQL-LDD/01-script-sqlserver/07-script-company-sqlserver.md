```sql
--Creación de base de datos company
CREATE database company;


--Utilizar la base de datos
USE company;


--Creación de tabla department
CREATE table department (
    numberdepartment int not null identity(1,1),
    namedepartment nvarchar(20) not null,
    startdate date not null,
    ssn int,
    CONSTRAINT pk_department 
    PRIMARY KEY (numberdepartment)
);


--Creación de tabla employee
CREATE table employee (
    ssn int not null identity(1,1),
    firstname nvarchar(20) not null,
    lastname nvarchar(20) not null,
    address_emplloyee nvarchar(30),
    birthdate date not null,
    salary money not null,
    sex char(1) not null,
    numberdepartment int not null,
    supervisor int null,
   CONSTRAINT pk_employee 
   PRIMARY KEY (ssn),
   CONSTRAINT chk_sexo2 
   CHECK (sex in('M','F')),
   CONSTRAINT chk_salary 
   CHECK (salary > 0.0),
   CONSTRAINT fk_employee 
   FOREIGN KEY (supervisor) 
   REFERENCES employee(ssn),
   CONSTRAINT fk_department 
   FOREIGN KEY (numberdepartment) 
   REFERENCES department(numberdepartment)
);


--Creación de tabla dependentemploy
CREATE TABLE dependentemploy (
    namedep nvarchar(30) not null,
    relationship nvarchar(30) not null,
    sexdep char(1) not null,
    birthdatedep date not null,
    ssn int,
    CONSTRAINT pk_dependent 
    PRIMARY KEY (namedep, ssn),
    CONSTRAINT fk_dependent 
    FOREIGN KEY (ssn) 
    REFERENCES employee(ssn)
);


--Creación de tabla project
CREATE TABLE project (
    numberproject int not null identity(1,1),
    nameproject nvarchar(30),
    locationproj nvarchar(30),
    numberdepartment int,
    CONSTRAINT pk_project 
    PRIMARY KEY (numberproject),
    CONSTRAINT unique_nameproject 
    UNIQUE (nameproject),
    CONSTRAINT fk_project 
    FOREIGN KEY (numberdepartment) 
    REFERENCES department(numberdepartment)
);


--Creación de tabla work_on
CREATE TABLE work_on (
    ssn int not null,
    numberproject int not null,
    horas int not null,
    CONSTRAINT pk_work_on 
    PRIMARY KEY (ssn, numberproject),
    CONSTRAINT fk_workon_employee 
    FOREIGN KEY (ssn) 
    REFERENCES employee(ssn),
    CONSTRAINT fk_workon_project 
    FOREIGN KEY (numberproject) 
    REFERENCES project(numberproject)
);


--Creación de tabla dlocation
CREATE TABLE dlocation (
    numberdepart int not null,
    dlocation nvarchar(30) not null,
    CONSTRAINT pk_dlocation 
    PRIMARY KEY (numberdepart, dlocation),
    CONSTRAINT fk_dlocation 
    FOREIGN KEY (numberdepart) 
    REFERENCES department(numberdepartment)
);
```
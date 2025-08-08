```sql
#Lenguaje SQL-LDD (create,alter,drop)
#Crear la base de datos empresag2

CREATE DATABASE empresag2;


#Uilizar la base de datos
USE empresag2;

#Crear la tabla categorias

CREATE TABLE categorias
(
CategoriaId int primary key,
nombrecat nvarchar(30) not null unique

);


#Crear tabla empleado

CREATE TABLE empleado
(
EmpleadoId int not null auto_increment,
nombre nvarchar(30) not null,
apellidoPaterno nvarchar(20) not null,
curp char(18) not null,
telefono char(15),
sexo char(1) not null,
activo boolean not null,
CONSTRAINT pk_empleado
PRIMARY KEY (EmpleadoId),
CONSTRAINT unique_curp
UNIQUE (curp),
CONSTRAINT chk_sexo
CHECK(sexo in ('M','F'))
);
drop table empleado;

#Insertar en categorias

INSERT INTO categorias(CategoriaId,nombrecat)
VALUES(1, 'CARNES FRIAS');
INSERT INTO categorias(CategoriaId,nombrecat)
VALUES(2, 'VINOS Y LICORES');


SELECT * FROM categorias;
SELECT * FROM empleado;

#Insertar en empleado

INSERT INTO empleado (nombre,apellidoPaterno,curp,telefono,sexo,activo)
VALUES ('Monico','Panfilo','dfghhgjh','2335543','M',1);


INSERT INTO empleado (nombre,apellidoPaterno,curp,telefono,sexo,activo)
VALUES ('Mari','Alvarez','fgghjghf','876554','F',1);


#Creacion de primary keys compuestas
CREATE TABLE Tabla1 
(
tabla1id1 int not null, 
tabla1id2 int not null,
nombre nvarchar(20) not null,
CONSTRAINT pk_tabla1
PRIMARY KEY(tabla1id1,tabla1id2)
);

#Razon de cardinalidad 1:N
CREATE TABLE tabla2
(
tabla2id int not null auto_increment,
nombre nvarchar(20),
tabla1id1 int,
tabla1id2 int,
CONSTRAINT pk_tabla2id
PRIMARY KEY (tabla2id),
CONSTRAINT fk_tabla2_tabla1
FOREIGN KEY (tabla1id1,tabla1id2)
REFERENCES Tabla1(tabla1id1,tabla1id2)
);

#Razon de cardinalidad 1:1
CREATE TABLE Employee
(
id_employee int not null auto_increment,
nombre varchar(20) not null,
ap1 varchar(15) not null,
ap2 varchar(15),
sexo2 char(1) not null,
salario numeric(10,2) not null,
CONSTRAINT pk_employee
Primary key (id_employee),
CONSTRAINT chk_sexo2
CHECK (sexo2 in('M','F')),
CONSTRAINT chk_salario
CHECK (salario>0.0)
);


CREATE TABLE Department
(
id_department int not null auto_increment,
nombreProyecto varchar(20) not null,
ubicacion varchar(15) not null,
fechaInicio date not null,
id_employee int not null,
CONSTRAINT pk_deparment
PRIMARY KEY (id_department),
CONSTRAINT unique_nombreProyecto
UNIQUE(nombreProyecto),
CONSTRAINT unique_idemployee
UNIQUE(id_employee),
CONSTRAINT fk_deparment_employee
FOREIGN KEY (id_employee)
REFERENCES Employee (id_employee)

);


#Nuevas tablas razon de cardinalidad 1:N
CREATE TABLE Project
(
id_project int not null auto_increment,
nameProject varchar(20) not null,
CONSTRAINT pk_project
PRIMARY KEY (id_project),
CONSTRAINT unique_nameproject
UNIQUE (nameProject)
);


CREATE TABLE Work_on
(
employee_id int not null, 
project_id int not null,
horas int not null,
CONSTRAINT pk_Work_on
PRIMARY KEY(employee_id,project_id),
CONSTRAINT fk_workon_employee
FOREIGN KEY (employee_id)
REFERENCES Employee (id_employee),
CONSTRAINT fk_workon_project
FOREIGN KEY (project_id)
REFERENCES Project (id_project)
);

```
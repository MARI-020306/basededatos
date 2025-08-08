  ```sql
--Lenguaje SQL-LDD (create,alter,drop)
--Crear la base de datos empresag2

CREATE DATABASE empresag2;
GO

--Uilizar la base de datos
USE empresag2;

--Crear la tabla categorias

CREATE TABLE categorias
(
CategoriaId int primary key,
nombrecat nvarchar(30) not null unique

);
GO

--Crear tabla empleado

CREATE TABLE empleado
(
EmpleadoId int not null identity(1,1),
nombre nvarchar(30) not null,
apellidoPaterno nvarchar(20) not null,
curp char(18) not null,
telefono char(15),
sexo char(1) not null,
activo bit not null,
CONSTRAINT pk_empleado
PRIMARY KEY (EmpleadoId),
CONSTRAINT unique_curp
UNIQUE (curp),
CONSTRAINT chk_sexo
CHECK(sexo in ('M','F'))
);
GO

--Insertar en categorias

INSERT INTO categorias(CategoriaId,nombrecat)
VALUES(1, 'CARNES FRIAS');
INSERT INTO categorias(CategoriaId,nombrecat)
VALUES(2, 'VINOS Y LICORES');
GO

SELECT * FROM categorias;

--Insertar en empleado

INSERT INTO empleado (nombre,apellidoPaterno,curp,telefono,sexo,activo)
VALUES ('Monico','Panfilo','dfghhgjh','2335543','M',1)
GO

INSERT INTO empleado (nombre,apellidoPaterno,curp,telefono,sexo,activo)
VALUES ('Mari','Alvarez','fgghjghf','876554','F',1)
GO
```
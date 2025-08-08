--Crear bd

CREATE DATABASE bdmorgan;
GO

USE bdmorgan;

CREATE TABLE empleado(
IdEmpleado int not null identity(1,1),
Nombre varchar(50) not null,
Apellido1 varchar(20) not null,
Apellido2 varchar(20),
Edad int not null,
Estatus char(1) not null default 'A',
IdDepto int not null
);
GO

ALTER TABLE empleado
ADD jef int ;
GO
--Restricciones
ALTER TABLE empleado
ADD CONSTRAINT pk_empleado
PRIMARY KEY(IdEmpleado);
GO
ALTER TABLE empleado
ADD CONSTRAINT chk_edad
CHECK(edad between 18 and 60);
GO

ALTER TABLE empleado
ADD CONSTRAINT fk_empleado_empljefe
FOREIGN KEY (jef)
REFERENCES empleado(IdEmpleado);
GO
-- Crear tabla departamentos

CREATE TABLE departamentos(
IdDepto int not null identity(1,1),
NombreDpto varchar (20) not null,
CONSTRAINT pk_depto
PRIMARY KEY (IdDepto)

);
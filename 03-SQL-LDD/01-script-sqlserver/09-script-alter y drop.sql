--	Crear base de datos

CREATE DATABASE empresachcha;
GO

-- Usar la base de datos

USE empresachcha;
GO

-- Crear la tabla empleados

CREATE TABLE empleados(
IdEmpleado INT not null IDENTITY(1,1),
Nombre NVARCHAR(20) not null,
Puesto NVARCHAR (20),
FechaIngreso DATE,
Salario DECIMAL(10,2),
CONSTRAINT pk_empleado
PRIMARY KEY (IdEmpleado)
);
GO

CREATE TABLE departamentos(
IdDepto INT not null PRIMARY KEY,
NombreDepto NVARCHAR(50),
);
GO

-- Agregar columna a la tabla empleados

ALTER TABLE empleados
ADD Email NVARCHAR(50);
GO

--Modifiecar un tipo de datos de la tabla 

ALTER TABLE empleados
ALTER COLUMN Salario money not null;
GO

--Renombrar columa correro electronico de la tabla empleados

EXECUTE sp_rename 'empleados.Email', 'Email','COLUMN';
GO

--Agregar columna a empleados para foreign key

ALTER TABLE empleados
ADD IdDepto int;
GO

--Agregar un constraint de foreign key

	ALTER TABLE empleados
	ADD CONSTRAINT fk_empleado_depto
	FOREIGN KEY (IdDepto)
	REFERENCES departamentos(IdDepto);
    GO

	--Agregar un constraint a salario

	ALTER TABLE empleados
	ADD CONSTRAINT chk_Salario
	CHECK (Salario>=100 and Salario<=100000)
	GO

	--Agregar un  constraint unique al nombre del departamento
	ALTER TABLE departamentos
	ADD CONSTRAINT unique_nombredepto
	UNIQUE(NombreDepto)
	GO


	--Eliminar el constraint de foreing key 
	ALTER TABLE empleados
	DROP CONSTRAINT fk_empleado_depto
	GO

	--Eliminar la primary key de empleados
	ALTER TABLE empleados
	DROP CONSTRAINT pk_empleado
	GO

	--Eliminar la primary key de departamentos
	ALTER TABLE departamentos
	DROP CONSTRAINT [PK__departam__7AEC424ED9624096];
	GO

	--Eliminar una columna
	ALTER TABLE empleados
	DROP COLUMN Email;
	GO

	--Eliminar una tabla
	DROP TABLE departamentos;
	DROP TABLE empleados;


	--Ejemplo de base de datos con alter, tablas 

	CREATE TABLE Empleado (
    Idemp INT NOT NULL IDENTITY(1,1),
    Nombre NVARCHAR(20) NOT NULL,
    Ap1 NVARCHAR(10) NOT NULL,
    Ap2 NVARCHAR(10),
Depto INT NOT NULL,
Salario DECIMAL(10,2) NOT NULL,
    Jef INT NOT NULL,
    CONSTRAINT pk_empleado PRIMARY KEY (Idemp),
    CONSTRAINT chkSalario CHECK (Salario BETWEEN 500 AND 70000),
    CONSTRAINT fk_empleado_emp FOREIGN KEY (Jef) REFERENCES Empleado(Idemp)
);
GO 

CREATE TABLE Departamento (
    IdDepto INT NOT NULL IDENTITY(1,1),
    NombreDepto NVARCHAR(20) NOT NULL,
    Jef INT NOT NULL,
    
    CONSTRAINT unique_nombre UNIQUE (NombreDepto),
    CONSTRAINT pk_Depto PRIMARY KEY (IdDepto),
    CONSTRAINT fk_depto_empl FOREIGN KEY (Jef) REFERENCES Empleado(Idemp)
);
GO

ALTER TABLE Empleado
ADD constraint fk_empl_depto 
Foreign key(Depto) 
references Departamento (IdDepto);

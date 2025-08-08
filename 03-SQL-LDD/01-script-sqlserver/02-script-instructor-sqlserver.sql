-- Creacion de base de datos bdinstruccion

CREATE DATABASE bdinstruccion;

-- Utilizar la base de datos

USE bdinstruccion;
GO 

--Creacion de tabla instructor

CREATE TABLE Instructor
(
ssn int not null identity(1,1), 
lname nvarchar(20) not null,
fname nvarchar(20) not null,
CONSTRAINT pk_Instructor
PRIMARY KEY(ssn)
);
GO

--Creacion de tabla class

CREATE TABLE Class
(
curse_num int not null, 
cyear int not null,
term nvarchar(20) not null,
section nvarchar(20) not null,
CONSTRAINT pk_Class
PRIMARY KEY(curse_num,cyear,term,section)
);
GO

--Creacion de tabla Teaches

CREATE TABLE Teaches
(
ssn int not null, 
curse_num int not null,
yearc int not null,
term nvarchar(20) not null,
section nvarchar(20) not null,
CONSTRAINT pk_Teaches
PRIMARY KEY(ssn,curse_num,yearc,term,section),
CONSTRAINT fk_Teaches_class
FOREIGN KEY (curse_num,yearc,term,section)
REFERENCES Class (curse_num,cyear,term,section),
CONSTRAINT fk_Teaches_instructor
FOREIGN KEY (ssn)
REFERENCES Instructor(ssn)
);
GO

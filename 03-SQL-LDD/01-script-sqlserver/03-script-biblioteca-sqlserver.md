``` sql
-- Creacion de base de datos bdinstruccion

CREATE DATABASE biblioteca;

-- Utilizar la base de datos

USE biblioteca;
GO 

--Creacion de tabla lector

CREATE TABLE Lector
(
numlector int not null identity(1,1), 
nombre nvarchar(20) not null,
apellido1 nvarchar(20) not null,
apellido2 nvarchar(20) not null,
CONSTRAINT pk_Lector
PRIMARY KEY(numlector)
);
GO

--Creacion de tabla libro

CREATE TABLE Libro
(
numLibro int not null identity(1,1), 
titulo nvarchar(20) not null,
autor nvarchar(20) not null,
cantidad nvarchar(20) not null,
numisbn int not null,
CONSTRAINT pk_Libro
PRIMARY KEY(numLibro),
CONSTRAINT unique_numisbn
UNIQUE(numisbn)
);
GO

--Creacion de tabla Presta

CREATE TABLE Presta
(
numlibro int not null, 
numlector int not null,
fechaprestamo date not null,
CONSTRAINT pk_Presta
PRIMARY KEY(numlibro,numlector),
CONSTRAINT unique_fechaprestamo
UNIQUE(fechaprestamo),
CONSTRAINT fk_presta_libro
FOREIGN KEY (numlibro)
REFERENCES Libro (numlibro),
CONSTRAINT fk_presta_lector
FOREIGN KEY (numlector)
REFERENCES Lector(numlector)
);
GO
```

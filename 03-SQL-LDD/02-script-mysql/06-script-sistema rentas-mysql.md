```sql
#Creacion de base de datos sistema de rentas

CREATE DATABASE sistema_rentas;

#Utilizar la base de datos

USE sistema_rentas;


#Creacion de tabla Cliente

CREATE TABLE Cliente
(
numcliente int not null auto_increment, 
nombre nvarchar(20) not null,
apellido1 nvarchar(20) not null,
apellido2 nvarchar(20) not null,
curp nchar(18) not null,
telefono nchar(10) not null,
calle nvarchar(20) not null,
numero int not null,
ciudad nvarchar(20),
CONSTRAINT pk_Cliente
PRIMARY KEY(numcliente),
CONSTRAINT unique_curp
UNIQUE(curp),
CONSTRAINT unique_telefono
UNIQUE(telefono)
);


#Creacion de tabla Sucursal

CREATE TABLE Sucursal
(
numsucursal int not null auto_increment, 
nombre nvarchar(20) not null,
ubicacion nvarchar(20) not null,
CONSTRAINT pk_Sucursal
PRIMARY KEY(numsucursal)
);


#Creacion de tabla Vehiculo

CREATE TABLE Vehiculo
(
numvehiculo int not null auto_increment, 
placa nchar(7) not null,
marca nvarchar(20) not null,
modelo nvarchar(20) not null,
anio int not null,
numcliente int not null,
numsucursal int not null,
CONSTRAINT pk_Vehiculo
PRIMARY KEY(numvehiculo),
CONSTRAINT unique_placa
UNIQUE(placa),
CONSTRAINT fk_vehiculo_cliente
FOREIGN KEY (numcliente)
REFERENCES Cliente (numcliente),
CONSTRAINT fk_vehiculo_sucursal
FOREIGN KEY (numsucursal)
REFERENCES Sucursal(numsucursal)
);
```
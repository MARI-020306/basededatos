#Creacion de base de datos hospital

CREATE DATABASE hospital;

#Utilizar la base de datos

USE hospital;


#Creacion de tabla Paciente

CREATE TABLE Paciente
(
numpaciente int not null auto_increment, 
nombre nvarchar(20) not null,
apellido1 nvarchar(20) not null,
apellido2 nvarchar(20) not null,
CONSTRAINT pk_Paciente
PRIMARY KEY(numpaciente)
);


#Creacion de tabla Medico

CREATE TABLE Medico
(
num_medico int not null auto_increment, 
nombre nvarchar(20) not null,
apellido1 nvarchar(20) not null,
apellido2 nvarchar(20) not null,
numcedula int not null,
CONSTRAINT pk_Medico
PRIMARY KEY(num_medico)
);

#Creacion de tabla Atiende

CREATE TABLE Atiende
(
numpaciente int not null, 
num_medico int not null,
fecha date not null,
diagnostico nvarchar(100) not null,
CONSTRAINT pk_Atiende
PRIMARY KEY(numpaciente,num_medico),
CONSTRAINT fk_atiende_paciente
FOREIGN KEY (numpaciente)
REFERENCES Paciente (numpaciente),
CONSTRAINT fk_atiende_medico
FOREIGN KEY (num_medico)
REFERENCES Medico(num_medico)
);

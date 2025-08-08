```sql
#Creacion de base de datos universidad

CREATE DATABASE universidad;

#Utilizar la base de datos

USE universidad;


#Creacion de tabla Alumno

CREATE TABLE Alumno
(
numalumno int not null auto_increment, 
nombre nvarchar(20) not null,
apellido1 nvarchar(20) not null,
apellido2 nvarchar(20) not null,
matricula int not null,
CONSTRAINT pk_Alumno
PRIMARY KEY(numalumno),
CONSTRAINT unique_matricula
UNIQUE(matricula)
);


#Creacion de tabla Curso

CREATE TABLE Curso
(
numcurso int not null auto_increment, 
nombrec nvarchar(20) not null,
codigo int not null,
CONSTRAINT pk_Curso
PRIMARY KEY(numcurso),
CONSTRAINT unique_codigo
UNIQUE(codigo)
);




#Creacion de tabla Inscripcion

CREATE TABLE Inscripcion
(
numalumno int not null, 
numcurso int not null,
CONSTRAINT pk_Inscripcion
PRIMARY KEY(numalumno,numcurso),
CONSTRAINT fk_inscripcion_alumno
FOREIGN KEY (numalumno)
REFERENCES Alumno (numalumno),
CONSTRAINT fk_inscripcion_curso
FOREIGN KEY (numcurso)
REFERENCES Curso(numcurso)
);
```
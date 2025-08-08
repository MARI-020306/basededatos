#Creacion de base de datos clinica_dental
CREATE DATABASE clinica_dental;



#Utilizar la base de datos
USE clinica_dental;



#Creacion de tabla paciente
CREATE TABLE paciente (
    id_paciente int not null auto_increment,
    nombre nvarchar(20) not null,
    apellido1 nvarchar(20) not null,
    apellido2 nvarchar(20) not null,
    curp nchar(18) not null,
    correo nvarchar(20),
    numero_celular int not null,
    direccion nvarchar(20) not null,
    colonia nvarchar(20)not null,
    numero int,
    calle nvarchar(20) not null,
    CONSTRAINT pk_paciente 
	PRIMARY KEY (id_paciente)
);


#Creacion de tabla consultorio
create table consultorio (
    id_consultorio int not null auto_increment,
    ubicacion nvarchar(20) not null,
    piso int not null,
    numero int not null,
    constraint pk_consultorio primary key (id_consultorio)
);


#Creacion de tabla imagen
CREATE TABLE imagen (
    id_imagen int not null auto_increment,
    ruta nvarchar(50) not null,
    tipo nvarchar(30) not null,
    CONSTRAINT pk_imagen 
	PRIMARY KEY (id_imagen)
);


#Creacion de tabla historial_clinico
CREATE TABLE historial_clinico (
    id_historia int not null auto_increment,
    fecha date not null,
    diagnostico nvarchar(100) not null,
    observaciones nvarchar(100) not null,
    id_imagen int,
    CONSTRAINT pk_historial_clinico 
	PRIMARY KEY (id_historia),
    CONSTRAINT fk_historial_imagen 
	FOREIGN KEY (id_imagen) 
	REFERENCES imagen(id_imagen)
);


#Creacion de tabla cita
CREATE TABLE cita (
    id_cita int not null auto_increment,
    estatus nvarchar(50) not null,
    motivo nvarchar(100) not null,
    fecha date not null,
    hora int not null,
    CONSTRAINT pk_cita 
	PRIMARY KEY (id_cita)
);


#Creacion de tabla odontologo
CREATE TABLE odontologo (
    id_odontologo int not null auto_increment,
    cedula_p int not null,
    nombre nvarchar(20) not null,
    apellido1 nvarchar(20) not null,
    apellido2 nvarchar(20) not null,
    id_cita int not null,
    CONSTRAINT pk_odontologo 
	PRIMARY KEY (id_odontologo),
    CONSTRAINT fk_odontologo_cita 
	FOREIGN KEY (id_cita) 
	REFERENCES cita(id_cita)
);

#Creacion de tabla usa
CREATE TABLE usa (
    id_consultorio int not null,
    id_odontologo int not null,
    horario int not null,
    fecha date not null,
    CONSTRAINT pk_usa 
	PRIMARY KEY (id_consultorio, id_odontologo),
    CONSTRAINT fk_usa_consultorio
	FOREIGN KEY (id_consultorio) 
	REFERENCES consultorio(id_consultorio),
    CONSTRAINT fk_usa_odontologo 
	FOREIGN KEY (id_odontologo) 
	REFERENCES odontologo(id_odontologo)
);

#Creacion de tabla tratamiento
create table tratamiento (
    id_tratamiento int not null auto_increment,
    estatus nvarchar(30) not null,
    nombre nvarchar(30) not null,
    costo boolean not null,
    duracion int not null,
    CONSTRAINT pk_tratamiento 
	PRIMARY KEY (id_tratamiento)
);

#Creacion de tabla factura
CREATE TABLE factura (
    id_pago int not null auto_increment,
    fecha date not null,
    metodo_p nvarchar(30) not null,
    estado_p nvarchar(30) not null,
    CONSTRAINT pk_factura 
	PRIMARY KEY (id_pago)
);

#Creacion de tabla aplicacion_tratamiento
CREATE TABLE aplicacion_tratamiento (
    id_aplicacion_tratamiento int not null auto_increment,
    observaciones nvarchar(100) not null,
    fecha date not null,
    id_paciente int not null,
    id_odontologo int not null,
    CONSTRAINT pk_aplicacion_tratamiento 
	PRIMARY KEY (id_aplicacion_tratamiento),
    CONSTRAINT fk_aplicacion_paciente 
	FOREIGN KEY (id_paciente) 
	REFERENCES paciente(id_paciente),
    CONSTRAINT fk_aplicacion_odontologo 
	FOREIGN KEY (id_odontologo) 
	REFERENCES odontologo(id_odontologo)
);

#Creacion de tabla pago
CREATE TABLE pago (
    id_aplicacion_tratamiento int not null,
    id_pago int not null,
    CONSTRAINT pk_pago 
	PRIMARY KEY (id_aplicacion_tratamiento, id_pago),
    CONSTRAINT fk_pago_aplicacion 
	FOREIGN KEY (id_aplicacion_tratamiento) 
	REFERENCES aplicacion_tratamiento(id_aplicacion_tratamiento),
    CONSTRAINT fk_pago_factura 
	FOREIGN KEY (id_pago) 
	REFERENCES factura(id_pago)
);

-- Creacion de tabla esta
CREATE TABLE esta (
    id_historia int not null,
    id_aplicacion_tratamiento int not null,
    CONSTRAINT pk_esta 
	PRIMARY KEY (id_historia, id_aplicacion_tratamiento),
    CONSTRAINT fk_esta_historia 
	FOREIGN KEY (id_historia) 
	REFERENCES historial_clinico(id_historia),
    CONSTRAINT fk_esta_aplicacion 
	FOREIGN KEY (id_aplicacion_tratamiento) 
	REFERENCES aplicacion_tratamiento(id_aplicacion_tratamiento)
);

#Creacion de tabla sesiones
create table sesiones (
    sesion_id int not null auto_increment,
    id_aplicacion_tratamiento int not null,
    CONSTRAINT pk_sesiones 
	PRIMARY KEY (sesion_id),
    CONSTRAINT fk_sesiones_aplicacion 
	FOREIGN KEY (id_aplicacion_tratamiento)
	REFERENCES aplicacion_tratamiento(id_aplicacion_tratamiento)
);

#Creacion de tabla sesion_tratamiento
CREATE TABLE sesion_tratamiento (
    sesion_id int not null,
    observacion nvarchar(100) not null,
    duracion_real nchar(20) not null,
    fecha date not null,
    CONSTRAINT pk_sesion_tratamiento 
	PRIMARY KEY (sesion_id),
    CONSTRAINT fk_sesion_sesiones 
	FOREIGN KEY (sesion_id) 
	REFERENCES sesiones(sesion_id)
);

#Creació}on de tabla material
CREATE TABLE material (
    id_material int not null auto_increment,
    nombre nvarchar(20) not null,
    stock int not null,
    descripcion nvarchar(50) not null,
    unidad_medida int not null,
    CONSTRAINT pk_material 
	PRIMARY KEY (id_material)
);

#Creacion de tabla necesita
CREATE TABLE necesita (
    id_tratamiento int not null,
    id_material int not null,
    CONSTRAINT pk_necesita 
	PRIMARY KEY (id_tratamiento, id_material),
    CONSTRAINT fk_necesita_tratamiento 
	FOREIGN KEY (id_tratamiento) 
	REFERENCES tratamiento(id_tratamiento),
    CONSTRAINT fk_necesita_material 
	FOREIGN KEY (id_material) 
	REFERENCES material(id_material)
);

#Creacióon de tabla utiliza
CREATE TABLE utiliza (
    id_material int not null,
    sesion_id int not null,
    CONSTRAINT pk_utiliza 
	PRIMARY KEY (id_material, sesion_id),
    CONSTRAINT fk_utiliza_material 
	FOREIGN KEY (id_material) 
	REFERENCES material(id_material),
    CONSTRAINT fk_utiliza_sesion 
	FOREIGN KEY(sesion_id) 
	REFERENCES sesiones(sesion_id)
);

#CreaciOn de tabla especialidad
create table especialidad (
    id_especialidad int not null auto_increment,
    nombre_especialidad nvarchar(20) not null,
    CONSTRAINT pk_especialidad 
	PRIMARY KEY (id_especialidad)
);


#Creacion de tabla tiene
CREATE TABLE tiene (
    id_odontologo int not null,
    id_especialidad int not null,
    CONSTRAINT pk_tiene 
	PRIMARY KEY (id_odontologo, id_especialidad),
    CONSTRAINT fk_tiene_odontologo 
	FOREIGN KEY (id_odontologo)
	REFERENCES odontologo(id_odontologo),
    CONSTRAINT fk_tiene_especialidad 
	FOREIGN KEY (id_especialidad) 
	REFERENCES especialidad(id_especialidad)
);


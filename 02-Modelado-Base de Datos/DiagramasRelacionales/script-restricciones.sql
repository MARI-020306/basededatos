-- Crear la base de datos BDrestricciones
CREATE DATABASE bdrestricciones;

-- Utilizar la base de datos bdrestricciones
USE bdrestricciones;

-- Crear la tabla categorias sin restricciones

CREATE TABLE categoria(
categoriaid int,
nombre nvarchar (50)
);

-- Revisar los datos de la tabla categoria
SELECT * FROM categoria;

-- Agregar registros a la tabla categoria
INSERT INTO categoria
VALUES( 1, 'Carnes Frias');

INSERT INTO categoria
VALUES( 2, 'Linea Blanca');

INSERT INTO categoria
VALUES( 1, 'Carnes Frias');

--Eliminar todos los datos de la tabla categoria

DELETE FROM categoria;

-- Eliminar la tabla categoria
DROP TABLE categoria;

CREATE TABLE categoria(
categoriaid int not null,
nombrecategoria nvarchar (50) not null,
constraint pk_categoria
primary key(categoriaid)
);

-- Agregar registros a la tabla categoria
INSERT INTO categoria
VALUES( 1, 'Carnes Frias');

INSERT INTO categoria
VALUES( 2, 'Linea Blanca');

INSERT INTO categoria
VALUES( 3, 'Dulces');

-- Revisar los datos de la tabla categoria
SELECT * FROM categoria;

INSERT INTO categoria
VALUES( 4, 'Dulces');

CREATE TABLE categoria(
categoriaid int not null,
nombrecategoria nvarchar (50) not null,
constraint pk_categoria
primary key(categoriaid), 
constraint unico_nombrecategoria
unique(nombrecategoria)
);

-- Agregar registros a la tabla categoria
INSERT INTO categoria
VALUES( 1, 'Carnes Frias');

INSERT INTO categoria
VALUES( 2, 'Linea Blanca');

INSERT INTO categoria
VALUES( 3, 'Dulces');

-- Revisar los datos de la tabla categoria
SELECT * FROM categoria;

INSERT INTO categoria
VALUES( 4, 'Dulces');

--Crear la tabla producto
CREATE TABLE producto(
productoid int not null,
nombreproducto nvarchar (50) not null,
precio money not null,
existencia int not null,
constraint pk_producto
primary key(productoid), 
constraint unico_nombreproducto
unique(nombreproducto),
constraint chk_precio
check(precio>=1 and precio<=3000), 
constraint chk_existencia
check( existencia>=1)
);

-- Agregar registros a la tabla producto
INSERT INTO producto
VALUES( 1, 'Don Julio', 300, 56);

INSERT INTO producto
VALUES( 2, 'Don Julio2', 300, 56);

INSERT INTO producto
VALUES( 3, 'Don Julio3', 300, 56);

INSERT INTO producto
VALUES( 4, 'Terrible Mezcal', 1, 56);

INSERT INTO producto
VALUES( 5, 'Terrible Mezcal', 1, 3001);

SELECT * FROM producto;

DELETE  FROM producto;
DROP TABLE producto;

--Crear la tabla producto
CREATE TABLE producto(
productoid int not null,
nombreproducto nvarchar (50) not null,
precio money not null,
existencia int not null,
categoriaid int,
constraint pk_producto
primary key(productoid), 
constraint unico_nombreproducto
unique(nombreproducto),
constraint chk_precio
check(precio>=1 and precio<=3000), 
constraint chk_existencia
check( existencia>=1)
);

SELECT * FROM categoria;

INSERT INTO producto
VALUES( 1, 'Mazapan', 10, 100,3);

INSERT INTO producto
VALUES( 2, 'Piruli', 10, 100,null);

INSERT INTO producto
VALUES( 3, 'Transformer', 100, 450,7);

DELETE FROM producto;

--Crear la tabla producto
CREATE TABLE producto(
productoid int not null,
nombreproducto nvarchar (50) not null,
precio money not null,
existencia int not null,
categoriaid int,
constraint pk_producto
primary key(productoid), 
constraint unico_nombreproducto
unique(nombreproducto),
constraint chk_precio
check(precio>=1 and precio<=3000), 
constraint chk_existencia
check( existencia>=1),
constraint fk_producto_categoria
foreign key (categoriaid)
references categoria(categoriaid)
);

INSERT INTO producto
VALUES( 1, 'Mazapan', 10, 100,3);

INSERT INTO producto
VALUES( 2, 'Piruli', 10, 100,null);

INSERT INTO producto
VALUES( 3, 'Transformer', 100, 450,7);


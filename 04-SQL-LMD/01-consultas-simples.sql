--SQL-LMD( select, delete, update, insert)

USE NORTHWND;
GO
SELECT * 
FROM Categories;

SELECT *
FROM Products;

SELECT *
FROM Suppliers;

SELECT *
FROM Customers;

SELECT *
FROM Employees;

SELECT * 
FROM Shippers;

SELECT *
FROM Orders;

SELECT * 
FROM [Order Details];

--Proyeccion 

SELECT CustomerID,CompanyName,City
FROM Customers;

--Alias de columna
SELECT CustomerID AS 'Numero Empleado', CompanyName Empresa, City AS Ciudad, ContactName AS [Nombre del Contacto]
FROM Customers;

--Alias de tabla
SELECT Customers.CustomerID AS [Numero de Cliente],
Customers.CompanyName AS [Empresa],
Customers.ContactName AS [Nombre del Contacto]
FROM Customers;


SELECT C.CustomerID AS [Numero de Cliente],
C.CompanyName AS [Empresa],
C.ContactName AS [Nombre del Contacto]
FROM Customers AS C;

SELECT C.CustomerID AS [Numero de Cliente],
C.CompanyName AS [Empresa],
C.ContactName AS [Nombre del Contacto]
FROM Customers C;

--Campo calculado

SELECT *, (UnitPrice * Quantity) AS [Total] 
FROM [Order Details];

SELECT od.OrderID AS [Numero de Orden],
od.ProductID AS [Numero del producto] ,
od.UnitPrice AS [Precio],
od.Quantity AS [Cantidad],
(UnitPrice * Quantity) AS [Total] 
FROM [Order Details] AS od;


--Seleccionar todos los productos que pertenezcan a la categoria 1 y su valor total de los productos

SELECT p.ProductID AS [Numero], 
p.ProductName AS [Nombre],
p.CategoryID AS [Categoria],
p.UnitPrice AS [Precio],
p.UnitsInStock AS [Cantidad],
(p.UnitPrice * p.UnitsInStock) AS [Costo]
FROM Products AS p
WHERE CategoryID = 1;

--Seleccionar todos los productos de la categoria condiments

SELECT *
FROM Categories;

SELECT p.ProductID AS [Numero], 
p.ProductName AS [Nombre],
p.CategoryID AS [Categoria],
p.UnitPrice AS [Precio],
p.UnitsInStock AS [Cantidad],
(p.UnitPrice * p.UnitsInStock) AS [Costo]
FROM Products AS p
WHERE CategoryID = 2;

-- Seleccionar todos los productos que su precio sea mayor a 40.3 

SELECT p.ProductID AS [Numero], 
p.ProductName AS [Nombre del Producto],
p.UnitPrice AS [Precio]
FROM Products AS p
WHERE p.UnitPrice > 40.3;



-- Seleccionar todos los productos que su precio sea mayor o igual a 40

SELECT p.ProductID AS [Numero], 
p.ProductName AS [Nombre del Producto],
p.UnitPrice AS [Precio]
FROM Products AS p
WHERE p.UnitPrice >= 40;


-- Seleccionar todos los productos que su categoria sea diferente a 3

SELECT p.ProductID AS [Numero], 
p.ProductName AS [Nombre del Producto],
p.UnitPrice AS [Precio]
FROM Products AS p
WHERE p.CategoryID <> 3;


--Seleccionar todas las ordenes que sean de Brasil- Rio de Janeiro, mostrando solo el numero de orden , la fecha de orden, el pais de envio, la ciudad y su transportista

SELECT o.OrderID AS [Numero de Orden],
o.OrderDate AS [Fecha de Orden],
o.ShipCountry AS [Pais de Envio],
o.ShipCity AS [Ciudad],
o.ShipVia AS [Transportista]
FROM Orders AS o
WHERE o.ShipCity = 'Rio de Janeiro' ;



SELECT o.OrderID AS [Numero de Orden],
o.OrderDate AS [Fecha de Orden],
o.ShipCountry AS [Pais de Envio],
o.ShipCity AS [Ciudad],
o.ShipVia AS [Transportista],
o.ShipRegion AS [Region]
FROM Orders AS o
WHERE o.ShipRegion is null ;

SELECT o.OrderID AS [Numero de Orden],
o.OrderDate AS [Fecha de Orden],
o.ShipCountry AS [Pais de Envio],
o.ShipCity AS [Ciudad],
o.ShipVia AS [Transportista],
o.ShipRegion AS [Region]
FROM Orders AS o
WHERE o.ShipRegion is not null ;


--Seleccionar todas la ordenes enviadas a Brazil, Alemania y Mexico y con region

SELECT *
FROM Orders;

SELECT o.OrderID AS [Numero de Orden],
o.OrderDate AS [Fecha de Orden],
o.ShipCountry AS [Pais de Envio],
o.ShipCity AS [Ciudad],
o.ShipVia AS [Transportista],
o.ShipRegion AS [Region]
FROM Orders AS o
WHERE (o.ShipCountry = 'Mexico' or o.ShipCountry= 'Germany' or o.ShipCountry = 'Brazil') and o.ShipRegion is null
--Ordenar alfabeticamente y acendente o descendente
ORDER BY o.ShipCountry ASC, o.ShipCity DESC ;

--Seleccionar todas la ordenes de Francia, Alemania y Argentina (calusual in)

SELECT *
FROM Orders AS o
WHERE o.ShipCountry in ('Germany' , 'France', 'Argentina');

--Seleccionar todos lo productos descontinuados o con precio mayor a a 50 ordenados por precio del mayor la menor

SELECT p.ProductID AS [Numero], 
p.ProductName AS [Nombre],
p.CategoryID AS [Categoria],
p.UnitPrice AS [Precio],
p.Discontinued AS [Descontinuado],
(p.UnitPrice * p.UnitsInStock) AS [Costo]
FROM Products AS p
WHERE p.Discontinued=1 and p.UnitPrice > 50 
ORDER BY p.UnitPrice DESC ;

SELECT p.ProductID AS [Numero], 
p.ProductName AS [Nombre],
p.CategoryID AS [Categoria],
p.UnitPrice AS [Precio],
p.Discontinued AS [Descontinuado],
(p.UnitPrice * p.UnitsInStock) AS [Costo]
FROM Products AS p
WHERE p.Discontinued=1 or p.UnitPrice > 50 
ORDER BY p.UnitPrice DESC ;


--Seleccionar los empleados que fueron contratados despues de 1994,
--Nombre completo y fecha de contratacion 

SELECT FirstName, LastName, HireDate
FROM Employees;

SELECT (FirstName + ' ' + LastName) AS [Nombre Completo],
HireDate AS [Fecha de Contratacion]
FROM Employees
WHERE HireDate>'1994-12-31';


SELECT CONCAT(FirstName , ' ' ,LastName) AS [Nombre Completo],
HireDate AS [Fecha de Contratacion], YEAR(HireDate)  AS [Año de Contratacion],
MONTH(HireDate) AS [Mes de Contratacion], DAY(HireDate) AS [Dia de Contratacion]
FROM Employees
WHERE YEAR(HireDate)>1993;
SELECT MAX(HireDate) FROM Employees;
SELECT GETDATE();

--Mostrar los empleados que fueron contratados en abril

SELECT CONCAT(FirstName , ' ' ,LastName) AS [Nombre Completo],
HireDate AS [Fecha de Contratacion], YEAR(HireDate)  AS [Año de Contratacion],
MONTH(HireDate) AS [Mes de Contratacion], DAY(HireDate) AS [Dia de Contratacion]
FROM Employees
WHERE MONTH(HireDate)=4;

SELECT CONCAT(FirstName , ' ' ,LastName) AS [Nombre Completo],
HireDate AS [Fecha de Contratacion], DATEPART(YEAR,HireDate)  AS [Año de Contratacion],
DATEPART(mm,HireDate) AS [Mes de Contratacion], DATEPART(d,HireDate) AS [Dia de Contratacion],
DATEPART(QUARTER, HireDate) AS [Trimestre],
DATENAME(WEEKDAY, HireDate) AS [Dia],
DATENAME(MONTH, HireDate) AS [Mes]
FROM Employees
WHERE MONTH(HireDate)=4;

--Seleccionar los productos que no estan descontinuados, mostrando
--solamente el nombre del producto y el campo descontinuado

SELECT  p.ProductName AS [Nombre],
p.Discontinued AS [Descontinuado]
FROM Products AS p
WHERE p.Discontinued=0;

--Seleccionar los proveedores que no son de USA

SELECT CompanyName AS [Empresa], ContactName AS [Contacto]
FROM Suppliers
WHERE Country <> 'USA';

SELECT CompanyName AS [Empresa], ContactName AS [Contacto]
FROM Suppliers
WHERE Country != 'USA';

--Seleccionar los productos caros y con bajo stock, con precios mayores
--a 50 y stock menor a 20

SELECT ProductName AS [Nombre Producto], SupplierID AS [Proveedor],
UnitsInStock AS [En Existencia], UnitPrice AS [Precio Unitario]
FROM Products
WHERE UnitPrice>50 and UnitsInStock<20;

SELECT ProductName AS [Nombre Producto], Suppliers.SupplierID AS [Proveedor],
Suppliers.CompanyName AS [Nombre del Proveedor],
UnitsInStock AS [En Existencia], UnitPrice AS [Precio Unitario]
FROM Products, Suppliers
WHERE (Products.SupplierID= Suppliers.SupplierID)
and UnitPrice>50 and UnitsInStock<20;

SELECT ProductName AS [Nombre Producto], s.SupplierID AS [Proveedor],
s.CompanyName AS [Nombre del Proveedor],
UnitsInStock AS [En Existencia], UnitPrice AS [Precio Unitario]
FROM Products AS p, Suppliers AS s
WHERE (p.SupplierID= s.SupplierID)
and UnitPrice>50 and UnitsInStock<20;

SELECT ProductName AS [Nombre Producto], s.SupplierID AS [Proveedor],
s.CompanyName AS [Nombre del Proveedor],
UnitsInStock AS [En Existencia], UnitPrice AS [Precio Unitario]
FROM Products AS P
INNER JOIN 
Suppliers AS S
ON P.SupplierID= S.SupplierID
WHERE (p.SupplierID= s.SupplierID)
and UnitPrice>50 and UnitsInStock<20;


SELECT * FROM Suppliers
WHERE SupplierID=18;

--Clientes de mexico y españa

SELECT c.CompanyName AS [Cliente], c.City AS [Ciudad],
c.Country AS [Pais], c.Region AS [Region]
FROM 
Customers AS c
WHERE (Country ='Mexico' OR Country='Spain')
AND Region is null;

--Productos que no estan descontinuados y tienen inventario

SELECT p.ProductName AS [Nombre Producto], p.UnitsInStock AS [Existencia],
p.UnitPrice AS [Precio], p.Discontinued,
(p.UnitPrice * p.UnitsInStock) AS [Precio del Inventario]
FROM Products AS p
WHERE p.Discontinued=1 AND p.UnitsInStock>0;


--Proveedores que no son de Estados Unidos y Reino Unido

SELECT s.CompanyName AS [Empresa], s.City AS [Ciudad],
s.Country AS [Pais]
FROM 
Suppliers AS s
WHERE not (s.Country= 'USA' OR s.Country= 'UK');

SELECT s.CompanyName AS [Empresa], s.City AS [Ciudad],
s.Country AS [Pais]
FROM 
Suppliers AS s
WHERE s.Country <> 'USA' AND s.Country<> 'UK';

--Order by
--Seleccionar todos los proveedores mostrando el nombre del proveedor, el pais, la ciudad ordenada por pais de menor a mayor

SELECT s.CompanyName AS [Empresa], s.Country AS [Pais], s.City AS [Ciudad]
FROM Suppliers AS s
ORDER BY s.Country ASC;

SELECT s.CompanyName AS [Empresa], s.Country AS [Pais], s.City AS [Ciudad]
FROM Suppliers AS s
ORDER BY s.Country DESC;

--Seleccionar todos los proveedores mostrando el nombre del proveedor, el pais, la ciudad ordenada por pais de mayor a menor y dentro
--del pais por ciudad de menor a mayor

SELECT s.CompanyName AS [Empresa], s.Country AS [Pais], s.City AS [Ciudad]
FROM Suppliers AS s
ORDER BY s.Country DESC, s.City ASC;

SELECT DATEPART(YEAR, '2025-07-23');
SELECT DATEPART(YEAR,GETDATE());
SELECT DATEPART(YY,GETDATE());
SELECT DATEPART(YYYY,GETDATE());
SELECT DATEPART(Q,GETDATE());

--Selccionar todas aquellas ordenes que se realizaron en 1998

SELECT OrderID AS [Numero de Orden] ,OrderDate AS [Ordenes], ShipCity AS [Cuidad], ShipCountry AS [Pais] 
FROM Orders
WHERE YEAR(OrderDate)=1998;


SELECT max(year(OrderDate))
FROM Orders;

-- Seleccionar todas la ordene que se hicieron en el trimestre 3 del año

SELECT OrderID AS [Numero de Orden] , ShipCity AS [Cuidad], ShipCountry AS [Pais],
DATEPART (YYYY,OrderDate) AS [Año],
DATENAME(MONTH, OrderDate) AS 'Nombre del Mes',
DATEPART(MONTH, OrderDate) AS 'Numero del Mes',
DATENAME(WEEKDAY, OrderDate) AS 'Nombre del Dia'
FROM Orders
WHERE DATEPART(q, OrderDate)=3;

--Seleccionar los paises de nuestros clientes usando disting que elimina datos repetidos
SELECT DISTINCT Country AS [Pais del Cliente], City AS [Ciudad]
FROM Customers
ORDER BY Country;

--Seleccionar todos los paises y ciudades unicas de los prevedores

SELECT DISTINCT Country AS [Pais del Proveedor], City AS [Ciudad]
FROM Suppliers
ORDER BY Country;

-- Mostrar las fechas distintas de compra
SELECT DISTINCT OrderDate AS [Fecha de Compra]
FROM Orders
ORDER BY OrderDate;

-- Mostrar las categorias distintas de los productos

SELECT DISTINCT CategoryID  AS [Numero de Categoria], ProductName AS [Nombre del Producto]
FROM Products
ORDER BY CategoryID;

--Seleccionar todas las ordenes con mas de 30 dias desde la fecha requerida, hasta la fecha de pedido

SELECT OrderDate AS [Fecha de Pedido], RequiredDate AS [Fecha requerida],
DATEDIFF(DAY,OrderDate,RequiredDate) AS 'Dias'
FROM Orders
WHERE DATEDIFF(DAY,OrderDate,RequiredDate)> 30;



--Selccionar todos los productos cuyo precio unitario con un impuesto del 20% sea mayor a 30

SELECT * 
FROM Products
WHERE UnitPrice * 1.20 >30;

--Seleccionar todas la ordenes cuyo total es mayor a 100

SELECT *, (UnitPrice * Quantity) AS [TOTAL]
FROM [Order Details]
WHERE (UnitPrice * Quantity) > 100;

-- Test de Rango (between)
--Seleccionar los productos con un precio entre 20 y 50 unidades monetarias

SELECT *
FROM Products
WHERE UnitPrice>= 20 and UnitPrice<=30;

SELECT *
FROM Products
WHERE UnitPrice BETWEEN 20 AND 30;

--Utilizar la base de datos bdejemplo2
USE BDEJEMPLO2;
--Listar los diferentes puestos de los representantes (Distinct)
SELECT DISTINCT Puesto
FROM Representantes;

--Seleccionar los paises en donde tenemos clientes
SELECT DISTINCT country 
FROM customers;

--Ordenar los paises y ciudades unicas de cada cliente
SELECT DISTINCT country, city 
FROM customers
ORDER BY country;

--Listar los 5 pedidos con importe mas alto
SELECT TOP 5 Num_Pedido, Fecha_Pedido, Fab, Producto, Cantidad, Importe
FROM Pedidos
ORDER BY importe DESC;
SELECT TOP 5 Num_Pedido, Fecha_Pedido, Fab, Producto, Cantidad, Importe
FROM Pedidos
ORDER BY 6 DESC;

SELECT TOP 5 Num_Pedido, Fecha_Pedido, Fab, Producto, Cantidad, Importe AS [Total]
FROM Pedidos
ORDER BY [Total] DESC;


--Listar los 5 pedidos con importe mas alto en MYSQL
--SELECT Num_Pedido, Fecha_Pedido, Fab, Producto, Cantidad, Importe
--FROM Pedidos
--ORDER BY pedido DESC
--LIMIT 5;


--Test de encaje de patrones
--Seleccionar todos los clientes que comiencen con A

SELECT*
FROM Clientes
WHERE Empresa LIKE 'A%';

--Seleccionar todos los clientes que terminen con l
SELECT*
FROM Clientes
WHERE Empresa LIKE '%l';

--Seleccionar todos los clientes que comiencen con A y termine con e
SELECT*
FROM Clientes
WHERE Empresa LIKE 'A%e';

----Seleccionar todos los clientes que tengan la palabra "er" en cualquier lugar

SELECT*
FROM Clientes
WHERE Empresa LIKE '%er%';

--Uso de patron _ (subrayado) no importa con que letra empiece pero debe contener una a despues
SELECT*
FROM Clientes
WHERE Empresa LIKE '_A%';

--Para encontrar clientes de un cierto rango de letras
SELECT*
FROM Clientes
WHERE Empresa LIKE '[A-D]%';
--Para negar lo que este en los corchetes
SELECT*
FROM Clientes
WHERE Empresa LIKE '[^abcx]%';


SELECT*
FROM Clientes
WHERE Empresa LIKE '_organ';

INSERT INTO Clientes
VALUES
(2126, 'Morgan', 108, 678),
(2127, 'Porgan', 108, 778);

--Hallar todos lor representantes que o bien: 
--a)Trabajan en Daimiel, Navarra o Castellon, o bien:
--b)No tienen jefe, y estan contratados desde junio de 1988; o
--c)Superan su cuota pero tienen ventas de 600,000 o menos.

SELECT Nombre, Jefe, Cuota, Ventas, Fecha_Contrato, Oficina_Rep
FROM Representantes
WHERE (Oficina_Rep IN(11,12,22)) OR (Jefe IS NULL AND Fecha_Contrato>='1988-06-01')
OR (Ventas>Cuota AND NOT Ventas>600000)
ORDER BY Ventas DESC;

--Resolucion de la misma consulta con inner join
SELECT r.Nombre, r.Jefe, r.Cuota, r.Ventas, r.Fecha_Contrato, Oficina_Rep, o.Ciudad
FROM Representantes AS r
INNER JOIN Oficinas AS o
ON o.Oficina= r.Oficina_Rep
WHERE (o.Ciudad IN('Navarra','Castellón','Daimiel')) OR (r.Jefe IS NULL AND r.Fecha_Contrato>='1988-06-01')
OR (r.Ventas>Cuota AND NOT r.Ventas>600000)
ORDER BY r.Ventas DESC;

--Listar todos los pedidos mostrando el numero de pedido, importe, nombre y limite de credito del cliente
SELECT p.Num_Pedido AS [Numero Pedido], p.Importe AS [Total], c.Empresa AS [Cliente], c.Limite_Credito AS [Limite Credito]
FROM Pedidos AS p
INNER JOIN Clientes AS c
ON c.Num_Cli = p.Cliente
ORDER BY Importe DESC;

SELECT p.Num_Pedido AS [Numero Pedido], p.Importe AS [Total], c.Empresa AS [Cliente], c.Limite_Credito AS [Limite Credito]
FROM Pedidos AS p
INNER JOIN Clientes AS c
ON c.Num_Cli = p.Cliente
WHERE Limite_Credito BETWEEN 25000 AND 50000
AND Empresa LIKE 'A%'
ORDER BY Importe DESC;


SELECT* FROM Oficinas;


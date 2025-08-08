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


--Consultas Avanzadas
USE BDEJEMPLO2;

SELECT r.Nombre, r.Jefe, r.Cuota, r.Ventas, r.Fecha_Contrato, Oficina_Rep, o.Ciudad
FROM Representantes AS r
INNER JOIN Oficinas AS o
ON o.Oficina= r.Oficina_Rep
WHERE (o.Ciudad IN('Navarra','Castell�n','Daimiel')) OR (r.Jefe IS NULL AND r.Fecha_Contrato>='1988-06-01')
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

--Sleccionar los preductos incluyendo su categoria y el proveedor que lo surte

USE NORTHWND;

SELECT ProductID, ProductName, UnitPrice, UnitsInStock, CategoryID, SupplierID
FROM Products;

--Uso de join
SELECT ProductID AS [Numero Producto], ProductName AS [Nombre Producto], UnitPrice AS [Precio], 
UnitsInStock AS [Existencia], CategoryID AS [Categoria], SupplierID AS [Proveedor]
FROM Products;

SELECT Products.ProductID AS [Numero Producto], Products.ProductName AS [Nombre Producto], Products.UnitPrice AS [Precio], 
Products.UnitsInStock AS [Existencia], Categories.CategoryID AS [Categoria]
FROM Products
INNER JOIN Categories
ON Products.CategoryID=Categories.CategoryID;

SELECT pr.ProductID AS [Numero Producto], pr.ProductName AS [Nombre Producto], pr.UnitPrice AS [Precio], 
pr.UnitsInStock AS [Existencia], ca.CategoryID AS [Categoria], su.SupplierID AS [Numero Proveedor] ,su.CompanyName AS [Proveedor]
FROM Products AS pr
INNER JOIN Categories AS ca
ON pr.CategoryID= ca.CategoryID
INNER JOIN Suppliers AS su
ON pr.SupplierID = su.SupplierID;

USE pruebajoins;

SELECT *
FROM Categorias;

SELECT *
FROM Productos;

--INNER JOIN
SELECT c.IdCategoria, c.Nombre, p.Nombre, p.Precio
FROM Categorias AS c
INNER JOIN Productos AS p
ON c.IdCategoria= p.IdCategoria;

--LEFT JOIN
SELECT c.IdCategoria, c.Nombre, p.Nombre, p.Precio
FROM Categorias AS c
LEFT JOIN Productos AS p
ON c.IdCategoria= p.IdCategoria;

--RIGHT JOIN
SELECT c.IdCategoria, c.Nombre, p.Nombre, p.Precio
FROM Categorias AS c
RIGHT JOIN Productos AS p
ON c.IdCategoria= p.IdCategoria;

--Mostrar todas las categorias que no tiene producto asignado
SELECT c.IdCategoria, c.Nombre, p.Nombre, p.Precio, p.IdProducto
FROM Categorias AS c
LEFT JOIN Productos AS p
ON c.IdCategoria= p.IdCategoria
WHERE p.IdProducto IS NULL;

SELECT c.IdCategoria, c.Nombre, p.Nombre, p.Precio
FROM Categorias AS c
RIGHT JOIN Productos AS p
ON c.IdCategoria= p.IdCategoria
WHERE c.IdCategoria IS NULL;

SELECT c.IdCategoria, c.Nombre, p.Nombre, p.Precio
FROM Categorias AS c
FULL JOIN Productos AS p
ON c.IdCategoria= p.IdCategoria

--Listar las oficinas y los nombres y puestos de sus jefes

USE BDEJEMPLO2;

SELECT*
FROM Oficinas;

SELECT r.Num_Empl,r.Nombre, r.Jefe,r.Puesto,r.Oficina_Rep, o.Ciudad
FROM Representantes AS r
INNER JOIN Oficinas AS o
ON r.Num_Empl= o.Jef;

--Listar las oficinas y los nombres y puestos de sus jefes con un objetivo superior a 600000
SELECT r.Num_Empl,r.Nombre, r.Jefe,r.Puesto,r.Oficina_Rep, o.Ciudad,o.Objetivo
FROM Representantes AS r
INNER JOIN Oficinas AS o
ON r.Num_Empl= o.Jef
WHERE o.Objetivo > 600000;

--listar todos los pedidos, mostrando el numero d pedido, el importe y la descripcion de los productos
SELECT p.Num_Pedido , p.Importe, pr.Descripcion
FROM Pedidos AS p
INNER JOIN Productos AS pr
ON p.Fab  = pr.Id_fab and p.Producto= pr.Id_producto;

--listar los pedidos superiores a 25000, incluyendo el numero de pedido, importe, 
--nombre del representante quev tomo la nota del pedido y el nombre del cliente
SELECT pe.Num_Pedido AS [Numero Pedido],
pe.Importe AS [Total],
rp.Nombre AS [Nombre Representante],
cli.Empresa AS [Nombre del Cliente]
FROM Pedidos AS pe
INNER JOIN Clientes AS cli
ON pe.Cliente= cli.Num_Cli
INNER JOIN Representantes AS rp
ON rp.Num_Empl = pe.Rep
WHERE pe.Importe>25000;

--listar todos los pedidos superiores a 25000 mostrando el numero de pedido, el nombre del 
--cliente que lo encargo y el nombre del representante asignado al cliente

SELECT pe.Num_Pedido AS [Numero Pedido],
pe.Importe AS [Total],
rp.Nombre AS [Nombre Representante],
cli.Empresa AS [Nombre del Cliente]
FROM Pedidos AS pe
INNER JOIN Clientes AS cli
ON pe.Cliente= cli.Num_Cli
INNER JOIN Representantes AS rp
ON rp.Num_Empl = cli.Rep_Cli
WHERE pe.Importe>25000;

--listar todos los pedidos superiores a 25000 mostrando el numero de pedido, el nombre del 
--cliente que lo encargo y el nombre del representante asignado al cliente y la oficina en la que trabaja el representante

SELECT pe.Num_Pedido AS [Numero Pedido],
pe.Importe AS [Total],
rp.Nombre AS [Nombre Representante],
cli.Empresa AS [Nombre del Cliente],
ofi.Ciudad AS [Nombre del la Oficina]
FROM Pedidos AS pe
INNER JOIN Clientes AS cli
ON pe.Cliente= cli.Num_Cli
INNER JOIN Representantes AS rp
ON rp.Num_Empl = cli.Rep_Cli
INNER JOIN Oficinas AS ofi
ON ofi.Oficina= rp.Oficina_Rep
WHERE pe.Importe>25000;

--Listar los nombres de los empleados y sus jefes
SELECT sub.Nombre AS [Empleado],
jefe.Nombre AS [Jefe]
FROM Representantes AS jefe
INNER JOIN Representantes AS sub
ON jefe.Num_Empl=sub.Jefe;

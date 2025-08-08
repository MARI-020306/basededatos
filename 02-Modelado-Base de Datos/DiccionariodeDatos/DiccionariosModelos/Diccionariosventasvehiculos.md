# 📘 Diccionario de Datos
## Tabla Sucursal

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumeroSucursal`     | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                                       | -                                | Identificador de Sucursal               |
| `NombreSucursal`        | NVARCHAR      | 20    | ❌  | ❌  | ❌   | ✅    | -         | -                                | Nombre de la Sucursal            |
| `Ubicacion`          | NVARCHAR          |20 -      | ❌  | ❌  | ❌   | ✅    | -| -                            | Ubicacion de la sucursal                        |

## Tabla Clientes

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumeroCliente`     | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                                       | -                                | Identificador de Cliente              |
| `Nombre`        | NVARCHAR      | 20    | ❌  | ❌  | ❌   | ✅    | -         | -                                | Nombre del Cliente            |
| `Apellido1`          | NVARCHAR          |20       | ❌  | ❌  | ❌   | ✅    | -| -                            | Apellido paterno del cliente 
| `Apellido2`          | NVARCHAR          |20       | ❌  | ❌  | ❌   | ✅    | -| -                            | Apellido materno del cliente 
| `CURP`          | NVARCHAR          |18      | ❌  | ❌  | ❌   | ✅    | -| -                            | Clave única que identifica a cada cliente
| `Telefono`          | NCHAR          |10    | ❌  | ❌  | ❌   | ✅    | -| -                            | Numero telefonico para contactar al cliente
| `Calle`          | NVARCHAR          |50      | ❌  | ❌  | ❌   | ❌    | -| -                            | Calle o Avenida para localizar al cliente
| `Numero`          | INT          |-    | ❌  | ❌  | ❌   | ❌    | -| -                            | Numero exterior o interior del domicilio del cliente
| `Ciudad`          | NVARCHAR          |50      | ❌  | ❌  | ❌   | ❌    | -| -                            | Ciudad originaria del cliente

## Tabla Vehiculo

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumeroVehiculo`     | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                                       | -                                | Identificador del Vehiculo             |
| `Placa`        | NCHAR      | 7    | ❌  | ❌  | ❌   | ✅    | -         | -                                | Numero de placa del vehiculo           |
| `Marca`          | NVARCHAR          |15      | ❌  | ❌  | ❌   | ❌   | -| -                            | Marca del vehiculo                      |          |
| `Modelo`          | NVARCHAR          |20       | ❌  | ❌  | ❌   | ❌   | -| -                            | Modelo del vehiculo                      |          |
| `NumeroCliente`          | INT         |-      | ❌  | ✅  | ❌   | ❌   | -|Cliente (Numero cliente)                       | El cliente que rento el vehiculo
| `NumeroSucursal`          | INT         |-      | ❌  | ✅  | ❌   | ❌   | -|Sucursal (Numero sucursal)                       | La sucursal que ofrecio el vehiculo

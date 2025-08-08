# 📘 Diccionario de Datos
## Tabla Employee

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `SSN`     | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                                       | -                                | Identificador del empleado           |
| `Firstname`        | NVARCHAR      | 20    | ❌  | ❌  | ❌   | ✅    | -         | -                                | Nombre del lector          |
| `Lastname`          | NVARCHAR          |20     | ❌  | ❌  | ❌   | ✅    | -| -                            | Apellido paterno del empleado                       |
| `Address`          | NVARCHAR          |100     | ❌  | ❌  | ❌   | ❌   | -| -                            | Direccion del empleado                     |                   |
| `Birthdate`          | DATE         |-      | ❌  | ❌  | ❌   | ❌   | -| -                            | Fecha de nacimiento del empleado  |          |
| `Salary`          | MONEY         |-      | ❌  | ❌  | ❌   | ❌   | -| -                            | Salario base del empleado     |          |
| `Sex`          | NVARCHAR         |20     | ❌  | ❌  | ❌   | ✅   | -| -                            | Genero del empleado                      |          |
| `Numberdepto`     | INT          | -      | ✅  | ❌  | ❌   | ❌    | -                                       | -                                | Numero del departamento en el que se labora el empleado  |
| `Supervisor`     | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                                       | -                                | Empleado que supervisa un cierto grupo de empleados           |


## Tabla Departament

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumberDepartament`     | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                                       | -                                | Identificador del deparamento           |
| `NameDepartament`          | NVARCHAR         |20     | ❌  | ❌  | ❌   | ✅   | -| -                            | Nombre del departamento                     |          |
| `Strartdate`          | DATE         |-      | ❌  | ❌  | ❌   | ❌   | -| -                            | Fecha de creación del departamento                     |          |
| `SSN`          | INT         |-      | ❌  | ✅  | ❌   | ❌   | -|Employee (SSN)   | | Identificador  del empleado     |          | 

## Tabla Deplocation

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `Numberdepart`     | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                                       | -                                | Identificador de la ubicacion del departamento         |
| `Dlocation`        | NVARCHAR      | 30    | ❌  | ❌  | ❌   | ✅   | -         | -                                | Ubicacion del departamento        |

## Tabla Dependent

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `Name`          | NVARCHAR         |30     | ❌  | ❌  | ❌   | ✅   | -| -                            | Nombre del dependiente                     |          |
| `Relationship`          | NVARCHAR         |30     | ❌  | ❌  | ❌   | ✅   | -| -                            | Relacion del empleado con el dependiente                     |          |
| `Sex`          | NVARCHAR         |30     | ❌  | ❌  | ❌   | ✅   | -| -                            | Relacion del empleado con el dependiente                     |          |
| `Strartdate`          | DATE         |-      | ❌  | ❌  | ❌   | ❌   | -| -                            | Fecha de inicio de la dependencia                   |          |
| `SSN`          | INT         |-      | ❌  | ✅  | ❌   | ❌   | -|Employee (SSN)   | | Identificador  del empleado     |          |

## Tabla Work_on

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `SSN`          | INT         |-      | ❌  | ✅  | ❌   | ❌   | -|Employee (SSN)   |  Identificador  del empleado     |          |
| `NumberProject`          | INT         |-      | ❌  | ✅  | ❌   | ❌   | -|Project (Number project)    | Identificador  del proyecto         |
| `Hours`     | INT          | -      | ❌ | ❌  | ❌   | ❌    | -                                       | -                                | Total de horas que trabajo el empleado en el proyecto       |


## Tabla Project

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumberProject`     | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                                       | -                                | Identificador del proyecto           |
| `NameProject`          | NVARCHAR         |30     | ❌  | ❌  | ❌   | ✅   | -| -                            | Nombre del proyecto                    |          |
| `Location`          | NVARCHAR         |30     | ❌  | ❌  | ❌   | ✅   | -| -                            | Ubicacion del departamento donde se lleva a cabo el proyecto                    |          |
| `NumberDepartment`          | INT         |-      | ❌  | ✅  | ❌   | ❌   | -|Deparment (Number deparment)    | Identificador  del departamento     |          | 
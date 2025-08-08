# 📘 Diccionario de Datos
## Tabla Lector

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumeroLector`     | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                                       | -                                | Identificador del lector            |
| `Nombre`        | NVARCHAR      | 20    | ❌  | ❌  | ❌   | ✅    | -         | -                                | Nombre del lector          |
| `Apellido1`          | NVARCHAR          |20     | ❌  | ❌  | ❌   | ✅    | -| -                            | Apellido paterno del lector                       |
| `Apellido2`          | NVARCHAR          |20     | ❌  | ❌  | ❌   | ✅    | -| -                            | Apellido materno del lector                     |                   |

## Tabla Presta

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumeroLector`          | INT         |-      | ❌  | ✅  | ❌   | ❌   | -|Lector (Numero lector)                       | El lector que solicito el libro
| `NumeroLibro`          | INT         |-      | ❌  | ✅  | ❌   | ❌   | -|Libro (Numero libro)                       | El libro prestado al lector        |
| `FechaPrestamo`          | DATE         |-      | ❌  | ❌  | ❌   | ❌   | -| -                            | Fecha en la que se le presto el libro al lector                      |          |

## Tabla Libro

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumeroLibro`     | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                                       | -                                | Identificador del libro         |
| `Titulo`        | NVARCHAR      | 20    | ❌  | ❌  | ❌   | ❌    | -         | -                                | Titulo del libro         |
| `Autor`          | NVARCHAR         |20    | ❌  | ❌  | ❌   | ❌   | -| -                            | Autro que escribio el libro                       |
| `NumeroISBN`        | INT      | -    | ❌  | ❌  | ❌   | ✅    | -         | -                                | Numero que identifiac a un libro publicado   |
| `Cantidad`          | NVARCHAR         |20    | ❌  | ❌  | ❌   | ❌   | -| -                            | Cantidad de libros que estan en stock en la biblioteca                       |
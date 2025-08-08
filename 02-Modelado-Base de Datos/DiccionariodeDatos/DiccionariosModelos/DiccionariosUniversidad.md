# 📘 Diccionario de Datos
## Tabla Alumno

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumeroAlumno`     | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                                       | -                                | Identificador del Paciente            |
| `Nombre`        | NVARCHAR      | 20    | ❌  | ❌  | ❌   | ✅    | -         | -                                | Nombre del alumno           |
| `Apellido1`          | NVARCHAR          |20     | ❌  | ❌  | ❌   | ✅    | -| -                            | Apellido paterno del alumno                       |
| `Apellido2`          | NVARCHAR          |20     | ❌  | ❌  | ❌   | ✅    | -| -                            | Apellido materno del alumno                       |
| `Matricula`          | INT         |-     | ❌  | ❌  | ❌   | ✅    | -| -                            | Numero de identificación escolar del alumno                       |

## Tabla Inscripcion

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumeroAlumno`          | INT         |-      | ❌  | ✅  | ❌   | ❌   | -|Alumno (Numero alumno)                       | El alumno que se inscribio al curso
| `NumeroCurso`          | INT         |-      | ❌  | ✅  | ❌   | ❌   | -|Curso (Numero curso)                       | El curso al que se inscribio el alumno        |

## Tabla Curso

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumeroCurso`     | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                                       | -                                | Identificador del Curso           |
| `Nombre`        | NVARCHAR      | 20    | ❌  | ❌  | ❌   | ✅    | -         | -                                | Nombre del curso          |
| `Codigo`          | INT          |-    | ❌  | ❌  | ❌   | ✅    | -| -                            | Codigo de busqueda rapida del curso                       |

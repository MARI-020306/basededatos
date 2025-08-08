# 📘 Diccionario de Datos

## Tabla Medico

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumeroDoctor`     | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                                       | -                                | Identificador del Medico           |
| `Nombre`        | NVARCHAR      | 20    | ❌  | ❌  | ❌   | ✅    | -         | -                                | Nombre del medico.            |
| `Apellido1`          | NVARCHAR          |20     | ❌  | ❌  | ❌   | ✅    | -| -                            | Apellido paterno del medico                       |
| `Apellido2`          | NVARCHAR          |20     | ❌  | ❌  | ❌   | ✅    | -| -                            | Apellido materno del medico                       |
| `NumeroCedula`          | INT        |-     | ❌  | ❌  | ❌   | ✅    | -| -                            |Numero que avala legalmente al médico para ejercer


## Tabla Atiende

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumeroPaciente`          | INT         |-      | ❌  | ✅  | ❌   | ❌   | -|Paciente (Numero paciente)                       | El paciente que asistio a consulta
| `NumeroDoctor`          | INT         |-      | ❌  | ✅  | ❌   | ❌   | -|Medico (Numero medico)                       | El medico que atendio al paciente
| `Fecha`          | DATE         |-      | ❌  | ❌  | ❌   | ❌   | -| -                            | Fecha de la consulta del paciente                      |          |
| `Diagnostico`          | NVARCHAR          |100       | ❌  | ❌  | ❌   | ❌   | -| -                            | El diagnostico dado por el medico al paciente                   |          |

## Tabla Paciente

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumeroPaciente`     | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                                       | -                                | Identificador del Paciente            |
| `Nombre`        | NVARCHAR      | 20    | ❌  | ❌  | ❌   | ✅    | -         | -                                | Nombre del paciente            |
| `Apellido1`          | NVARCHAR          |20     | ❌  | ❌  | ❌   | ✅    | -| -                            | Apellido paterno del paciente                        |
| `Apellido2`          | NVARCHAR          |20     | ❌  | ❌  | ❌   | ✅    | -| -                            | Apellido materno del paciente                        |
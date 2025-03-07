
# Proyecto SQL: Carreras de Fórmula 1

Este proyecto contiene una serie de consultas SQL que permiten analizar y gestionar información relacionada con carreras de Fórmula 1. Los ejercicios están diseñados para consultar, modificar, y administrar una base de datos que almacena datos sobre pilotos, carreras, constructores, clasificaciones, y otros aspectos técnicos de los eventos.

## Estructura del Proyecto

El proyecto se organiza en archivos `.sql` independientes para cada tipo de ejercicio:

- **Consultas SQL**: Incluye consultas sobre datos específicos, como pilotos, constructores y resultados de carreras.
- **Procedimientos Almacenados**: Define procedimientos para realizar operaciones más complejas.
- **Funciones Almacenadas**: Proporciona funciones para cálculos específicos.
- **Triggers**: Contiene disparadores que aseguran la integridad de los datos según las reglas de negocio de la base de datos.

Cada archivo `.sql` contiene comentarios que describen el propósito de la consulta y cualquier detalle específico sobre su implementación.

## Requisitos

- **Servidor de Base de Datos MySQL** (versión 5.7 o superior recomendada)
- Cliente de línea de comandos de MySQL o un gestor de base de datos como **MySQL Workbench** o **DBeaver**
- **Git** para la gestión de versiones

## Instalación

1. Clona el repositorio:

   ```bash
   git clone https://github.com/javierdesant/mySQL.git
   cd mySQL
   ```

2. Importa el esquema de la base de datos en tu servidor de MySQL:

   ```
   source formula-1.sql;
   ```

## Ejercicios Resueltos

### 1. Consultas SQL

Dentro de `queries/`, se encuentran consultas que resuelven ejercicios como:
- Obtener nombres de pilotos españoles.
- Listar circuitos en países específicos.
- Encontrar constructores con más de 50 pilotos en su historial.

Cada consulta se puede ejecutar independientemente. Abre y ejecuta el archivo deseado en el cliente SQL de tu elección.

### 2. Procedimientos Almacenados

Los procedimientos almacenados permiten realizar operaciones avanzadas. Ejemplos incluyen:
- `getRacesInAYear`: Obtiene el nombre de las carreras y el número de constructores en un año específico.
- `getOnRaceMessages`: Muestra mensajes de carrera personalizados basados en un código de mensaje.

Ejecuta los archivos en `procedures/` para crear los procedimientos en tu base de datos.

### 3. Funciones Almacenadas

Las funciones almacenadas están en el directorio `functions/`, incluyendo:
- Cálculo de puntos para campeones.
- Promedio de puntos anuales por constructor.

### 4. Triggers

Los disparadores en `triggers/` aseguran reglas de negocio, como:
- Limitar a dos pilotos por equipo.
- Registrar incidentes en una tabla `crashes`.

## Ejecución

1. Accede al cliente de MySQL y selecciona la base de datos:

   ```sql
   USE formula1;
   ```

2. Ejecuta cualquiera de los archivos `.sql` de consultas, procedimientos, funciones o triggers.

## Contribuciones

Las contribuciones son bienvenidas. Puedes realizar un **fork** del proyecto, crear tu rama con las mejoras, y enviar un **pull request**.

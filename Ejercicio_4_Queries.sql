# UD-16 Ejercicio 4

USE actividades;

# Query 4.1
SELECT nombre FROM peliculas;

# Query 4.2
SELECT DISTINCT calificacionedad FROM peliculas;

# Query 4.3
SELECT nombre
FROM peliculas
WHERE calificacionedad IS NULL;

# Query 4.4
SELECT * FROM salas
WHERE pelicula IS NULL;

# Query 4.5
SELECT salas.*, peliculas.*
FROM salas
INNER JOIN peliculas
ON salas.pelicula = peliculas.codigo;

# Query 4.6
SELECT peliculas.*, salas.*
FROM salas
INNER JOIN peliculas
ON salas.pelicula = peliculas.codigo;

# Query 4.7
SELECT peliculas.nombre 
FROM peliculas
LEFT JOIN salas
ON salas.pelicula = peliculas.codigo
WHERE salas.pelicula IS NULL;

# Query 4.8
INSERT INTO peliculas(codigo, nombre, calificacionedad) VALUES
(10, "Uno, Dos, Tres", 7);

# Query 4.9
UPDATE peliculas
SET calificacionedad = 13
WHERE calificacionedad IS NULL;

# Query 4.10
DELETE FROM salas
WHERE pelicula IN (
SELECT codigo
FROM peliculas
WHERE calificacionedad = "G"
);
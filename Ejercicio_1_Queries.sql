# UD-16 Ejercicio 1

USE actividades;

# Query 1.1	
SELECT nombre
FROM articulos;

# Query 1.2
SELECT nombre, precio
FROM articulos;

# Query 1.3
SELECT nombre
FROM articulos
WHERE precio <= 200;

# Query 1.4
SELECT *
FROM articulos
WHERE precio BETWEEN 60 AND 120;

# Query 1.5
SELECT nombre, precio*166.386 AS "Precio en Pesetas"
FROM articulos;

# Query 1.6
SELECT AVG(precio)
FROM articulos;

# Query 1.7
SELECT AVG(precio)
FROM articulos
WHERE fabricante = 2;

# Query 1.8
SELECT COUNT(codigo)
FROM articulos
WHERE precio >= 180;

# Query 1.9
SELECT nombre, precio 
FROM articulos
WHERE precio >= 180
ORDER BY precio DESC, nombre ASC;

# Query 1.10
SELECT articulos.*, fabricantes.*
FROM articulos
INNER JOIN fabricantes
ON articulos.fabricante = fabricantes.codigo;

# Query 1.11
SELECT articulos.nombre, articulos.precio, fabricantes.nombre
FROM articulos
INNER JOIN fabricantes
ON articulos.fabricante = fabricantes.codigo;

# Query 1.12
SELECT AVG(articulos.precio), fabricantes.codigo AS "Codigo de Fabricante"
FROM articulos
INNER JOIN fabricantes
ON articulos.fabricante = fabricantes.codigo
GROUP BY articulos.fabricante;

# Query 1.13
SELECT AVG(articulos.precio), fabricantes.nombre AS "Nombre del Fabricante"
FROM articulos
INNER JOIN fabricantes
ON articulos.fabricante = fabricantes.codigo
GROUP BY articulos.fabricante;

# Query 1.14
SELECT fabricantes.nombre AS "Nombre del fabricante"
FROM fabricantes
INNER JOIN articulos
ON articulos.fabricante = fabricantes.codigo
GROUP BY articulos.fabricante
HAVING AVG(articulos.precio) >= 150;

# Query 1.15
SELECT nombre, precio
FROM articulos
ORDER BY precio ASC
LIMIT 1;

# Query 1.16
SELECT fabricantes.nombre, articulos.nombre, articulos.precio
FROM articulos
INNER JOIN fabricantes
ON articulos.fabricante = fabricantes.codigo
WHERE articulos.precio = (SELECT MAX(precio) FROM articulos WHERE articulos.fabricante = fabricantes.codigo)
GROUP BY fabricantes.nombre, articulos.precio, articulos.nombre;

# Query 1.17
INSERT INTO articulos (codigo, nombre, precio, fabricante) VALUES
(11, "Altavoces", 70, 2);

# Query 1.18
UPDATE articulos
SET nombre = "Impresora Laser"
WHERE codigo = 8;

# Query 1.19
UPDATE articulos
SET precio = precio * 0.9;

# Query 1.20
UPDATE articulos
SET precio = precio - 10
WHERE precio >= 120;

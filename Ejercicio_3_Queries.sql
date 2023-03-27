# UD-16 Ejercicio 3

USE actividades;

# Query 3.1
SELECT * FROM almacenes;

# Query 3.2
SELECT *
FROM cajas
WHERE valor > 150;

# Query 3.3
SELECT DISTINCT contenido
FROM cajas;

# Query 3.4
SELECT AVG(valor)
FROM cajas;

# Query 3.5
SELECT AVG(valor), almacen
FROM cajas
GROUP BY almacen;

# Query 3.6
SELECT almacenes.codigo AS "Almacen"
FROM almacenes
INNER JOIN cajas
ON cajas.almacen = almacenes.codigo
GROUP BY almacenes.codigo
HAVING AVG(cajas.valor) > 150;

# Query 3.7
SELECT cajas.numreferencia, almacenes.lugar
FROM cajas
INNER JOIN almacenes
ON cajas.almacen = almacenes.codigo
GROUP BY cajas.numreferencia;

# Query 3.8
SELECT COUNT(cajas.numreferencia) AS "Cajas", almacenes.codigo AS "Almacen"
FROM cajas
INNER JOIN almacenes
ON cajas.almacen = almacenes.codigo
GROUP BY almacenes.codigo;

# Query 3.9
SELECT almacenes.codigo AS "Almacenes saturados"
FROM almacenes
INNER JOIN cajas
ON almacenes.codigo = cajas.almacen
WHERE capacidad < (SELECT COUNT(cajas.numreferencia) FROM cajas WHERE almacenes.codigo = cajas.almacen)
GROUP BY almacenes.codigo;

# Query 3.10
SELECT cajas.numreferencia
FROM cajas
INNER JOIN almacenes
ON cajas.almacen = almacenes.codigo
WHERE almacenes.lugar = "Bilbao";

# Query 3.11
INSERT INTO almacenes(codigo, lugar, capacidad) VALUES
(6, "Barcelona", 3);

# Query 3.12
INSERT INTO cajas(numreferencia, contenido, valor, almacen) VALUES
("H5RT", "Papel", 200, 2);

# Query 3.13
UPDATE cajas SET valor = valor * 0.85;

# Query 3.14
UPDATE cajas SET valor = valor * 0.8
WHERE valor > (SELECT AVG(valor) FROM (SELECT * FROM cajas) c);

# Query 3.15
DELETE FROM cajas
WHERE valor < 100;

# Query 3.16
DELETE FROM cajas
WHERE almacen IN ( SELECT almacen
FROM (SELECT almacen, COUNT(*) AS no_cajas
FROM cajas
GROUP BY almacen
) AS cajas_almacen
INNER JOIN almacenes ON cajas.almacen = almacenes.codigo
WHERE cajas_almacen.no_cajas > almacenes.capacidad);

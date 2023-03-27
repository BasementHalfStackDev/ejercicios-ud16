# UD-16 Ejercicio 2

USE actividades;

# Query 2.1
SELECT apellidos
FROM empleados;

# Query 2.2
SELECT DISTINCT apellidos
FROM empleados;

# Query 2.3
SELECT *
FROM empleados
WHERE apellidos = "Smith";

# Query 2.4
SELECT *
FROM empleados
WHERE apellidos = "Smith" OR apellidos = "Rogers";

# Query 2.5
SELECT *
FROM empleados
WHERE departamento = 14;

# Query 2.6
SELECT *
FROM empleados
WHERE departamento = 37 OR departamento = 77;

# Query 2.7
SELECT *
FROM empleados
WHERE apellidos LIKE "P%";

# Query 2.8
SELECT sum(presupuesto) AS "Presupuesto total"
FROM departamentos;

# Query 2.9
SELECT count(DNI), departamento
FROM empleados
GROUP BY departamento;

# Query 2.10
SELECT empleados.*, departamentos.*
FROM empleados
INNER JOIN departamentos
ON empleados.departamento = departamentos.codigo
GROUP BY empleados.DNI;

# Query 2.11
SELECT empleados.nombre, empleados.apellidos, departamentos.nombre, departamentos.PRESUPUESTO
FROM empleados
INNER JOIN departamentos
ON empleados.departamento = departamentos.codigo
GROUP BY empleados.DNI;

# Query 2.12
SELECT empleados.nombre, empleados.apellidos
FROM empleados
INNER JOIN departamentos
ON empleados.departamento = departamentos.codigo
WHERE departamentos.presupuesto > 60000
GROUP BY empleados.DNI;

# Query 2.13
SELECT *
FROM departamentos
WHERE presupuesto > (SELECT AVG(presupuesto) FROM departamentos);

# Query 2.14
SELECT departamentos.nombre
FROM departamentos
INNER JOIN empleados
ON departamentos.codigo = empleados.departamento
GROUP BY departamentos.nombre
HAVING COUNT(empleados.DNI) > 2;

# Query 2.15
INSERT INTO departamentos(codigo, nombre, presupuesto) VALUES
(11, "Calidad", 40000);

INSERT INTO empleados(DNI, nombre, apellidos, departamento) VALUES
("89267109", "Esther", "Vazquez", 11);

# Query 2.16
UPDATE departamentos
SET presupuesto = presupuesto * 0.9;

# Query 2.17
UPDATE empleados
SET departamento = 14
WHERE departamento = 77;

# Query 2.18
DELETE FROM empleados
WHERE departamento = 14;

# Query 2.19
DELETE empleados
FROM empleados
JOIN departamentos on empleados.DEPARTAMENTO = departamentos.CODIGO
WHERE departamentos.PRESUPUESTO > 60000;

# Query 2.20
DELETE FROM empleados;
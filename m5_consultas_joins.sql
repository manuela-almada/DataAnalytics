USE Ventas_Tech_DB;

CREATE TABLE territorio(
	id_territorio INT PRIMARY KEY,
	region VARCHAR(100) NOT NULL,
	pais VARCHAR(50),
	zona VARCHAR(50)
)

CREATE TABLE tiempo(
	fecha DATE PRIMARY KEY,
	dia INT CHECK(dia>=1 AND dia<=31),
	mes INT CHECK(mes>=1 AND mes<=12),
	año INT,
	trimestre INT NOT NULL,
	cuatrimestre INT NOT NULL,
	dia_semana VARCHAR(50),
	fin_de_semana BIT DEFAULT 0
)

INSERT INTO tiempo(fecha, dia, mes, año, trimestre, cuatrimestre,dia_semana,fin_de_semana)
VALUES ('2024/06/12', 12,06,2024,2,1, 'miercoles',0),
		('2024/09/25', 25,09,2024,3,3, 'miercoles',0),
		('2024/02/18', 18,02,2024,1,1, 'domingo',1),
		('2024/04/08', 08,04,2024,2,1, 'lunes',0);

INSERT INTO territorio(id_territorio,region,pais,zona)
VALUES(1, 'noroeste', 'Argentina', 'norte'),
	   (2, 'noreste', 'Argentina', 'este'),
	   (3, 'cuyo', 'Argentina', 'centro'),
	   (4, 'pampeana', 'Argentina', 'sur');


ALTER TABLE ventas 
ADD id_territorio INT;

INSERT INTO tiempo (fecha, dia, mes, año, trimestre, cuatrimestre, dia_semana, fin_de_semana)
VALUES 
    -- Bloque de Marzo 2024
    ('2024-03-05', 5, 3, 2024, 1, 1, 'martes', 0),
    ('2024-03-06', 6, 3, 2024, 1, 1, 'miercoles', 0),
    ('2024-03-07', 7, 3, 2024, 1, 1, 'jueves', 0),
    ('2024-03-08', 8, 3, 2024, 1, 1, 'viernes', 0),
    ('2024-03-10', 10, 3, 2024, 1, 1, 'domingo', 1),
    ('2024-03-11', 11, 3, 2024, 1, 1, 'lunes', 0),
    ('2024-03-12', 12, 3, 2024, 1, 1, 'martes', 0),
    ('2024-03-13', 13, 3, 2024, 1, 1, 'miercoles', 0),
    ('2024-03-14', 14, 3, 2024, 1, 1, 'jueves', 0),
    ('2024-03-15', 15, 3, 2024, 1, 1, 'viernes', 0),
    ('2024-01-10', 10, 1, 2024, 1, 1, 'miercoles', 0),
    ('2024-02-15', 15, 2, 2024, 1, 1, 'jueves', 0),
    ('2024-05-20', 20, 5, 2024, 2, 2, 'lunes', 0),
    ('2024-07-05', 5, 7, 2024, 3, 2, 'viernes', 0),
    ('2024-08-18', 18, 8, 2024, 3, 2, 'domingo', 1),
    ('2024-09-22', 22, 9, 2024, 3, 3, 'domingo', 1),
    ('2024-10-14', 14, 10, 2024, 4, 3, 'lunes', 0),
    ('2024-12-03', 3, 12, 2024, 4, 3, 'martes', 0);

ALTER TABLE ventas
ADD CONSTRAINT FK_ventas_fecha
FOREIGN KEY (fecha_venta) 
REFERENCES tiempo(fecha);

ALTER TABLE ventas
ADD CONSTRAINT FK_ventas_territorio
FOREIGN KEY (id_territorio) 
REFERENCES territorio(id_territorio);

UPDATE ventas
SET id_territorio=1
WHERE id_venta IN(1,7,8,9,11,15,17,20);

UPDATE ventas
SET id_territorio=3
WHERE id_venta IN(2,5,6,10);

UPDATE ventas
SET id_territorio=2
WHERE id_venta IN(3,12);

UPDATE ventas
SET id_territorio=4
WHERE id_venta IN(18,19,4);

UPDATE ventas
SET id_territorio=1
WHERE id_venta IN(13,14,16);

SELECT * FROM ventas;
---Consulta 1
SELECT c.nombre, p.nombre_producto, v.cantidad, v.precio_unitario, v.fecha_venta,
SUM(v.cantidad*v.precio_unitario) AS total_venta
FROM ventas v
JOIN clientes c
    ON v.id_cliente=c.id_cliente
JOIN productos p
    ON v.id_producto=p.id_producto
GROUP BY 
    c.nombre, 
    p.nombre_producto, 
    v.cantidad, 
    v.precio_unitario, 
    v.fecha_venta;
   
---Consulta 2
SELECT c.nombre, c.email,c.fecha_registro
FROM clientes c
LEFT JOIN ventas v
ON c.id_cliente=v.id_cliente
WHERE v.id_cliente IS NULL;

---Todos los clientes tenian compras realizadas por lo que añadi un cliente más y volví a corroborar
INSERT INTO clientes VALUES (6, 'Alma López',   'almalopez@mail.com',   'Santa Fe', '2024-04-08');

SELECT c.nombre, c.email,c.fecha_registro
FROM clientes c
LEFT JOIN ventas v
ON c.id_cliente=v.id_cliente
WHERE v.id_cliente IS NULL;

---Consulta 3
SELECT p.nombre_producto, c.descripcion AS descripcion_categoria,p.precio
FROM productos p
JOIN categorias c
ON p.id_categoria=c.id_categoria
LEFT JOIN ventas v
ON p.id_producto=v.id_producto
WHERE v.id_producto IS NULL;

---Todos los productos se habian vendido por lo que añadi un producto más y volví a corroborar
INSERT INTO productos VALUES (7, 'Teclado inalambrico',    2,   195.00, 20, 1);

SELECT p.nombre_producto, c.descripcion AS descripcion_categoria,p.precio
FROM productos p
JOIN categorias c
ON p.id_categoria=c.id_categoria
LEFT JOIN ventas v
ON p.id_producto=v.id_producto
WHERE v.id_producto IS NULL;

---Consulta 4

SELECT canal,
SUM(total) AS total_por_canal
FROM(
    SELECT fecha_venta, SUM(cantidad*precio_unitario) AS total, 'Online' AS canal 
    FROM ventas 
    WHERE id_territorio IN(2,4) 
    GROUP BY ventas.fecha_venta,ventas.id_territorio
    UNION ALL SELECT fecha_venta, SUM(cantidad*precio_unitario) AS total, 'Presencial' AS canal 
    FROM ventas 
    WHERE id_territorio IN(1,3)
    GROUP BY ventas.fecha_venta,ventas.id_territorio) AS subconsulta
GROUP BY canal
;

        

USE Ventas_Tech_DB;

SELECT * 
FROM ventas;


--- Consulta 1 ---

SELECT 
MONTH(fecha_venta) AS mes,
SUM(cantidad * precio_unitario) AS total_facturado,
COUNT(id_venta) AS cant_pedidos,
SUM(cantidad * precio_unitario)/COUNT(id_venta) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta);

--- Consulta 2 ---

SELECT TOP(5) id_producto,
SUM(cantidad) AS unidades_vendidas,
SUM(cantidad * precio_unitario) AS total_generado
FROM ventas
GROUP BY id_producto
ORDER BY total_generado DESC;

--- Consulta 3 ---

SELECT id_cliente,
COUNT(id_venta) AS cantidad_pedidos,
SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*)>1

---Consulta 4 ---

INSERT INTO ventas (id_venta, id_cliente, id_producto, cantidad, precio_unitario, fecha_venta)
VALUES
(11, 1, 2, 3, 850.00, '2024-01-10'),
(12, 2, 3, 2, 450.00, '2024-02-15'),
(13, 3, 4, 5, 120.00, '2024-04-08'),
(14, 4, 5, 1, 130.00, '2024-05-20'),
(15, 5, 6, 4, 95.00,  '2024-06-12'),
(16, 1, 1, 2, 1200.00,'2024-07-05'),
(17, 2, 2, 6, 28.00,  '2024-08-18'),
(18, 3, 3, 3, 450.00, '2024-09-22'),
(19, 4, 4, 2, 120.00, '2024-10-14'),
(20, 5, 5, 4, 130.00, '2024-12-03');

SELECT 
    mes,
    total_facturado,
    CASE
        WHEN total_facturado > promedio_mensual THEN 'Por encima'
        WHEN total_facturado < promedio_mensual THEN 'Por debajo'
        ELSE 'Igual'
    END AS comparacion
FROM (
    SELECT 
        MONTH(fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_facturado,
        AVG(SUM(cantidad * precio_unitario)) OVER () AS promedio_mensual
    FROM ventas
    GROUP BY MONTH(fecha_venta)
) AS resumen

--- Opte por agregar algunos registros más a la tabla ventas ya que unicamente teniamos ventas registradas del mes 3, por lo que el análisis por mes no me resultaba muy representivo.

--- El mes 3 registró la mayor cantidad de pedidos, mientras que el ticket promedio alcanzó su valor máximo en el mes 1.
--- El cliente 1 es el que genera el mayor ingreso para la empresa.
--- El artículo 2 concentra el mayor volumen de unidades vendidas, mientras que el artículo 5 genera la mayor facturación.
--- La facturación mensual superó el promedio mensual general únicamente en el 25% de los meses analizados.







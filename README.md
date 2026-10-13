# 🛒 RetailPro — Análisis de datos de retail con SQL

Proyecto de análisis de datos orientado a un negocio de retail. A partir de una base de datos relacional, se utilizan consultas SQL para explorar las ventas, los productos y los clientes, y obtener información útil para la toma de decisiones.

---

## 📋 Tabla de contenidos

- [Descripción del proyecto](#-descripción-del-proyecto)
- [Objetivos](#-objetivos)
- [Herramientas utilizadas](#-herramientas-utilizadas)
- [Estructura del repositorio](#-estructura-del-repositorio)
- [Modelo de datos](#-modelo-de-datos)
- [Cómo ejecutar los scripts SQL](#-cómo-ejecutar-los-scripts-sql)
- [Preguntas de negocio que responde el proyecto](#-preguntas-de-negocio-que-responde-el-proyecto)
- [Resultados y hallazgos](#-resultados-y-hallazgos)
- [Autora](#-autora)

---

## 📖 Descripción del proyecto

**RetailPro** es  una empresa distribuidora de tecnología. El proyecto cubre el recorrido típico de un análisis con SQL, y tiene como objetivo construir el sistema de análisis completo, desde la base de datos hasta el dashboard ejecutivo:

1. **Creación de la base de datos y las tablas.**
2. **Carga de datos** de ejemplo.
3. **Limpieza y validación** de los datos.
4. **Consultas analíticas** para responder preguntas de negocio (ventas, productos, clientes, etc.).

El dataset utilizado es ficticio y generado por mí


##  Herramientas utilizadas

| Herramienta | Uso en el proyecto |
|---|---|
| **SQL** | Creación de tablas, limpieza de datos y consultas analíticas |
| **`[Motor de base de datos:SQL Server** | Motor donde se ejecutan los scripts |
| **Git y GitHub** | Control de versiones y publicación del proyecto |
| **Powerbi** | Visualización y análisis complementario|

## Estructura del repositorio

> Ejemplo de estructura. Ajustala a los nombres reales de tus carpetas y archivos.


DataAnalytics/
├── README.md
├── M6/
│   ├── Pipeline_ETL_Almada_Manuela.pbix    # Carga de datos y tratamiento de los mismos en Powerbi
├── M7/
│   ├── Mockup RetailPro.pdf  # Boceto inicial del dashboard final
│   ├── Mock Up RetailPro.png  # Justificaciones del Boceto inicial
├── M8/
│   ├── Almada_Manuela_ckeckpoint2.pdf # Justificaciones de los Avances del proyecto en Powerbi
│   ├── Almada_Manuela_ckeckpoint2.pbix # Avances del proyecto en Powerbi
├── BDD_Ventas_Tech_DB.sql # Creación de la base de datos y las tablas
├── Consultas SQL de negocio.sql # Consultas simples del negocio mediante sql
├── m5_consultas_joins.sql #Consultas a la base de datos utilizando joins




## 🗂️ Modelo de datos

`[Describí brevemente las tablas principales y cómo se relacionan. Por ejemplo:]`

| Tabla | Descripción |
|---|---|
| [clientes] | [Datos de los clientes] |
| [productos] | [Catálogo de productos y categorías] |
| [ventas] | [Transacciones realizadas] |
| [detalle_ventas] | [Productos y cantidades por venta] |


## ▶️ Cómo ejecutar los scripts SQL

### 1. Requisitos previos

- Tener instalado [SQL Server] (versión 2022 o superior).
- Tener un cliente SQL (por ejemplo, [MySQL Workbench / DBeaver / pgAdmin / SSMS]) o acceso a la terminal.
- Tener [Git](https://git-scm.com/) instalado para clonar el repositorio.

### 2. Clonar el repositorio (como alternativa descargar los archivos necesarios)


git clone https://github.com/manuela-almada/DataAnalytics.git
cd DataAnalytics


### 3. Ejecutar los scripts en orden

Los scripts están numerados y **deben ejecutarse en ese orden**, ya que cada uno depende del anterior.

| Orden | Script | Qué hace |
|---|---|---|
| 1 | BDD_Ventas_Tech_DB.sql | Crea la base de datos y las tablas. Inserta datos|
| 2 | Consultas SQL de negocio.sql | Inserta algunos datos más y realiza consultas sql |
| 3 | m5_consultas_joins.sql| Realiza consultas sql con el comando join para visualizar su uso |


`[Ajustá los nombres a los de tus archivos reales.]`

#### Opción A: desde un cliente gráfico

1. Abrí tu cliente SQL y conectate al servidor.
2. Abrí cada archivo `.sql` (`File > Open SQL Script`, o equivalente).
3. Ejecutalo completo respetando el orden indicado.

#### Opción B: desde la línea de comandos

Elegí el comando según tu motor de base de datos:

**MySQL**
```bash
mysql -u tu_usuario -p < sql/01_create_database.sql
mysql -u tu_usuario -p RetailPro < sql/02_insert_data.sql
```

**PostgreSQL**
```bash
psql -U tu_usuario -f sql/01_create_database.sql
psql -U tu_usuario -d retailpro -f sql/02_insert_data.sql
```

**SQL Server**
```bash
sqlcmd -S localhost -U tu_usuario -i sql/01_create_database.sql
sqlcmd -S localhost -U tu_usuario -d RetailPro -i sql/02_insert_data.sql
```

**SQLite**
```bash
sqlite3 retailpro.db < sql/01_create_database.sql
sqlite3 retailpro.db < sql/02_insert_data.sql
```

### 4. Verificar la instalación

Una vez cargados los datos, comprobá que todo funcione con una consulta simple:

```sql
SELECT COUNT(*) FROM ventas;
```


## ❓ Preguntas de negocio que responde el proyecto


- ¿Cuáles son los productos más vendidos?
- ¿Cuál es el ingreso total en el período analizado?
- Cantidad total de unidades vendidas
- ¿Quiénes son los clientes con mayor volumen de compras?
- ¿Cómo evolucionan las ventas a lo largo del tiempo?

## 👩‍💻 Autora

**Manuela Almada**

- GitHub: [@manuela-almada](https://github.com/manuela-almada)

---

⭐ Si este proyecto te resultó útil, ¡dejá una estrella en el repositorio!

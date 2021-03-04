
postgres=# CREATE DATABASE prueba;
CREATE DATABASE
postgres=# \c prueba
Ahora está conectado a la base de datos «prueba» con el usuario «postgres».

-- CREAR TABLA CLIENTE
 CREATE TABLE clientes ( id_cliente SERIAL PRIMARY KEY, nombre VARCHAR(50), rut VARCHAR(50), direccion VARCHAR(50));
CREATE TABLE

--CREAT TABLA FACTURA

 CREATE TABLE factura (num_factura SERIAL PRIMARY KEY, fecha_factura DATE, subtotal INT, iva DECIMAL, precio_total INT, id_cliente INT REFERENCES clientes(id_cliente));
CREATE TABLE

--CREAR TABLA CATEGORIA
 CREATE TABLE categoria ( id_categoria SERIAL PRIMARY KEY, nombre_categoria VARCHAR(30), descripcion VARCHAR(40));
CREATE TABLE

--crear tabla productos
 CREATE TABLE productos ( id_producto SERIAL PRIMARY KEY, nombre VARCHAR(50), descripcion VARCHAR(50), valor_unitario INT, stock INT CHECK (stock >=0), id_categoria INT REFERENCES categoria(id_categoria));

 --CREAR TABLA INTERMEDIA LISTADO PRODUCTOS
                                                    
 CREATE TABLE listado_productos (num_factura INT REFERENCES factura(num_factura), cantidad INT, id_producto INT REFERENCES productos(id_producto));
CREATE TABLE


--insertar 5 clientes

 INSERT INTO clientes(nombre, rut, direccion)VALUES('cliente1','11111111-1','direccion1 #1111');

 INSERT INTO clientes(nombre, rut, direccion)VALUES('cliente2','2222222-2','direccion2 #2222');

 INSERT INTO clientes(nombre, rut, direccion)VALUES('cliente3','3333333-3','direccion3 #3333');

 INSERT INTO clientes(nombre, rut, direccion)VALUES('cliente4','4444444-4','direccion4 #4444');

 INSERT INTO clientes(nombre, rut, direccion)VALUES('cliente5','5555555-5','direccion5 #5555');



--insertar tres categorias
 INSERT INTO categoria(nombre_categoria, descripcion) VALUES ( 'moda', 'ropa deportiva ');

 INSERT INTO categoria(nombre_categoria, descripcion) VALUES ( 'calzado', 'calzado deportivo ');

 INSERT INTO categoria(nombre_categoria, descripcion) VALUES ( 'accesorios', 'accesorios para deportistas');


-- insertar 8 productos
 INSERT INTO productos(nombre, descripcion, valor_unitario,stock, id_categoria) VALUES ('pelota', 'pelota de futbol', 10000,50, 1);


 INSERT INTO productos(nombre, descripcion, valor_unitario,stock, id_categoria) VALUES ('calcetas', 'calcetas de futbol', 7000,50, 1);


 INSERT INTO productos(nombre, descripcion, valor_unitario,stock, id_categoria) VALUES ('zapatos', 'zapatos de futbol', 20000,50, 2);


 INSERT INTO productos(nombre, descripcion, valor_unitario,stock, id_categoria) VALUES ('canilleras', 'canilleras profesionales de futbol', 9000,50,3);


 INSERT INTO productos(nombre, descripcion, valor_unitario,stock, id_categoria) VALUES ('polera', 'polera algodon de futbol', 5000,50, 1);


 INSERT INTO productos(nombre, descripcion, valor_unitario,stock, id_categoria) VALUES ('short', 'short microfibra de futbol', 5000,50, 1);


 INSERT INTO productos(nombre, descripcion, valor_unitario,stock, id_categoria) VALUES ('gorro', 'gorro deportivo con filtro UV', 2000,50, 3);

 INSERT INTO productos(nombre, descripcion, valor_unitario,stock, id_categoria) VALUES ('botella', 'botella deportiva acero inoxidable ', 1500,50,3);

 -- crear facturas

 -- 2 para cliente 1 : 1° con dos productos y la 2° con 3 productos

 BEGIN;
 INSERT INTO factura(fecha_factura, subtotal, iva, precio_total,id_cliente) VALUES ('2020-11-07', 30000, 5700, 35700,1);
 INSERT INTO factura(fecha_factura, subtotal, iva, precio_total,id_cliente) VALUES ('2020-11-07', 22000 , 4180 ,26480 ,1);
 UPDATE productos SET stock = stock -1 WHERE id_producto = 1;
 UPDATE productos SET stock = stock -1 WHERE id_producto = 3;
 COMMIT;

-- 3 PARA CLIENTE 2: 1° CON 3 PRODUCTOS, 2° CON 2 PRODUCTOS, 3° CON 3 PRODUCTOS

BEGIN;

 INSERT INTO factura(fecha_factura, subtotal, iva, precio_total,id_cliente) VALUES ('2020-11-12', 15500, 2945,18445 ,2);

 INSERT INTO factura(fecha_factura, subtotal, iva, precio_total,id_cliente) VALUES ('2020-11-12', 11500, 2185,13685 ,2);
 INSERT INTO factura(fecha_factura, subtotal, iva, precio_total,id_cliente) VALUES ('2020-11-12', 15000, 2850,17850 ,2);
  UPDATE productos SET stock= stock -2 WHERE id_producto = 8;
UPDATE 1
 UPDATE productos SET stock= stock -1 WHERE id_producto = 4;
UPDATE 1
 UPDATE productos SET stock= stock -1 WHERE id_producto = 6;
UPDATE 1
 UPDATE productos SET stock= stock -1 WHERE id_producto = 1;
UPDATE 1
 UPDATE productos SET stock= stock -3 WHERE id_producto = 5;

COMMIT;

-- 1 PARA CLIENTE 3 CON 1 PRODUCTO
BEGIN;
INSERT INTO factura(fecha_factura, subtotal, iva, precio_total,id_cliente) VALUES ('2020-11-17', 2000, 380,2380 ,3);

UPDATE productos SET stock = stock -1 WHERE id_producto = 3;

COMMIT;

-- 4 PARA CLIENTE 4 : 1° 2 PRODUCTOS, 2° 3 PRODUCTOS, 3° 4 PRODUCTOS, 5° 1 PRODUCTO

BEGIN;
 INSERT INTO factura(fecha_factura, subtotal, iva, precio_total,id_cliente) VALUES ('2020-11-20', 30000,5700,35700,4);
INSERT 0 1
 INSERT INTO factura(fecha_factura, subtotal, iva, precio_total,id_cliente) VALUES ('2020-11-20', 49000,9310,58310,4);
INSERT 0 1
 INSERT INTO factura(fecha_factura, subtotal, iva, precio_total,id_cliente) VALUES ('2020-11-20',31500,5895,37485,4);
INSERT 0 1
 INSERT INTO factura(fecha_factura, subtotal, iva, precio_total,id_cliente) VALUES ('2020-11-20',10000,1900,11900,4);
INSERT 0 1
 UPDATE productos SET stock = stock -4 WHERE id_producto=3;
UPDATE 1
 UPDATE productos SET stock = stock -2 WHERE id_producto=1;
UPDATE 1
 UPDATE productos SET stock = stock -1 WHERE id_producto=4;
UPDATE 1
 UPDATE productos SET stock = stock -1 WHERE id_producto=5;
UPDATE 1
 UPDATE productos SET stock = stock -1 WHERE id_producto=6;
UPDATE 1
 UPDATE productos SET stock = stock -1 WHERE id_producto=8;
UPDATE 1
 COMMIT;
COMMIT

-- diccionario de datos
 SELECT
prueba-# t1.TABLE_NAME AS tabla_nombre,
prueba-# t1.COLUMN_NAME AS columna_nombre,
prueba-# t1.ORDINAL_POSITION AS position,
prueba-# t1.IS_NULLABLE AS nulo,
prueba-# t1.DATA_TYPE AS tipo_dato,
prueba-# COALESCE(t1.NUMERIC_PRECISION,
prueba(# t1.CHARACTER_MAXIMUM_LENGTH) AS longitud
prueba-# FROM
prueba-# INFORMATION_SCHEMA.COLUMNS t1
prueba-# WHERE
prueba-# t1.TABLE_SCHEMA = 'public'
prueba-# ORDER BY
prueba-# t1.TABLE_NAME;
   tabla_nombre    |  columna_nombre  | position | nulo |     tipo_dato     | longitud
-------------------+------------------+----------+------+-------------------+----------
 categoria         | descripcion      |        3 | YES  | character varying |       40
 categoria         | id_categoria     |        1 | NO   | integer           |       32
 categoria         | nombre_categoria |        2 | YES  | character varying |       30
 clientes          | direccion        |        4 | YES  | character varying |       50
 clientes          | id_cliente       |        1 | NO   | integer           |       32
 clientes          | nombre           |        2 | YES  | character varying |       50
 clientes          | rut              |        3 | YES  | character varying |       50
 factura           | id_cliente       |        6 | YES  | integer           |       32
 factura           | precio_total     |        5 | YES  | integer           |       32
 factura           | fecha_factura    |        2 | YES  | date              |
 factura           | iva              |        4 | YES  | numeric           |
 factura           | num_factura      |        1 | NO   | integer           |       32
 factura           | subtotal         |        3 | YES  | integer           |       32
 listado_productos | id_producto      |        3 | YES  | integer           |       32
 listado_productos | cantidad         |        2 | YES  | integer           |       32
 listado_productos | num_factura      |        1 | YES  | integer           |       32
 productos         | stock            |        5 | YES  | integer           |       32
 productos         | id_producto      |        1 | NO   | integer           |       32
 productos         | valor_unitario   |        4 | YES  | integer           |       32
 productos         | nombre           |        2 | YES  | character varying |       50
 productos         | id_categoria     |        6 | YES  | integer           |       32
 productos         | descripcion      |        3 | YES  | character varying |       50
(22 filas)

--¿Qué cliente realizó la compra más cara? (0.5 Puntos)

SELECT * FROM factura WHERE precio_total = (SELECT MAX(precio_total)FROM FACTURA);

num_factura | fecha_factura | subtotal | iva  | precio_total | id_cliente
-------------+---------------+----------+------+--------------+------------
          15 | 2020-11-20    |    49000 | 9310 |        58310 |          4

--¿Qué cliente pagó sobre 100 de monto? 

SELECT * FROM factura WHERE precio_total >= 30000;
 num_factura | fecha_factura | subtotal | iva  | precio_total | id_cliente
-------------+---------------+----------+------+--------------+------------
           5 | 2020-11-07    |    30000 | 5700 |        35700 |          1
          14 | 2020-11-20    |    30000 | 5700 |        35700 |          4
          15 | 2020-11-20    |    49000 | 9310 |        58310 |          4
          16 | 2020-11-20    |    31500 | 5895 |        37485 |          4
  -- ¿Cuántos clientes han comprado el producto 6?

  SELECT COUNT (listado_productos.id_producto) FROM listado_productos WHERE id_producto = 6;

   count
-------
     2

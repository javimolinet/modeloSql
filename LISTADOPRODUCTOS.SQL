
--cliente 1

prueba=# INSERT INTO listado_productos(num_factura, cantidad, id_producto) VALUES (5,1,1);
INSERT 0 1
prueba=# INSERT INTO listado_productos(num_factura, cantidad, id_producto) VALUES (5,1,3);
INSERT 0 1
prueba=# INSERT INTO listado_productos(num_factura, cantidad, id_producto) VALUES (6,1,1);
INSERT 0 1
prueba=# INSERT INTO listado_productos(num_factura, cantidad, id_producto) VALUES (6,1,2);
INSERT 0 1
prueba=# INSERT INTO listado_productos(num_factura, cantidad, id_producto) VALUES (6,1,5);
INSERT 0 1


           --CLIENTE 2

           
prueba=# INSERT INTO listado_productos(num_factura, cantidad, id_producto) VALUES (10,1,8);
INSERT 0 1
prueba=# INSERT INTO listado_productos(num_factura, cantidad, id_producto) VALUES (10,1,4);
INSERT 0 1
prueba=# INSERT INTO listado_productos(num_factura, cantidad, id_producto) VALUES (10,1,6);
INSERT 0 1
prueba=# INSERT INTO listado_productos(num_factura, cantidad, id_producto) VALUES (11,1,8);
INSERT 0 1
prueba=# INSERT INTO listado_productos(num_factura, cantidad, id_producto) VALUES (11,1,1);
INSERT 0 1
prueba=# INSERT INTO listado_productos(num_factura, cantidad, id_producto) VALUES (12,3,5);
INSERT 0 1


(11 filas)

--CLIENTE 3

prueba=#  INSERT INTO listado_productos(num_factura, cantidad, id_producto) VALUES (13,1,3);
INSERT 0 1


--CLIENTE 4

prueba=# INSERT INTO listado_productos(num_factura, cantidad, id_producto) VALUES (14,1,3);
INSERT 0 1
prueba=# INSERT INTO listado_productos(num_factura, cantidad, id_producto) VALUES (14,1,1);
INSERT 0 1
prueba=# INSERT INTO listado_productos(num_factura, cantidad, id_producto) VALUES (15,2,3);
INSERT 0 1
prueba=# INSERT INTO listado_productos(num_factura, cantidad, id_producto) VALUES (15,1,4);
INSERT 0 1
prueba=# INSERT INTO listado_productos(num_factura, cantidad, id_producto) VALUES (16,1,5);
INSERT 0 1
prueba=# INSERT INTO listado_productos(num_factura, cantidad, id_producto) VALUES (16,1,3);
INSERT 0 1
prueba=# INSERT INTO listado_productos(num_factura, cantidad, id_producto) VALUES (16,1,6);
INSERT 0 1
prueba=# INSERT INTO listado_productos(num_factura, cantidad, id_producto) VALUES (16,1,8);
INSERT 0 1
prueba=# INSERT INTO listado_productos(num_factura, cantidad, id_producto) VALUES (17,1,1);
INSERT 0 1

SELECT * FROM listado:productos;
 num_factura | cantidad | id_producto
-------------+----------+-------------
           5 |        1 |           1
           5 |        1 |           3
           6 |        1 |           1
           6 |        1 |           2
           6 |        1 |           5
          10 |        1 |           8
          10 |        1 |           4
          10 |        1 |           6
          11 |        1 |           8
          11 |        1 |           1
          12 |        3 |           5
          13 |        1 |           3
          14 |        1 |           3
          14 |        1 |           1
          15 |        2 |           3
          15 |        1 |           4
          16 |        1 |           5
          16 |        1 |           3
          16 |        1 |           6
          16 |        1 |           8
          17 |        1 |           1
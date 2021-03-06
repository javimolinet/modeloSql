PGDMP                         x           prueba    10.15    10.15 *               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    25067    prueba    DATABASE     �   CREATE DATABASE prueba WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Chile.1252' LC_CTYPE = 'Spanish_Chile.1252';
    DROP DATABASE prueba;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false                       0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false                       0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    25094 	   categoria    TABLE     �   CREATE TABLE public.categoria (
    id_categoria integer NOT NULL,
    nombre_categoria character varying(30),
    descripcion character varying(40)
);
    DROP TABLE public.categoria;
       public         postgres    false    3            �            1259    25092    categoria_id_categoria_seq    SEQUENCE     �   CREATE SEQUENCE public.categoria_id_categoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.categoria_id_categoria_seq;
       public       postgres    false    3    201                        0    0    categoria_id_categoria_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.categoria_id_categoria_seq OWNED BY public.categoria.id_categoria;
            public       postgres    false    200            �            1259    25070    clientes    TABLE     �   CREATE TABLE public.clientes (
    id_cliente integer NOT NULL,
    nombre character varying(50),
    rut character varying(50),
    direccion character varying(50)
);
    DROP TABLE public.clientes;
       public         postgres    false    3            �            1259    25068    clientes_id_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.clientes_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.clientes_id_cliente_seq;
       public       postgres    false    197    3            !           0    0    clientes_id_cliente_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.clientes_id_cliente_seq OWNED BY public.clientes.id_cliente;
            public       postgres    false    196            �            1259    25078    factura    TABLE     �   CREATE TABLE public.factura (
    num_factura integer NOT NULL,
    fecha_factura date,
    subtotal integer,
    iva numeric,
    precio_total integer,
    id_cliente integer
);
    DROP TABLE public.factura;
       public         postgres    false    3            �            1259    25076    factura_num_factura_seq    SEQUENCE     �   CREATE SEQUENCE public.factura_num_factura_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.factura_num_factura_seq;
       public       postgres    false    199    3            "           0    0    factura_num_factura_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.factura_num_factura_seq OWNED BY public.factura.num_factura;
            public       postgres    false    198            �            1259    25114    listado_productos    TABLE     r   CREATE TABLE public.listado_productos (
    num_factura integer,
    cantidad integer,
    id_producto integer
);
 %   DROP TABLE public.listado_productos;
       public         postgres    false    3            �            1259    25102 	   productos    TABLE       CREATE TABLE public.productos (
    id_producto integer NOT NULL,
    nombre character varying(50),
    descripcion character varying(50),
    valor_unitario integer,
    stock integer,
    id_categoria integer,
    CONSTRAINT productos_stock_check CHECK ((stock >= 0))
);
    DROP TABLE public.productos;
       public         postgres    false    3            �            1259    25100    productos_id_producto_seq    SEQUENCE     �   CREATE SEQUENCE public.productos_id_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.productos_id_producto_seq;
       public       postgres    false    3    203            #           0    0    productos_id_producto_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.productos_id_producto_seq OWNED BY public.productos.id_producto;
            public       postgres    false    202            �
           2604    25097    categoria id_categoria    DEFAULT     �   ALTER TABLE ONLY public.categoria ALTER COLUMN id_categoria SET DEFAULT nextval('public.categoria_id_categoria_seq'::regclass);
 E   ALTER TABLE public.categoria ALTER COLUMN id_categoria DROP DEFAULT;
       public       postgres    false    200    201    201            �
           2604    25073    clientes id_cliente    DEFAULT     z   ALTER TABLE ONLY public.clientes ALTER COLUMN id_cliente SET DEFAULT nextval('public.clientes_id_cliente_seq'::regclass);
 B   ALTER TABLE public.clientes ALTER COLUMN id_cliente DROP DEFAULT;
       public       postgres    false    197    196    197            �
           2604    25081    factura num_factura    DEFAULT     z   ALTER TABLE ONLY public.factura ALTER COLUMN num_factura SET DEFAULT nextval('public.factura_num_factura_seq'::regclass);
 B   ALTER TABLE public.factura ALTER COLUMN num_factura DROP DEFAULT;
       public       postgres    false    199    198    199            �
           2604    25105    productos id_producto    DEFAULT     ~   ALTER TABLE ONLY public.productos ALTER COLUMN id_producto SET DEFAULT nextval('public.productos_id_producto_seq'::regclass);
 D   ALTER TABLE public.productos ALTER COLUMN id_producto DROP DEFAULT;
       public       postgres    false    203    202    203                      0    25094 	   categoria 
   TABLE DATA               P   COPY public.categoria (id_categoria, nombre_categoria, descripcion) FROM stdin;
    public       postgres    false    201   �.                 0    25070    clientes 
   TABLE DATA               F   COPY public.clientes (id_cliente, nombre, rut, direccion) FROM stdin;
    public       postgres    false    197   5/                 0    25078    factura 
   TABLE DATA               f   COPY public.factura (num_factura, fecha_factura, subtotal, iva, precio_total, id_cliente) FROM stdin;
    public       postgres    false    199   �/                 0    25114    listado_productos 
   TABLE DATA               O   COPY public.listado_productos (num_factura, cantidad, id_producto) FROM stdin;
    public       postgres    false    204   F0                 0    25102 	   productos 
   TABLE DATA               j   COPY public.productos (id_producto, nombre, descripcion, valor_unitario, stock, id_categoria) FROM stdin;
    public       postgres    false    203   �0       $           0    0    categoria_id_categoria_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.categoria_id_categoria_seq', 3, true);
            public       postgres    false    200            %           0    0    clientes_id_cliente_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.clientes_id_cliente_seq', 5, true);
            public       postgres    false    196            &           0    0    factura_num_factura_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.factura_num_factura_seq', 17, true);
            public       postgres    false    198            '           0    0    productos_id_producto_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.productos_id_producto_seq', 8, true);
            public       postgres    false    202            �
           2606    25099    categoria categoria_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id_categoria);
 B   ALTER TABLE ONLY public.categoria DROP CONSTRAINT categoria_pkey;
       public         postgres    false    201            �
           2606    25075    clientes clientes_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id_cliente);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public         postgres    false    197            �
           2606    25086    factura factura_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_pkey PRIMARY KEY (num_factura);
 >   ALTER TABLE ONLY public.factura DROP CONSTRAINT factura_pkey;
       public         postgres    false    199            �
           2606    25108    productos productos_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id_producto);
 B   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_pkey;
       public         postgres    false    203            �
           2606    25087    factura factura_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente);
 I   ALTER TABLE ONLY public.factura DROP CONSTRAINT factura_id_cliente_fkey;
       public       postgres    false    2699    197    199            �
           2606    25122 4   listado_productos listado_productos_id_producto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.listado_productos
    ADD CONSTRAINT listado_productos_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto);
 ^   ALTER TABLE ONLY public.listado_productos DROP CONSTRAINT listado_productos_id_producto_fkey;
       public       postgres    false    2705    203    204            �
           2606    25117 4   listado_productos listado_productos_num_factura_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.listado_productos
    ADD CONSTRAINT listado_productos_num_factura_fkey FOREIGN KEY (num_factura) REFERENCES public.factura(num_factura);
 ^   ALTER TABLE ONLY public.listado_productos DROP CONSTRAINT listado_productos_num_factura_fkey;
       public       postgres    false    199    204    2701            �
           2606    25109 %   productos productos_id_categoria_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_id_categoria_fkey FOREIGN KEY (id_categoria) REFERENCES public.categoria(id_categoria);
 O   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_id_categoria_fkey;
       public       postgres    false    2703    201    203               L   x�3���OI�,�/HTHI-�/*�,KT�2�LN̩JLɇ�p�|.c����������b$�BAbܐ��b�=... �o!�         d   x�E�;
�0 �Z:�@���&�������Y�c<���=���
�&
������Q�Zh��Ll+#������ķr�ZK�Lb� ���TB�$�J�Zx��*m3�         �   x�e���0Ckr�~$j��?�I�uQ��� ��d�I=�Y�M�x窝;RH�g�G�"J��AH/*��- K��[г�OhF��f	�jC����'U���3�-�jaY�l�0���0r��ZX�|�'����3�i�6x         N   x�E���@CϤ���c�u�g�$|��F#rk�fn���m�l�
���8ݢ�1���/�{K�?f)R��`���P��         �   x�e�M��0���)r�*P(� ��lL0�H�̨��k�� ��ϊ>�����)�7�';��N��
��]R��*%��+��h��YoP��ٜ��L��Δ�����%�*�X��zWm̔�)���$MAFd:'[MQC��]�"ߥ��l��\`��O-�~��C���*�B'��q��$j�I�Fy�;&E=�5��d�y�rR     
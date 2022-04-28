--creamos la base de datos
CREATE DATABASE biblioteca;

--ingresamos a base de datos
\c biblioteca

-- creamos la tabla socios
CREATE TABLE socios(
    rut VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(30),
    apellido VARCHAR(30),
    direccion VARCHAR(70),
    telefono VARCHAR(20),
    PRIMARY KEY(rut)
);
-- creamos la tabla libros
CREATE TABLE libros(
    isbn VARCHAR(50) NOT NULL UNIQUE,
    titulo VARCHAR(150) NOT NULL,
    paginas SMALLINT NOT NULL,
    PRIMARY KEY(isbn)
);

-- creamos la tabla prestamos
CREATE TABLE prestamos(
    socio VARCHAR(30) NOT NULL,
    isbn_1 VARCHAR(30) NOT NULL,
    libro VARCHAR(150),
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE,
    FOREIGN KEY (socio) REFERENCES socios(rut),
    FOREIGN KEY (isbn_1) REFERENCES libros(isbn)
);

-- creamos la tabla autores
CREATE TABLE autores(
    codigo_autor SMALLINT NOT NULL,
    nombre_autor VARCHAR(20) NOT NULL,
    apellido_autor VARCHAR(20) NOT NULL,
    año_nacimiento VARCHAR(4) NOT NULL,
    año_muerte VARCHAR(4),
    PRIMARY KEY(codigo_autor)
);

-- creamos la tabla tipo_autor
CREATE TABLE tipo_autor(
    id INT NOT NULL UNIQUE,
    tipo_autor VARCHAR(15),
    PRIMARY KEY(id)
);

-- creamos la tabla identidad autores
CREATE TABLE identidad_autores(
    isbn_2 VARCHAR(30),
    id_autor SMALLINT,
    id_tipo_autor SMALLINT,
    FOREIGN KEY (isbn_2) REFERENCES libros(isbn),
    FOREIGN KEY (id_autor) REFERENCES autores(codigo_autor),
    FOREIGN KEY (id_tipo_autor) REFERENCES tipo_autor (id)
);

-- validamos la creación de las tablas
\dt

--                List of relations
--  Schema |       Name        | Type  |  Owner
-- --------+-------------------+-------+----------
--  public | autores           | table | ludovico
--  public | identidad_autores | table | ludovico
--  public | libros            | table | ludovico
--  public | prestamos         | table | ludovico
--  public | socios            | table | ludovico
--  public | tipo_autor        | table | ludovico
-- (6 rows)

-- validamos el contenido de las tablas
SELECT * FROM autores;

--  codigo_autor | nombre_autor | apellido_autor | agno_nacimiento | agno_muerte
-- --------------+--------------+----------------+-----------------+-------------
-- (0 rows)

SELECT * FROM identidad_autores;
--  isbn_2 | id_autor | id_tipo_autor
-- --------+----------+---------------
-- (0 rows)

SELECT * FROM libros;
--  isbn | titulo | paginas
-- ------+--------+---------
-- (0 rows)

SELECT * FROM prestamos;
--  socio | isbn_1 | libro | fecha_prestamo | fecha_devolucion
-- -------+--------+-------+----------------+------------------
-- (0 rows)

SELECT * FROM socios;
--  rut | nombre | apellido | direccion | telefono 
-- -----+--------+----------+-----------+----------
-- (0 rows)

SELECT * FROM tipo_autor;
-- id | tipo_autor
-- ----+------------
-- (0 rows)

-- comenzamos la inserción de datos a la tabla socios

INSERT INTO socios (rut, nombre, apellido, direccion, telefono)
VALUES ('1111111-1', 'JUAN', 'SOTO', 'AVENIDA 1, SANTIAGO', '911111111');
INSERT INTO socios (rut, nombre, apellido, direccion, telefono)
VALUES ('2222222-2', 'ANA', 'PÉREZ', 'PASAJE 2, SANTIAGO', '922222222');
INSERT INTO socios (rut, nombre, apellido, direccion, telefono)
VALUES ('3333333-3', 'SANDRA', 'AGUILAR', 'AVENIDA 2, SANTIAGO', '933333333');
INSERT INTO socios (rut, nombre, apellido, direccion, telefono)
VALUES ('4444444-4', 'ESTEBAN', 'JEREZ', 'AVENIDA 3 SANTIAGO', '944444444');
INSERT INTO socios (rut, nombre, apellido, direccion, telefono)
VALUES ('5555555-5', 'SILVANA', 'MUÑOZ', 'PASAJE 3 SANTIAGO', '955555555');

-- consultamos la base de datos socios
SELECT * FROM socios;
 
--     rut    | nombre  | apellido |      direccion      | telefono
-- -----------+---------+----------+---------------------+-----------
--  1111111-1 | JUAN    | SOTO     | AVENIDA 1, SANTIAGO | 911111111
--  2222222-2 | ANA     | PÉREZ    | PASAJE 2, SANTIAGO  | 922222222
--  3333333-3 | SANDRA  | AGUILAR  | AVENIDA 2, SANTIAGO | 933333333
--  4444444-4 | ESTEBAN | JEREZ    | AVENIDA 3 SANTIAGO  | 944444444
--  5555555-5 | SILVANA | MUÑOZ    | PASAJE 3 SANTIAGO   | 955555555
-- (5 rows)

-- insertamos registros en la tabla libros
INSERT INTO libros (isbn, titulo, paginas)
VALUES('111-1111111-111','CUENTOS DE TERROR','344');
INSERT INTO libros (isbn, titulo, paginas)
VALUES('222-2222222-222', 'POESÍAS CONTEMPORANEAS', '167');
INSERT INTO libros (isbn, titulo, paginas)
VALUES('333-3333333-333', 'HISTORIA DE ASIA', '511');
INSERT INTO libros (isbn, titulo, paginas)
VALUES('444-4444444-444', 'MANUAL DE MECANICA', '298');

--consultamos la tabla libros
SELECT * FROM libros;

--  isbn       |         titulo         | paginas
-- -----------------+------------------------+---------
--  111-1111111-111 | CUENTOS DE TERROR      |     344
--  222-2222222-222 | POESÍAS CONTEMPORANEAS |     167
--  333-3333333-333 | HISTORIA DE ASIA       |     511
--  444-4444444-444 | MANUAL DE MECANICA     |     298
-- (4 rows)

-- insertamos registros en la tabla autores
INSERT INTO autores (codigo_autor, nombre_autor, apellido_autor, año_nacimiento, año_muerte)
VALUES ('3', 'JOSÉ', 'SALGADO', '1968', '2020');
INSERT INTO autores (codigo_autor, nombre_autor, apellido_autor, año_nacimiento, año_muerte)
VALUES ('4', 'ANA', 'SALGADO', '1972', ' ');
INSERT INTO autores (codigo_autor, nombre_autor, apellido_autor, año_nacimiento, año_muerte)
VALUES ('1', 'ANDRES','ULLOA','1982', ' ');
INSERT INTO autores (codigo_autor, nombre_autor, apellido_autor, año_nacimiento, año_muerte)
VALUES ('2', 'SERGIO', 'MARDONES', '1950', '2012');
INSERT INTO autores (codigo_autor, nombre_autor, apellido_autor, año_nacimiento, año_muerte)
VALUES ('5', 'MARTIN', 'PORTA', '1976', ' ');

-- consultamos la tabla autores
SELECT * FROM autores;

--  codigo_autor | nombre_autor | apellido_autor | agno_nacimiento | agno_muerte
-- --------------+--------------+----------------+-----------------+-------------
--             3 | JOSÉ         | SALGADO        | 1968            | 2020
--             4 | ANA          | SALGADO        | 1972            |
--             1 | ANDRES       | ULLOA          | 1982            |
--             2 | SERGIO       | MARDONES       | 1950            | 2012
--             5 | MARTIN       | PORTA          | 1976            |
-- (5 rows)

-- insertamos registros en la tabla prestamos
INSERT INTO prestamos (socio, isbn_1, fecha_prestamo, fecha_devolucion)
VALUES ('1111111-1', '111-1111111-111', '2020-01-20', '2020-01-27');
INSERT INTO prestamos (socio, isbn_1, fecha_prestamo, fecha_devolucion)
VALUES ('5555555-5', '222-2222222-222', '2020-01-20', '2020-01-30');
INSERT INTO prestamos (socio, isbn_1, fecha_prestamo, fecha_devolucion)
VALUES ('3333333-3', '333-3333333-333', '2020-01-23', '2020-01-30');
INSERT INTO prestamos (socio, isbn_1, fecha_prestamo, fecha_devolucion)
VALUES ('4444444-4', '444-4444444-444', '2020-01-27', '2020-02-04');
INSERT INTO prestamos (socio, isbn_1, fecha_prestamo, fecha_devolucion)
VALUES ('2222222-2', '111-1111111-111', '2020-01-27', '2020-02-04');
INSERT INTO prestamos (socio, isbn_1, fecha_prestamo, fecha_devolucion)
VALUES ('1111111-1', '333-3333333-333', '2020-01-31', '2020-02-12');
INSERT INTO prestamos (socio, isbn_1, fecha_prestamo, fecha_devolucion)
VALUES ('3333333-3', '222-2222222-222', '2020-01-31', '2020-02-02');

-- consultamos la tabla prestamos
SELECT * FROM prestamos;

--    socio   |     isbn_1      | libro | fecha_prestamo | fecha_devolucion
-- -----------+-----------------+-------+----------------+------------------
--  1111111-1 | 111-1111111-111 |       | 2020-01-20     | 2020-01-27
--  5555555-5 | 222-2222222-222 |       | 2020-01-20     | 2020-01-30
--  3333333-3 | 333-3333333-333 |       | 2020-01-23     | 2020-01-30
--  4444444-4 | 444-4444444-444 |       | 2020-01-27     | 2020-02-04
--  2222222-2 | 111-1111111-111 |       | 2020-01-27     | 2020-02-04
--  1111111-1 | 333-3333333-333 |       | 2020-01-31     | 2020-02-12
--  3333333-3 | 222-2222222-222 |       | 2020-01-31     | 2020-02-02
-- (7 rows)

-- Insertamos registros en la tabla identidad autores



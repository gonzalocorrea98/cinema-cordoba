CREATE DATABASE CINE_CORDOBA_PROG
GO
USE CINE_CORDOBA_PROG
GO

SET DATEFORMAT dmy


create table Users(
UserID int identity(1,1),
LoginName nvarchar(100) unique not null,
Password nvarchar(100) not null,
FirstName nvarchar(100) not null,
LastName nvarchar(100) not null,
Position nvarchar(100) not null,
Email nvarchar(150) not null
)

insert into Users values('admin','admin','Gerardo','Valdez','Administrador','ger4rdovaldez@gmail.com')


--------------------------------------------------------------CLIENTES-------------------------------------------------------------
create table CLIENTES(
id_cliente int identity (1,1),
nombre_cliente varchar(50) not null,
apellido_cliente varchar(50) not null,
genero varchar(20) null,
fecha_alta datetime not null,
fecha_nacimiento datetime null,
constraint pk_clientes primary key(id_cliente),
)



----------------------------------------------------------ESTADOS--VARIOS----------------------------------------------------------
create table ESTADOS(
id_estado int identity(1,1),
estado varchar(25) not null,
constraint pk_id_estado primary key (id_estado),
)



---------------------------------------------------------------VENTA---------------------------------------------------------------
create table FORMAS_COMPRAS(
id_forma_compra int identity(1,1),
forma_compra varchar(25) not null,
descripcion varchar(100),
constraint pk_formas_compras primary key(id_forma_compra),
)

create table FORMAS_PAGOS(
id_forma_pago int identity(1,1),
forma_pago varchar (25) not null,
descripcion varchar(100) not null,
constraint pk_formas_pagos primary key(id_forma_pago),
)

--create table DESCUENTOS(
--id_descuento int identity(1,1),
--id_estado int not null,
--descuento int not null,
--descripcion varchar(100) not null,
--constraint pk_descuentos primary key(id_descuento),
--constraint fk_descuentos_estados foreign key(id_estado) references estados(id_estado),
--)

create table COMPROBANTES(
id_comprobante int identity(1,1),
id_cliente int not null,
id_forma_pago int not null,
id_forma_compra int not null,
fecha datetime not null,
id_estado int not null,
total float,
--id_descuento int not null,
--descripcion varchar(100) null,
constraint pk_comprobantes primary key(id_comprobante),
constraint fk_comprobantes_clientes foreign key(id_cliente) references clientes(id_cliente),
constraint fk_comprobantes_formas_compras foreign key(id_forma_compra) references formas_compras(id_forma_compra),
constraint fk_comprobantes_formas_pagos foreign key(id_forma_pago) references formas_pagos(id_forma_pago),
constraint fk_comprobantes_estados foreign key(id_estado) references estados(id_estado),
--constraint fk_detalles_comprobantes_descuentos foreign key(id_descuento) references descuentos(id_descuento),
)



---------------------------------------------------------------FUNCIONES---------------------------------------------------------------
create table CLASIFICACIONES(
id_clasificacion int identity(1,1),
clasificacion varchar(10) not null,
descripcion varchar(100) not null,
constraint pk_clasificaciones primary key(id_clasificacion),
)

create table IDIOMAS(
id_idioma int identity(1,1),
idioma varchar(20) not null,
subtitulos varchar(20) not null,
constraint pk_idiomas primary key(id_idioma),
)

create table DIRECTORES(
id_director int identity(1,1),
nombre varchar(50) not null,
fecha_nacimiento datetime null,
constraint pk_directores primary key(id_director),
)

create table PELICULAS(
id_pelicula int identity (1,1),
id_clasificacion int not null,
id_idioma int not null,
id_director int null,
nombre_pelicula varchar(50) not null,
fecha_estreno datetime not null,
constraint pk_peliculas primary key(id_pelicula),
constraint fk_peliculas_clasificaciones foreign key(id_clasificacion) references clasificaciones(id_clasificacion),
constraint fk_peliculas_idiomas foreign key(id_idioma) references idiomas(id_idioma),
constraint fk_peliculas_directores foreign key(id_director) references directores(id_director)
)

create table HORARIOS_FUNCIONES(
id_horario_funcion int identity (1,1),
horario time not null,
descripcion varchar (50) null
constraint pk_horarios_funcoiones primary key(id_horario_funcion),
)

create table FUNCIONES(
id_funcion int identity (1,1),
id_horario_funcion int not null,
id_pelicula int not null,
precio float not null,
constraint pk_funciones primary key(id_funcion),
constraint fk_funciones_horarios_funciones foreign key(id_horario_funcion) references horarios_funciones(id_horario_funcion),
constraint fk_funciones_peliculas foreign key(id_pelicula) references peliculas(id_pelicula),
)



---------------------------------------------------------------UNIONES DE TABLAS---------------------------------------------------------------
--create table ENTRADAS(
--id_entrada int identity (1,1),
--id_pelicula int not null,
--precio float not null,
--id_descuento int not null,
----id_cliente int not null,
----id_detalle_sala int not null,
--constraint pk_entradas primary key(id_entrada),
--constraint fk_entradas_peliculas foreign key(id_pelicula) references peliculas(id_pelicula),
--constraint fk_entradas_descuento foreign key(id_descuento) references descuentos(id_descuento),
----constraint fk_entradas_detalles_salas foreign key(id_detalle_sala) references detalles_salas(id_detalle_sala),
----constraint fk_entradas_clientes foreign key(id_cliente) references clientes(id_cliente),
--)

create table DETALLES_COMPROBANTES(
id_detalle_comprobante int identity (1,1),
id_comprobante int not null,
id_funcion int not null,
cantidad int not null,
--id_descuento int not null,
constraint pk_detalles primary key(id_detalle_comprobante),
constraint fk_detalles_comprobantes foreign key(id_comprobante) references comprobantes(id_comprobante),
constraint fk_detalles_funciones foreign key(id_funcion) references funciones(id_funcion),
--constraint fk_detalles_descuento foreign key(id_descuento) references descuentos(id_descuento),
)


---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------INSERTS-----------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

---- Insert CLIENTES ------- 40
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Gabriel',  'Santos', 'Masculino', '12/11/2020', '03/02/1960')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Hector', 'Juarez', 'Masculino', '21/01/2017', '22/04/1956')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Raul', 'Campos', 'Masculino', '03/09/2021', '05/02/1985') 
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Gaston', 'Perez', 'Masculino', '01/12/2018', '10/06/1993')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Astrid', 'Torres', 'Femenino', '12/10/2016', '10/07/1990')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Laura', 'Sosa', 'Femenino', '01/09/2016', '11/06/1999')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Graciela', 'Carranza', 'Femenino', '29/07/2015', '15/08/1994')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Victoria', 'Giovani', 'Femenino', '12/03/2006', '17/05/1992')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Luna', 'Paez', 'Femenino', '01/04/2004', '07/06/1998')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Cristian', 'Sanchez', 'Masculino', '14/11/2003', '19/04/1991')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Dana', 'Gutierrez', 'Femenino', '13/09/2002', '16/05/1999')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Franco', 'Llorente', 'Masculino', '11/11/2015', '12/01/2000')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Gimena', 'Callejos', 'Femenino', '09/07/2010', '17/03/1988')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Fabricio', 'Ruiz', 'Masculino', '18/12/2000', '03/02/1980')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Lucia', 'Acosta', 'Femenino', '18/12/2000', '03/02/1980')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Diego', 'Rojas', 'Masculino', '17/11/2001', '04/03/1981')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Agustina', 'Flores', 'Femenino', '19/10/2002', '06/04/1982')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Maxi', 'Diaz', 'Masculino', '20/09/2003', '03/05/1983')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Florencia', 'Sosa', 'Femenino', '18/08/2004', '06/06/1984')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Nicolas', 'Perez', 'Masculino', '21/07/2005', '07/07/1985')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Raul', 'Salas', 'Masculino', '12/11/2020', '03/02/1999')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Sebastian', 'Paez', 'Masculino', '05/05/2015', '16/05/1999')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Raul', 'Carrasco', 'Masculino', '11/01/2021', '03/06/1990')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Gabriel', 'Perez', 'Masculino', '12/10/2020', '03/05/1997')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Ana', 'Torres', 'Femenino', '15/12/2013', '05/02/1998')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Luz', 'Dominguez', 'Femenino', '05/08/2012', '07/06/1999')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Monica', 'Carranza', 'Femenino', '11/07/2014', '08/09/2000')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Victoria', 'Di Bello', 'Femenino', '01/12/2000', '06/05/1980')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Luna', 'Zapata', 'Femenino', '20/11/2020', '03/03/1997')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Cristina', 'Sanchez', 'Femenino', '11/06/2012', '01/08/2005')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Daniela', 'Gutierrez', 'Femenino', '22/12/2020', '03/02/2010')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Mariana', 'Caravajal', 'Femenino', '23/12/2012', '02/09/2001')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Gisel', 'Villa', 'Femenino', '11/11/2007', '17/02/1997')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Facundo', 'Rosas', 'Masculino', '26/08/2013', '16/12/2003')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Liz', 'Furtado', 'Femenino', '04/04/2005', '04/04/1996')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Damian', 'Rojas', 'Masculino', '12/11/2020', '03/02/1997')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Andrea', 'Coniglio', 'Femenino', '09/07/2002', '28/10/1990')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Mariano', 'Diaz', 'Masculino', '21/12/2001', '02/04/1988')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Marcela', 'Sauro', 'Femenino', '11/07/2009', '12/09/2001')
INSERT INTO CLIENTES(nombre_cliente,  apellido_cliente ,genero, fecha_alta, fecha_nacimiento) VALUES('Jordy', 'Perez', 'Masculino', '14/02/2016', '04/06/1999')


----------- insert ESTADOS --------
INSERT INTO ESTADOS(estado) VALUES ('Habilitado')
INSERT INTO ESTADOS(estado) VALUES ('Desabilitado')
INSERT INTO ESTADOS(estado) VALUES ('Pendiente')
INSERT INTO ESTADOS(estado) VALUES ('Concretado')
INSERT INTO ESTADOS(estado) VALUES ('Alta')
INSERT INTO ESTADOS(estado) VALUES ('Baja')


----- insert FORMAS_COMPRAS --------
INSERT INTO FORMAS_COMPRAS(forma_compra,descripcion) VALUES ('Pagina Web','No Presencial')
INSERT INTO FORMAS_COMPRAS(forma_compra,descripcion) VALUES ('Boleteria','Presencial')
INSERT INTO FORMAS_COMPRAS(forma_compra,descripcion) VALUES ('Auto-Boleteria','Presencial')
INSERT INTO FORMAS_COMPRAS(forma_compra,descripcion) VALUES ('App','No Presencial')


----- insert FORMAS_PAGOS --------
INSERT INTO FORMAS_PAGOS(forma_pago,descripcion) VALUES ('Efectivo','Solo en Boleterias')
INSERT INTO FORMAS_PAGOS(forma_pago,descripcion) VALUES ('Tarjeta Debito','Visa, American Express, Mastercard')
INSERT INTO FORMAS_PAGOS(forma_pago,descripcion) VALUES ('Tarjeta Credito','Visa, American Express, Mastercard')
INSERT INTO FORMAS_PAGOS(forma_pago,descripcion) VALUES ('Transferencia Bancaria','')
INSERT INTO FORMAS_PAGOS(forma_pago,descripcion) VALUES ('Mercado Pago','')
INSERT INTO FORMAS_PAGOS(forma_pago,descripcion) VALUES ('MODO','')

----- insert DESCUENTOS --------
--INSERT INTO DESCUENTOS(id_estado,descuento,descripcion) VALUES (1,0,'Precio Regular')
--INSERT INTO DESCUENTOS(id_estado,descuento,descripcion) VALUES (1,35,'Jubilados')
--INSERT INTO DESCUENTOS(id_estado,descuento,descripcion) VALUES (1,25,'Menores de 13 Años')
--INSERT INTO DESCUENTOS(id_estado,descuento,descripcion) VALUES (1,15,'Pago con Visa')
--INSERT INTO DESCUENTOS(id_estado,descuento,descripcion) VALUES (2,50,'Especial Aniversario')

--id_comprobante int identity(1,1),
--id_cliente int not null,
--id_forma_pago int not null,
--id_forma_compra int not null,
--fecha datetime not null,


----- insert COMPROBANTES --------
INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_cliente, fecha, id_estado, total) VALUES (1, 1, 1, '16/11/2022', 5, 0)    
INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_cliente, fecha, id_estado, total) VALUES (1, 2, 2, '16/11/2022', 5, 0)
--INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_cliente, fecha, id_estado) VALUES (1, 3, 3, '16/11/2022',6)
--INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_cliente, fecha, id_estado) VALUES (2, 4, 4, '16/11/2022',5)
--INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_cliente, fecha, id_estado) VALUES (2, 1, 5, '16/11/2022',5)
--INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_cliente, fecha, id_estado) VALUES (2, 2, 6, '16/11/2022',5)
--INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_cliente, fecha, id_estado) VALUES (2, 3, 7, '16/11/2022',5)
--INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_cliente, fecha, id_estado) VALUES (3, 1, 8, '16/11/2022',5)
--INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_cliente, fecha, id_estado) VALUES (3, 2, 9, '16/11/2022',5)
--INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_cliente, fecha, id_estado) VALUES (3, 2, 10, '16/11/2022',5)     
--INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_cliente, fecha, id_estado) VALUES (3, 1, 11, '16/11/2022',5)             
--INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_cliente, fecha, id_estado) VALUES (4, 2, 12, '16/11/2022',5)        
--INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_cliente, fecha, id_estado) VALUES (4, 1, 13, '16/11/2022',5)
--INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_cliente, fecha, id_estado) VALUES (5, 2, 14, '16/11/2022',5)
--INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_cliente, fecha, id_estado) VALUES (5, 1, 15, '16/11/2022',5)
--INSERT INTO COMPROBANTES(id_forma_pago, id_forma_compra, id_cliente, fecha, id_estado) VALUES (5, 3, 16, '16/11/2022',5)


---- Insert Clasificaciones -------
INSERT INTO CLASIFICACIONES(clasificacion,descripcion) VALUES ('G', 'Apta para todo público')
INSERT INTO CLASIFICACIONES(clasificacion,descripcion) VALUES ('PG', 'Guía paternal sugerida')
INSERT INTO CLASIFICACIONES(clasificacion,descripcion) VALUES ('PG-13', 'guía paternal estricta para menores de 13 años')
INSERT INTO CLASIFICACIONES(clasificacion,descripcion) VALUES ('R', 'Menores de 17 años requiere compañia de padre o tutor adulto')
INSERT INTO CLASIFICACIONES(clasificacion,descripcion) VALUES ('NC', 'Nadie de 17 años o menos es admitido')


---- Insert IDIOMAS -------
INSERT INTO IDIOMAS(idioma,subtitulos) VALUES ('Castellano','Sin Subtitulos')
INSERT INTO IDIOMAS(idioma,subtitulos) VALUES ('Castellano','Sub-Castellano')
INSERT INTO IDIOMAS(idioma,subtitulos) VALUES ('Inglés','Sub-Castellano')
INSERT INTO IDIOMAS(idioma,subtitulos) VALUES ('Ingles','Sub-Ingles')
INSERT INTO IDIOMAS(idioma,subtitulos) VALUES ('Ingles','Sin Subtitulos')
INSERT INTO IDIOMAS(idioma,subtitulos) VALUES ('Portugues','Sub-Castellano')
INSERT INTO IDIOMAS(idioma,subtitulos) VALUES ('Japones','Sub-Castellano')
INSERT INTO IDIOMAS(idioma,subtitulos) VALUES ('Frances','Sub-Castellano')
INSERT INTO IDIOMAS(idioma,subtitulos) VALUES ('Italiano','Sub-Castellano')


---- Insert DIRECTORES ------- (10)
set dateformat dmy
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('Steven Spielberg','18/12/1946')
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('Christopher Nolan','30/07/1970')
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('Todd Phillips','20/12/1970')
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('Adrian Molina','23/08/1985')
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('Andrew Stanton','03/12/1965')
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('Bob Peterson','18/01/1961')
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('Martin Scorsese','17/11/1942')
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('Lee Unkrich','08/08/1967')
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('Tim Burton','25/08/1958')
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('Juan José Campanella','19/07/1959')
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('Paul Thomas Anderson','26/06/1970')
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('Quentin Tarantino','27/03/1963')
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('Francis Ford Coppola','07/04/1939')
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('David Fincher','28/08/1962')
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('Woody Allen','01/12/1935')
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('Guillermo Del Toro','09/10/1964')
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('James Cameron','16/08/1954')
INSERT INTO DIRECTORES (nombre,fecha_nacimiento) VALUES ('Mel Gibson','03/01/1956')


---- Insert PELICULAS ------- (20)
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (5, 1, 1, 'Tiburon', '31/07/1975') 
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (4, 1, 1, 'Jurassic Park', '15/07/1993') 
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (3, 1, 2, 'Batman: El caballero de la noche', '17/07/2008') 
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (1, 1, 2, 'interstellar', '06/11/2014') 
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (4, 2, 3, 'Joker', '04/10/2019') 
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (4, 1, 3, 'Que paso ayer?', '10/08/2009')
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (1, 1, 4, 'Coco', '22/11/2017') 
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (1, 1, 4, 'Un gran dinosaurio', '26/11/2015') 
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (1, 1, 5, 'WALL-E', '09/07/2008') 
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (1, 1, 5, 'Buscando a Nemo', '03/07/2003') 
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (1, 1, 6, 'Up : una aventura de altura', '11/06/2009') 
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (1, 1, 6, 'Cars', '29/06/2006')
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (4, 2, 7, 'El irlandes', '21/11/2019')
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (4, 1, 7, 'El lobo de Wall Street', '02/01/2014')
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (1, 1, 8, 'Monsters, Inc', '06/12/2001')
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (1, 1, 8, 'Toy Story', '14/03/1996')
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (2, 1, 9, 'Alicia en el pais de las maravillas', '04/03/2010')
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (2, 1, 9, 'Dumbo', '28/03/2019')
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (4, 1, 10, 'El secreto de sus ojos', '13/08/2009')
INSERT INTO PELICULAS (id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno) VALUES (1, 1, 10, 'Metegol', '18/07/2013')


---- Insert HORARIOS_FUNCIONES ------- (17)
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('10:00:00', 'Matutino')
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('14:00:00', 'Visita escolar')
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('18:00:00', '')
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('19:00:00', '')
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('20:00:00', '')
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('20:30:00', 'Especial San Valentin')
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('21:00:00', '')
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('23:00:00', 'Especial Hallowen')
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('00:15:00', 'Trasnoche')
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('00:30:00', 'Trasnoche')
INSERT INTO HORARIOS_FUNCIONES (horario, descripcion) VALUES ('01:00:00', 'Trasnoche')


---- Insert FUNCIONES -------
INSERT INTO FUNCIONES(id_horario_funcion, id_pelicula, precio) VALUES (3,1,400)
INSERT INTO FUNCIONES(id_horario_funcion, id_pelicula, precio) VALUES (4,1,400)
INSERT INTO FUNCIONES(id_horario_funcion, id_pelicula, precio) VALUES (5,1,400)
INSERT INTO FUNCIONES(id_horario_funcion, id_pelicula, precio) VALUES (6,11,1000)
INSERT INTO FUNCIONES(id_horario_funcion, id_pelicula, precio) VALUES (8,1,1000)
INSERT INTO FUNCIONES(id_horario_funcion, id_pelicula, precio) VALUES (3,3,400)
INSERT INTO FUNCIONES(id_horario_funcion, id_pelicula, precio) VALUES (4,3,400)
INSERT INTO FUNCIONES(id_horario_funcion, id_pelicula, precio) VALUES (3,2,400)
INSERT INTO FUNCIONES(id_horario_funcion, id_pelicula, precio) VALUES (4,2,400)
INSERT INTO FUNCIONES(id_horario_funcion, id_pelicula, precio) VALUES (5,2,400)


---- Insert DETALLLE_COMPROBANTES -------
INSERT INTO DETALLES_COMPROBANTES(id_comprobante, id_funcion, cantidad) VALUES (1, 1, 1)
INSERT INTO DETALLES_COMPROBANTES(id_comprobante, id_funcion, cantidad) VALUES (2, 2, 2)
--INSERT INTO DETALLES_COMPROBANTES(id_comprobante, id_funcion, cantidad) VALUES (3, 3, 1)
--INSERT INTO DETALLES_COMPROBANTES(id_comprobante, id_funcion, cantidad) VALUES (4, 4, 1)
--INSERT INTO DETALLES_COMPROBANTES(id_comprobante, id_funcion, cantidad) VALUES (5, 5, 4)   
--INSERT INTO DETALLES_COMPROBANTES(id_comprobante, id_funcion, cantidad) VALUES (6, 1, 1)
--INSERT INTO DETALLES_COMPROBANTES(id_comprobante, id_funcion, cantidad) VALUES (7, 2, 6)
--INSERT INTO DETALLES_COMPROBANTES(id_comprobante, id_funcion, cantidad) VALUES (8, 3, 2)
--INSERT INTO DETALLES_COMPROBANTES(id_comprobante, id_funcion, cantidad) VALUES (9, 4, 2)
--INSERT INTO DETALLES_COMPROBANTES(id_comprobante, id_funcion, cantidad) VALUES (10, 5, 2)
--INSERT INTO DETALLES_COMPROBANTES(id_comprobante, id_funcion, cantidad) VALUES (11, 1, 2)
--INSERT INTO DETALLES_COMPROBANTES(id_comprobante, id_funcion, cantidad) VALUES (12, 2, 1)
--INSERT INTO DETALLES_COMPROBANTES(id_comprobante, id_funcion, cantidad) VALUES (13, 3, 3)
--INSERT INTO DETALLES_COMPROBANTES(id_comprobante, id_funcion, cantidad) VALUES (14, 4, 1)
--INSERT INTO DETALLES_COMPROBANTES(id_comprobante, id_funcion, cantidad) VALUES (15, 5, 7)
--INSERT INTO DETALLES_COMPROBANTES(id_comprobante, id_funcion, cantidad) VALUES (16, 1, 1)


-------------------------------------------PROCEDIMIENTOS ALMACENADOS----------------------------------

--------------------------------------SP PARA TABLA SOPORTE-------------------------------------------
go
--CONSULTAR PELICULAS
CREATE PROC SP_CONSULTAR_PELICULAS
AS
BEGIN
	SELECT * from PELICULAS;
END

GO


--INSERTAR PELICULAS
CREATE PROC SP_INSERTAR_PELICULA
	@idClasificacion INT,
	@idIdioma INT,
	@idDirector INT,
	@nombrePelicula VARCHAR (100),
	@fechaEstreno DATETIME
	--@pelicula_nro INT OUTPUT
AS
BEGIN
	INSERT INTO PELICULAS(id_clasificacion, id_idioma, id_director, nombre_pelicula, fecha_estreno)
    VALUES (@idClasificacion, @idIdioma, @idDirector, @nombrePelicula, @fechaEstreno)
    --Asignamos el valor del último ID autogenerado (obtenido --  
    --mediante la función SCOPE_IDENTITY() de SQLServer)	
    --SET @pelicula_nro = SCOPE_IDENTITY();
END

GO

--MODIFICAR PELICULA
CREATE PROC SP_MODIFICAR_PELICULA
	@idClasificacion INT,
	@idIdioma INT,
	@idDirector INT,
	@nombrePelicula VARCHAR (100),
	@fechaEstreno DATETIME,
	@peliculaNro INT
AS
BEGIN
	UPDATE PELICULAS SET id_clasificacion = @idClasificacion, id_idioma = @idIdioma, id_director = @idDirector,
		   nombre_pelicula = @nombrePelicula, fecha_estreno = @fechaEstreno 
	WHERE id_pelicula = @peliculaNro;
	
END


GO
--BORRAR PELICULA
CREATE PROC BORRAR_PELICULA
	@pelicula_nro int
AS
BEGIN
	DELETE 
	FROM PELICULAS
	WHERE id_pelicula = @pelicula_nro
END


GO
--CONSULTAR DIRECTORES
CREATE PROC SP_CONSULTAR_DIRECTORES
AS
BEGIN
SELECT id_director,nombre FROM DIRECTORES
END


GO

--CONSULTAR IDIOMAS
CREATE PROC SP_CONSULTAR_IDIOMAS
AS
BEGIN
SELECT id_idioma, idioma + ' | ' + subtitulos as idioma FROM IDIOMAS
END


GO
--CONSULTAR CLASIFICACION
CREATE PROC SP_CONSULTAR_CLASIFICACIONES
AS
BEGIN
SELECT id_clasificacion, clasificacion from CLASIFICACIONES
end








--SP CONSULTAR COMPROBANTES
GO
CREATE PROC SP_CONSULTAR_COMPROBANTES
AS
BEGIN
	SELECT * FROM COMPROBANTES;
END


GO
--INSERTAR MAESTRO
Alter PROC SP_INSERTAR_MAESTRO
	@idCliente INT,
	@idFormaPago INT,
	@idFormaCompra INT,
	@total FLOAT,
	@comprobante_nro INT OUTPUT
AS
BEGIN
	INSERT INTO COMPROBANTES(id_cliente, id_forma_pago, id_forma_compra, fecha, id_estado, total)
    VALUES (@idCliente, @idFormaPago, @idFormaCompra, GETDATE(), 5, @total);
    --Asignamos el valor del último ID autogenerado (obtenido --  
    --mediante la función SCOPE_IDENTITY() de SQLServer)	
    SET @comprobante_nro = SCOPE_IDENTITY();
END


GO
--SP_INSERTAR_DETALLE
CREATE PROC SP_INSERTAR_DETALLE 
	@idComprobante int,
	@idFuncion int, 
	@cantidad int
AS
BEGIN
	INSERT INTO DETALLES_COMPROBANTES(id_comprobante, id_funcion, cantidad)
	VALUES (@idComprobante, @idFuncion, @cantidad); 
END

GO

--SP_BORRAR_COMPROBANTE
CREATE PROC SP_BORRAR_COMPROBANTE
	@comprobante_nro int
AS
BEGIN
	UPDATE COMPROBANTES
	SET id_estado = 6
	WHERE id_comprobante = @comprobante_nro
END


GO


--MODIFICAR MAESTRO
CREATE PROC SP_MODIFICAR_MAESTRO
	@comprobante_nro INT,
	@idCliente INT,
	@idformaPago INT,
	@idFormaCompra INT,
	@total float
AS
BEGIN
	UPDATE COMPROBANTES SET id_cliente = @idCliente, id_forma_pago = @idFormaPago, id_forma_compra = @idFormaCompra, total = @total				
	WHERE id_comprobante = @comprobante_nro;
	DELETE DETALLES_COMPROBANTES
	WHERE id_comprobante = @comprobante_nro;
END


GO






















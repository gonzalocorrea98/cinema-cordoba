CREATE DATABASE CINE_CORDOBA_PROG
GO
USE [CINE_CORDOBA_PROG]
GO
/****** Object:  Table [dbo].[CLASIFICACIONES]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLASIFICACIONES](
	[id_clasificacion] [int] IDENTITY(1,1) NOT NULL,
	[clasificacion] [varchar](10) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [pk_clasificaciones] PRIMARY KEY CLUSTERED 
(
	[id_clasificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENTES]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTES](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre_cliente] [varchar](50) NOT NULL,
	[apellido_cliente] [varchar](50) NOT NULL,
	[genero] [varchar](20) NULL,
	[fecha_alta] [datetime] NOT NULL,
	[fecha_nacimiento] [datetime] NULL,
 CONSTRAINT [pk_clientes] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMPROBANTES]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPROBANTES](
	[id_comprobante] [int] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NOT NULL,
	[id_forma_pago] [int] NOT NULL,
	[id_forma_compra] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[id_estado] [int] NOT NULL,
	[total] [float] NULL,
 CONSTRAINT [pk_comprobantes] PRIMARY KEY CLUSTERED 
(
	[id_comprobante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLES_COMPROBANTES]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLES_COMPROBANTES](
	[id_detalle_comprobante] [int] IDENTITY(1,1) NOT NULL,
	[id_comprobante] [int] NOT NULL,
	[id_funcion] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
 CONSTRAINT [pk_detalles] PRIMARY KEY CLUSTERED 
(
	[id_detalle_comprobante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIRECTORES]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIRECTORES](
	[id_director] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[fecha_nacimiento] [datetime] NULL,
 CONSTRAINT [pk_directores] PRIMARY KEY CLUSTERED 
(
	[id_director] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ESTADOS]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESTADOS](
	[id_estado] [int] IDENTITY(1,1) NOT NULL,
	[estado] [varchar](25) NOT NULL,
 CONSTRAINT [pk_id_estado] PRIMARY KEY CLUSTERED 
(
	[id_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FORMAS_COMPRAS]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FORMAS_COMPRAS](
	[id_forma_compra] [int] IDENTITY(1,1) NOT NULL,
	[forma_compra] [varchar](25) NOT NULL,
	[descripcion] [varchar](100) NULL,
 CONSTRAINT [pk_formas_compras] PRIMARY KEY CLUSTERED 
(
	[id_forma_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FORMAS_PAGOS]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FORMAS_PAGOS](
	[id_forma_pago] [int] IDENTITY(1,1) NOT NULL,
	[forma_pago] [varchar](25) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [pk_formas_pagos] PRIMARY KEY CLUSTERED 
(
	[id_forma_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FUNCIONES]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FUNCIONES](
	[id_funcion] [int] IDENTITY(1,1) NOT NULL,
	[id_horario_funcion] [int] NOT NULL,
	[id_pelicula] [int] NOT NULL,
	[precio] [float] NOT NULL,
 CONSTRAINT [pk_funciones] PRIMARY KEY CLUSTERED 
(
	[id_funcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HORARIOS_FUNCIONES]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HORARIOS_FUNCIONES](
	[id_horario_funcion] [int] IDENTITY(1,1) NOT NULL,
	[horario] [time](7) NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [pk_horarios_funcoiones] PRIMARY KEY CLUSTERED 
(
	[id_horario_funcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IDIOMAS]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IDIOMAS](
	[id_idioma] [int] IDENTITY(1,1) NOT NULL,
	[idioma] [varchar](20) NOT NULL,
	[subtitulos] [varchar](20) NOT NULL,
 CONSTRAINT [pk_idiomas] PRIMARY KEY CLUSTERED 
(
	[id_idioma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PELICULAS]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PELICULAS](
	[id_pelicula] [int] IDENTITY(1,1) NOT NULL,
	[id_clasificacion] [int] NOT NULL,
	[id_idioma] [int] NOT NULL,
	[id_director] [int] NULL,
	[nombre_pelicula] [varchar](50) NOT NULL,
	[fecha_estreno] [datetime] NOT NULL,
 CONSTRAINT [pk_peliculas] PRIMARY KEY CLUSTERED 
(
	[id_pelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[LoginName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Position] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
UNIQUE NONCLUSTERED 
(
	[LoginName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[COMPROBANTES]  WITH CHECK ADD  CONSTRAINT [fk_comprobantes_clientes] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[CLIENTES] ([id_cliente])
GO
ALTER TABLE [dbo].[COMPROBANTES] CHECK CONSTRAINT [fk_comprobantes_clientes]
GO
ALTER TABLE [dbo].[COMPROBANTES]  WITH CHECK ADD  CONSTRAINT [fk_comprobantes_estados] FOREIGN KEY([id_estado])
REFERENCES [dbo].[ESTADOS] ([id_estado])
GO
ALTER TABLE [dbo].[COMPROBANTES] CHECK CONSTRAINT [fk_comprobantes_estados]
GO
ALTER TABLE [dbo].[COMPROBANTES]  WITH CHECK ADD  CONSTRAINT [fk_comprobantes_formas_compras] FOREIGN KEY([id_forma_compra])
REFERENCES [dbo].[FORMAS_COMPRAS] ([id_forma_compra])
GO
ALTER TABLE [dbo].[COMPROBANTES] CHECK CONSTRAINT [fk_comprobantes_formas_compras]
GO
ALTER TABLE [dbo].[COMPROBANTES]  WITH CHECK ADD  CONSTRAINT [fk_comprobantes_formas_pagos] FOREIGN KEY([id_forma_pago])
REFERENCES [dbo].[FORMAS_PAGOS] ([id_forma_pago])
GO
ALTER TABLE [dbo].[COMPROBANTES] CHECK CONSTRAINT [fk_comprobantes_formas_pagos]
GO
ALTER TABLE [dbo].[DETALLES_COMPROBANTES]  WITH CHECK ADD  CONSTRAINT [fk_detalles_comprobantes] FOREIGN KEY([id_comprobante])
REFERENCES [dbo].[COMPROBANTES] ([id_comprobante])
GO
ALTER TABLE [dbo].[DETALLES_COMPROBANTES] CHECK CONSTRAINT [fk_detalles_comprobantes]
GO
ALTER TABLE [dbo].[DETALLES_COMPROBANTES]  WITH CHECK ADD  CONSTRAINT [fk_detalles_funciones] FOREIGN KEY([id_funcion])
REFERENCES [dbo].[FUNCIONES] ([id_funcion])
GO
ALTER TABLE [dbo].[DETALLES_COMPROBANTES] CHECK CONSTRAINT [fk_detalles_funciones]
GO
ALTER TABLE [dbo].[FUNCIONES]  WITH CHECK ADD  CONSTRAINT [fk_funciones_horarios_funciones] FOREIGN KEY([id_horario_funcion])
REFERENCES [dbo].[HORARIOS_FUNCIONES] ([id_horario_funcion])
GO
ALTER TABLE [dbo].[FUNCIONES] CHECK CONSTRAINT [fk_funciones_horarios_funciones]
GO
ALTER TABLE [dbo].[FUNCIONES]  WITH CHECK ADD  CONSTRAINT [fk_funciones_peliculas] FOREIGN KEY([id_pelicula])
REFERENCES [dbo].[PELICULAS] ([id_pelicula])
GO
ALTER TABLE [dbo].[FUNCIONES] CHECK CONSTRAINT [fk_funciones_peliculas]
GO
ALTER TABLE [dbo].[PELICULAS]  WITH CHECK ADD  CONSTRAINT [fk_peliculas_clasificaciones] FOREIGN KEY([id_clasificacion])
REFERENCES [dbo].[CLASIFICACIONES] ([id_clasificacion])
GO
ALTER TABLE [dbo].[PELICULAS] CHECK CONSTRAINT [fk_peliculas_clasificaciones]
GO
ALTER TABLE [dbo].[PELICULAS]  WITH CHECK ADD  CONSTRAINT [fk_peliculas_directores] FOREIGN KEY([id_director])
REFERENCES [dbo].[DIRECTORES] ([id_director])
GO
ALTER TABLE [dbo].[PELICULAS] CHECK CONSTRAINT [fk_peliculas_directores]
GO
ALTER TABLE [dbo].[PELICULAS]  WITH CHECK ADD  CONSTRAINT [fk_peliculas_idiomas] FOREIGN KEY([id_idioma])
REFERENCES [dbo].[IDIOMAS] ([id_idioma])
GO
ALTER TABLE [dbo].[PELICULAS] CHECK CONSTRAINT [fk_peliculas_idiomas]
GO
/****** Object:  StoredProcedure [dbo].[BORRAR_PELICULA]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--BORRAR PELICULA
CREATE PROC [dbo].[BORRAR_PELICULA]
	@pelicula_nro int
AS
BEGIN
	DELETE 
	FROM PELICULAS
	WHERE id_pelicula = @pelicula_nro
END


GO
/****** Object:  StoredProcedure [dbo].[SP_BORRAR_COMPROBANTE]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_BORRAR_COMPROBANTE]
	@comprobante_nro int
AS
BEGIN
	UPDATE COMPROBANTES
	SET id_estado = 6
	WHERE id_comprobante = @comprobante_nro
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_CLASIFICACIONES]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CONSULTAR CLASIFICACION
CREATE PROC [dbo].[SP_CONSULTAR_CLASIFICACIONES]
AS
BEGIN
SELECT id_clasificacion, clasificacion from CLASIFICACIONES
end








--SP CONSULTAR COMPROBANTES
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_CLIENTES]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_CONSULTAR_CLIENTES]
AS
BEGIN
	SELECT id_cliente, apellido_cliente + ', ' + nombre_cliente AS nombre
	FROM CLIENTES
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_COMPROBANTES]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_CONSULTAR_COMPROBANTES]
AS
BEGIN
	SELECT id_comprobante, c.apellido_cliente + ', ' + c.nombre_cliente as cliente, fp.forma_pago as forma_pago, fc.forma_compra as forma_compra, co.total as total, co.fecha as fecha
	FROM COMPROBANTES co join CLIENTES c on co.id_cliente = c.id_cliente
						 join FORMAS_COMPRAS fc on co.id_forma_compra = fc.id_forma_compra
						 join FORMAS_PAGOS fp on co.id_forma_pago = fp.id_forma_pago
	where id_estado = 5
END

GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_DIRECTORES]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CONSULTAR DIRECTORES
CREATE PROC [dbo].[SP_CONSULTAR_DIRECTORES]
AS
BEGIN
SELECT id_director,nombre FROM DIRECTORES
END


GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_FORMA_COMPRA]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_CONSULTAR_FORMA_COMPRA]
AS
BEGIN
	SELECT id_forma_compra, forma_compra + ' (' + descripcion + ')' as descripcion
	FROM FORMAS_COMPRAS
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_FORMA_PAGO]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_CONSULTAR_FORMA_PAGO]
AS
BEGIN
	SELECT id_forma_pago, forma_pago + ' (' + descripcion + ')' as descripcion
	FROM FORMAS_PAGOS
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_FUNCIONES]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_CONSULTAR_FUNCIONES]
AS
BEGIN
	SELECT id_funcion, precio, p.nombre_pelicula + ' | ' + CONVERT(varchar, h.horario , 108) AS descripcion
	FROM FUNCIONES f join PELICULAS p on f.id_pelicula = p.id_pelicula
					 join HORARIOS_FUNCIONES h on f.id_horario_funcion = h.id_horario_funcion 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_IDIOMAS]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--CONSULTAR IDIOMAS
CREATE PROC [dbo].[SP_CONSULTAR_IDIOMAS]
AS
BEGIN
SELECT id_idioma, idioma + ' | ' + subtitulos as idioma FROM IDIOMAS
END


GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_PELICULAS]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CONSULTAR PELICULAS
CREATE PROC [dbo].[SP_CONSULTAR_PELICULAS]
AS
BEGIN
	SELECT * from PELICULAS;
END

GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_DETALLE]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SP_INSERTAR_DETALLE
CREATE PROC [dbo].[SP_INSERTAR_DETALLE] 
	@idComprobante int,
	@idFuncion int, 
	@cantidad int
AS
BEGIN
	INSERT INTO DETALLES_COMPROBANTES(id_comprobante, id_funcion, cantidad)
	VALUES (@idComprobante, @idFuncion, @cantidad); 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_MAESTRO]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--INSERTAR MAESTRO
CREATE PROC [dbo].[SP_INSERTAR_MAESTRO]
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
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_PELICULA]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--INSERTAR PELICULAS
CREATE PROC [dbo].[SP_INSERTAR_PELICULA]
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
/****** Object:  StoredProcedure [dbo].[SP_MODIFICAR_MAESTRO]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--MODIFICAR MAESTRO
CREATE PROC [dbo].[SP_MODIFICAR_MAESTRO]
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
/****** Object:  StoredProcedure [dbo].[SP_MODIFICAR_PELICULA]    Script Date: 16/11/2022 17:31:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--MODIFICAR PELICULA
CREATE PROC [dbo].[SP_MODIFICAR_PELICULA]
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
USE [master]
GO
ALTER DATABASE [CINE_CORDOBA_PROG] SET  READ_WRITE 
GO

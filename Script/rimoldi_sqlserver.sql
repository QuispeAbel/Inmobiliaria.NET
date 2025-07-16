USE [Inmobiliaria];
GO
--
-- Base de datos: rimoldi
--
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla comercial
--
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comercial](
	[idComercial] [int] NOT NULL,
	[permisos_municipales] [varchar](50) NOT NULL,
	[banio] [bit] NOT NULL,
  [cocina] [bit] NOT NULL,
  [vidriera] [bit] NOT NULL,
	[deposito] [bit] NOT NULL,
  [idPropiedad] [int] NOT NULL,
 CONSTRAINT [PK_Comentario] PRIMARY KEY CLUSTERED 
(
	[idComercial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
-- Estructura de tabla para la tabla contrato
--
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contrato](
	[nro_contrato] [int] NOT NULL,
	[fecha_inicio] [datetime] NOT NULL,
	[fecha_fin] [datetime] NOT NULL,
	[fecha_cancelacion] [datetime] NULL,
	[idPropiedad] [int] NOT NULL,
	[idPersona] [int] NOT NULL,
	[idMartillero] [int] NOT NULL,
 CONSTRAINT [PK_contrato] PRIMARY KEY CLUSTERED 
(
	[nro_contrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
-- --------------------------------------------------------
-- Estructura de tabla para la tabla estado
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estado](
	[idEstado] [int] NOT NULL,
	[estado] [varchar](50) NOT NULL,
 CONSTRAINT [PK_estado] PRIMARY KEY CLUSTERED 
(
	[idEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--
-- Estructura de tabla para la tabla estadocontrato
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estadocontrato](
	[nro_contrato] [int] NOT NULL,
	[idEstado] [int] NOT NULL,
 CONSTRAINT [PK_estadocontrato] PRIMARY KEY CLUSTERED 
(
	[nro_contrato] ASC,
	[idEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Estructura de tabla para la tabla familiar
--
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[familiar](
	[idFamiliar] [int] NOT NULL,
	[cant_ambientes] [int] NOT NULL,
	[cant_banios] [int] NOT NULL,
	[cant_autos_cochera] [int] NOT NULL,
	[piscina] [bit] NOT NULL,
	[permite_mascotas] [bit] NOT NULL,
	[permite_ninios] [bit] NOT NULL,
	[idPropiedad] [int] NOT NULL,
 CONSTRAINT [PK_familiar] PRIMARY KEY CLUSTERED 
(
	[idFamiliar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
--
-- Estructura de tabla para la tabla firma
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[firma](
	[nro_contrato] [int] NOT NULL,
	[idGarante] [int] NOT NULL,
 CONSTRAINT [PK_firma] PRIMARY KEY CLUSTERED 
(
	[nro_contrato] ASC,
	[idGarante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Estructura de tabla para la tabla garante
--
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[garante](
	[idGarante] [int] NOT NULL,
	[ingresos] [int] NOT NULL,
	[empresa_trabaja] [varchar](50) NOT NULL,
	[contacto_trabaja] [varchar](50) NOT NULL,
	[idPersona] [int] NOT NULL,
 CONSTRAINT [PK_garante] PRIMARY KEY CLUSTERED 
(
	[idGarante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Estructura de tabla para la tabla imagen_prop
--
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[imagen_prop](
	[idPropiedad] [int] NOT NULL,
	[URL] [text] NOT NULL,
 CONSTRAINT [PK_imagen_prop] PRIMARY KEY CLUSTERED 
(
	[idPropiedad] ASC,
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--
-- Estructura de tabla para la tabla inquilino
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inquilino](
	[idInquilino] [int] NOT NULL,
	[mascotas] [bit] NOT NULL,
	[empresa_trabaja] [varchar](50) NOT NULL,
	[cantidad_integrantes] [varchar](50) NOT NULL,
	[ingresos] [int] NOT NULL,
	[idPersona] [int] NOT NULL,
 CONSTRAINT [PK_inquilino] PRIMARY KEY CLUSTERED 
(
	[idInquilino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Estructura de tabla para la tabla martillero
--
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[martillero](
	[idMartillero] [int] NOT NULL,
	[nro_matricula] [int] NOT NULL,
	[idPersona] [int] NOT NULL,
 CONSTRAINT [PK_martillero] PRIMARY KEY CLUSTERED 
(
	[idMartillero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--
-- Estructura de tabla para la tabla persona
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persona] (
  [id] [int] NOT NULL,
  [nombre] [varchar](45) NOT NULL,
  [dni] [bigint] NOT NULL,
  [email] [varchar](45) NOT NULL,
  [celular] [bigint] NOT NULL,
  [fecha_nac] [datetime] NOT NULL,
  [username] [varchar](45) NOT NULL,
  [cuil] [bigint] NOT NULL,
CONSTRAINT [PK_persona] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
--
-- Estructura de tabla para la tabla propiedad
--
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[propiedad](
	[idPropiedad] [int] NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[alquiler] [float] NOT NULL,
	[m2_cubiertos] [int] NOT NULL,
	[m2_descubiertos] [int] NOT NULL,
	[condiciones_garantes] [varchar](50) NOT NULL,
	[expensas] [float] NOT NULL,
	[gastos] [float] NOT NULL,
	[fecha_precio_minimo] [datetime] NOT NULL,
	[cuidad] [varchar](50) NOT NULL,
	[idPropietario] [int] NOT NULL,
	[enVenta] [bit] NOT NULL,
	[enAlquiler] [bit] NOT NULL,
	[precio] [int] NOT NULL,
 CONSTRAINT [PK_propiedad] PRIMARY KEY CLUSTERED 
(
	[idPropiedad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--
-- Estructura de tabla para la tabla propietario
--
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[propietario](
	[idPropietario] [int] NOT NULL,
	[cbu] [bigint] NOT NULL,
	[idPersona] [int] NOT NULL,
 CONSTRAINT [PK_propietario] PRIMARY KEY CLUSTERED 
(
	[idPropietario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
-- Volcado

INSERT INTO persona (id, nombre, dni, email, celular, fecha_nac, username, cuil)
VALUES (1, 'John Doe', 12345678, 'john.doe@example.com', 1234567890, '1980-01-01', 'johndoe', 20123456789),
(2, 'Jane Smith', 23456789, 'jane.smith@example.com', 2345678901, '1985-02-02', 'janesmith', 20234567890),
(3, 'Alice Johnson', 34567890, 'alice.johnson@example.com', 3456789012, '1990-03-03', 'alicejohnson', 20345678901),
(4, 'Bob Brown', 45678901, 'bob.brown@example.com', 4567890123, '1995-04-04', 'bobbrown', 20456789012),
(5, 'Charlie Davis', 56789012, 'charlie.davis@example.com', 5678901234, '2000-05-05', 'charliedavis', 20567890123),
(6, 'David Evans', 67890123, 'david.evans@example.com', 6789012345, '1981-06-06', 'davidevans', 20678901234),
(7, 'Eva Green', 78901234, 'eva.green@example.com', 7890123456, '1986-07-07', 'evagreen', 20789012345),
(8, 'Frank Harris', 89012345, 'frank.harris@example.com', 8901234567, '1991-08-08', 'frankharris', 20890123456),
(9, 'Grace Lee', 90123456, 'grace.lee@example.com', 9012345678, '1996-09-09', 'gracelee', 20901234567),
(10, 'Henry Martin', 12345679, 'henry.martin@example.com', 1234567891, '1982-10-10', 'henrymartin', 20123456790),
(11, 'Ivy Nelson', 23456780, 'ivy.nelson@example.com', 2345678902, '1987-11-11', 'ivynelson', 20234567891),
(12, 'Jack Owens', 34567891, 'jack.owens@example.com', 3456789013, '1992-12-12', 'jackowens', 20345678902),
(13, 'Karen Perez', 45678902, 'karen.perez@example.com', 4567890124, '1997-01-13', 'karenperez', 20456789013),
(14, 'Leo Quinn', 56789013, 'leo.quinn@example.com', 5678901235, '1983-02-14', 'leoquinn', 20567890124),
(15, 'Mia Roberts', 67890124, 'mia.roberts@example.com', 6789012346, '1988-03-15', 'miaroberts', 20678901235),
(16, 'Nina Scott', 78901235, 'nina.scott@example.com', 7890123457, '1993-04-16', 'ninascott', 20789012346),
(17, 'Oscar Turner', 89012346, 'oscar.turner@example.com', 8901234568, '1998-05-17', 'oscarturner', 20890123457),
(18, 'Paul Walker', 90123457, 'paul.walker@example.com', 9012345679, '1984-06-18', 'paulwalker', 20901234568),
(19, 'Quinn Young', 12345680, 'quinn.young@example.com', 1234567892, '1989-07-19', 'quinnyoung', 20123456791),
(20, 'Rachel Adams', 23456781, 'rachel.adams@example.com', 2345678903, '1994-08-20', 'racheladams', 20234567892),
(21, 'Sam Baker', 34567892, 'sam.baker@example.com', 3456789014, '1999-09-21', 'sambaker', 20345678903),
(22, 'Tina Clark', 45678903, 'tina.clark@example.com', 4567890125, '1985-10-22', 'tinaclark', 20456789014),
(23, 'Uma Davis', 56789014, 'uma.davis@example.com', 5678901236, '1990-11-23', 'umadavis', 20567890125),
(24, 'Victor Evans', 67890125, 'victor.evans@example.com', 6789012347, '1995-12-24', 'victorevans', 20678901236),
(25, 'Wendy Foster', 78901236, 'wendy.foster@example.com', 7890123458, '2000-01-25', 'wendyfoster', 20789012347);

GO

INSERT INTO propiedad (idPropiedad, direccion, alquiler, m2_cubiertos, m2_descubiertos, condiciones_garantes, gastos, fecha_precio_minimo, ciudad, idPropietario, enVenta, enAlquiler, precio)
VALUES (1, '123 Main St', 1200, 100, 50, 'Good credit', 200, 100, '2023-01-01', 'City A', 1, 1, 0, 80816516),
(2, '456 Elm St', 1300, 110, 60, 'No pets', 210, 110, '2023-02-01', 'City B', 2, 1, 0, 155674),
(3, '789 Oak St', 1400, 120, 70, 'Stable job', 220, 120, '2023-03-01', 'City C', 3, 0, 1, 277331),
(4, '101 Pine St', 1500, 130, 80, 'No smoking', 230, 130, '2023-04-01', 'City D', 4, 1, 0, 43311195),
(5, '202 Maple St', 1600, 140, 90, 'Good references', 240, 140, '2023-05-01', 'City E', 1, 1, 0, 22998162),
(6, '303 Birch St', 1700, 150, 100, 'No pets', 250, 150, '2023-06-01', 'City F', 2, 0, 1, 60450829),
(7, '404 Cedar St', 1800, 160, 110, 'Good credit', 260, 160, '2023-07-01', 'City G', 3, 1, 0, 35116119),
(8, '505 Walnut St', 1900, 170, 120, 'Stable job', 270, 170, '2023-08-01', 'City H', 4, 1, 0, 57117286),
(9, '606 Chestnut St', 2000, 180, 130, 'No smoking', 280, 180, '2023-09-01', 'City I', 1, 1, 0, 36247826),
(10, '707 Ash St', 2100, 190, 140, 'Good references', 290, 190, '2023-10-01', 'City J', 2, 1, 0, 67659456),
(11, '808 Spruce St', 2200, 200, 150, 'No pets', 300, 200, '2023-11-01', 'City K', 3, 1, 0, 253133),
(12, '909 Fir St', 2300, 210, 160, 'Good credit', 310, 210, '2023-12-01', 'City L', 4, 1, 0, 38423154),
(13, '1010 Redwood St', 2400, 220, 170, 'Stable job', 320, 220, '2024-01-01', 'City M', 1, 0, 1, 24087929),
(14, '1111 Cypress St', 2500, 230, 180, 'No smoking', 330, 230, '2024-02-01', 'City N', 2, 0, 1, 78263),
(15, '1212 Palm St', 2600, 240, 190, 'Good references', 340, 240, '2024-03-01', 'City O', 3, 1, 0, 28366146),
(16, '1313 Willow St', 2700, 250, 200, 'No pets', 350, 250, '2024-04-01', 'City P', 4, 1, 0, 59842045),
(17, '1414 Poplar St', 2800, 260, 210, 'Good credit', 360, 260, '2024-05-01', 'City Q', 1, 1, 0, 96477803),
(18, '1515 Magnolia St', 2900, 270, 220, 'Stable job', 370, 270, '2024-06-01', 'City R', 2, 1, 0, 160262),
(19, '1616 Dogwood St', 3000, 280, 230, 'No smoking', 380, 280, '2024-07-01', 'City S', 3, 0, 1, 150676),
(20, '1717 Hickory St', 3100, 290, 240, 'Good references', 390, 290, '2024-08-01', 'City T', 4, 0, 1, 127017),
(21, '1818 Sycamore St', 3200, 300, 250, 'No pets', 400, 300, '2024-09-01', 'City U', 1, 1, 0, 243079),
(22, '1919 Beech St', 3300, 310, 260, 'Good credit', 410, 310, '2024-10-01', 'City V', 2, 1, 0, 166888),
(23, '2020 Alder St', 3400, 320, 270, 'Stable job', 420, 320, '2024-11-01', 'City W', 3, 1, 0, 187894),
(24, '2121 Hawthorn St', 3500, 330, 280, 'No smoking', 430, 330, '2024-12-01', 'City X', 4, 0, 1, 175554),
(25, '2222 Juniper St', 3600, 340, 290, 'Good references', 440, 340, '2025-01-01', 'City Y', 1, 0, 1, 121207),
(26, '2323 Laurel St', 3700, 350, 300, 'No pets', 450, 350, '2025-02-01', 'City Z', 2, 0, 1, 34233863),
(27, '2424 Olive St', 3800, 360, 310, 'Good credit', 460, 360, '2025-03-01', 'City AA', 3, 0, 1, 50031563),
(28, '2525 Palm St', 3900, 370, 320, 'Stable job', 470, 370, '2025-04-01', 'City BB', 4, 1, 0, 265326),
(29, '2626 Maple St', 4000, 380, 330, 'No smoking', 480, 380, '2025-05-01', 'City CC', 1, 1, 0, 244167),
(30, '2727 Cedar St', 4100, 390, 340, 'Good references', 490, 390, '2025-06-01', 'City DD', 2, 1, 0, 269548),
(31, '2828 Birch St', 4200, 400, 350, 'No pets', 500, 400, '2025-07-01', 'City EE', 3, 1, 0, 39253075),
(32, '2929 Elm St', 4300, 410, 360, 'Good credit', 510, 410, '2025-08-01', 'City FF', 4, 0, 1, 24795696),
(33, '3030 Oak St', 4400, 420, 370, 'Stable job', 520, 420, '2025-09-01', 'City GG', 1, 1, 0, 58822782),
(34, '3131 Pine St', 4500, 430, 380, 'No smoking', 530, 430, '2025-10-01', 'City HH', 2, 0, 1, 83350),
(35, '3232 Spruce St', 4600, 440, 390, 'Good references', 540, 440, '2025-11-01', 'City II', 3, 1, 0, 78895959),
(36, '3333 Fir St', 4700, 450, 400, 'No pets', 550, 450, '2025-12-01', 'City JJ', 4, 1, 0, 60526912),
(37, '3434 Redwood St', 4800, 460, 410, 'Good credit', 560, 460, '2026-01-01', 'City KK', 1, 0, 1, 188124),
(38, '3535 Cypress St', 4900, 470, 420, 'Stable job', 570, 470, '2026-02-01', 'City LL', 2, 1, 0, 234555),
(39, '3636 Palm St', 5000, 480, 430, 'No smoking', 580, 480, '2026-03-01', 'City MM', 3, 1, 0, 85088),
(40, '3737 Willow St', 5100, 490, 440, 'Good references', 590, 490, '2026-04-01', 'City NN', 4, 1, 0, 40164646),
(41, '3838 Poplar St', 5200, 500, 450, 'No pets', 600, 500, '2026-05-01', 'City OO', 1, 0, 1, 91067315),
(42, '3939 Magnolia St', 5300, 510, 460, 'Good credit', 610, 510, '2026-06-01', 'City PP', 2, 1, 0, 65939854),
(43, '4040 Dogwood St', 5400, 520, 470, 'Stable job', 620, 520, '2026-07-01', 'City QQ', 3, 0, 1, 81370937),
(44, '4141 Hickory St', 5500, 530, 480, 'No smoking', 630, 530, '2026-08-01', 'City RR', 4, 0, 1, 121468),
(45, '4242 Sycamore St', 5600, 540, 490, 'Good references', 640, 540, '2026-09-01', 'City SS', 1, 0, 1, 246792),
(46, '4343 Beech St', 5700, 550, 500, 'No pets', 650, 550, '2026-10-01', 'City TT', 2, 1, 0, 113758),
(47, '4444 Alder St', 5800, 560, 510, 'Good credit', 660, 560, '2026-11-01', 'City UU', 3, 1, 0, 27667869),
(48, '4545 Hawthorn St', 5900, 570, 520, 'Stable job', 670, 570, '2026-12-01', 'City VV', 4, 0, 1, 18129846),
(49, '4646 Juniper St', 6000, 580, 530, 'No smoking', 680, 580, '2027-01-01', 'City WW', 1, 0, 1, 93355346),
(50, '4747 Laurel St', 6100, 590, 540, 'Good references', 690, 590, '2027-02-01', 'City XX', 2, 1, 0, 238006);
GO

INSERT INTO comercial (idComercial, permisos_municipales, banio, cocina, vidriera, deposito, idPropiedad)
VALUES (1, 'Permit A', 1, 1, 1, 1, 26),
       (2, 'Permit B', 0, 1, 0, 1, 27),
       (3, 'Permit C', 1, 0, 1, 0, 28),
       (4, 'Permit D', 1, 1, 0, 1, 29),
       (5, 'Permit E', 0, 1, 1, 0, 30),
       (6, 'Permit F', 1, 0, 1, 1, 31),
       (7, 'Permit G', 0, 1, 0, 1, 32),
       (8, 'Permit H', 1, 1, 1, 0, 33),
       (9, 'Permit I', 0, 0, 1, 1, 34),
       (10, 'Permit J', 1, 1, 0, 0, 35),
       (11, 'Permit K', 0, 1, 1, 1, 36),
       (12, 'Permit L', 1, 0, 0, 1, 37),
       (13, 'Permit M', 0, 1, 1, 0, 38),
       (14, 'Permit N', 1, 1, 0, 1, 39),
       (15, 'Permit O', 0, 0, 1, 1, 40),
       (16, 'Permit P', 1, 1, 1, 0, 41),
       (17, 'Permit Q', 0, 1, 0, 1, 42),
       (18, 'Permit R', 1, 0, 1, 1, 43),
       (19, 'Permit S', 0, 1, 1, 0, 44),
       (20, 'Permit T', 1, 1, 0, 1, 45),
       (21, 'Permit U', 0, 0, 1, 1, 46),
       (22, 'Permit V', 1, 1, 1, 0, 47),
       (23, 'Permit W', 0, 1, 0, 1, 48),
       (24, 'Permit X', 1, 0, 1, 1, 49),
       (25, 'Permit Y', 0, 1, 1, 0, 50);
GO

INSERT INTO estado (idEstado, estado)
VALUES (1, 'borrador'),
(2, 'en revision'),
(3, 'aprobado'),
(4, 'esperando firmas'),
(5, 'firmado'),
(6, 'activo'),
(7, 'cancelado'),
(8, 'terminado'),
(9, 'en proceso de renovacion'),
(10, 'archivado');
GO

INSERT INTO familiar (idFamiliar, cant_ambientes, cant_banios, cant_autos_cochera, piscina, permite_mascotas, permite_ninios, idPropiedad)
VALUES (1, 3, 2, 1, 1, 1, 1, 1),
(2, 4, 3, 2, 0, 0, 1, 2),
(3, 2, 1, 1, 1, 1, 0, 3),
(4, 5, 4, 3, 0, 0, 1, 4),
(5, 3, 2, 1, 1, 1, 0, 5),
(6, 4, 3, 2, 0, 0, 1, 6),
(7, 2, 1, 1, 1, 1, 0, 7),
(8, 5, 4, 3, 0, 0, 1, 8),
(9, 3, 2, 1, 1, 1, 0, 9),
(10, 4, 3, 2, 0, 0, 1, 10),
(11, 2, 1, 1, 1, 1, 0, 11),
(12, 5, 4, 3, 0, 0, 1, 12),
(13, 3, 2, 1, 1, 1, 0, 13),
(14, 4, 3, 2, 0, 0, 1, 14),
(15, 2, 1, 1, 1, 1, 0, 15),
(16, 5, 4, 3, 0, 0, 1, 16),
(17, 3, 2, 1, 1, 1, 0, 17),
(18, 4, 3, 2, 0, 0, 1, 18),
(19, 2, 1, 1, 1, 1, 0, 19),
(20, 5, 4, 3, 0, 0, 1, 20),
(21, 3, 2, 1, 1, 1, 0, 21),
(22, 4, 3, 2, 0, 0, 1, 22),
(23, 2, 1, 1, 1, 1, 0, 23),
(24, 5, 4, 3, 0, 0, 1, 24),
(25, 3, 2, 1, 1, 1, 0, 25);
GO

INSERT INTO garante (idGarante, ingresos, empresa_trabaja, contacto_trabaja, idPersona)
VALUES (1, 150000, 'Tecro', '5492302555398', 11),
(2, 160000, 'Google', '(650) 253-0000', 12),
(3, 170000, 'Microsoft', '+34 917 547 010', 13),
(4, 180000, 'Amazon', 'contact4', 14),
(5, 190000, 'Mercado Libre', '(54 11) 4640-8000', 15);
GO

INSERT INTO propietario (idPropietario, cbu, idPersona)
VALUES (1, 1234567890123456, 16),
(2, 2345678901234567, 17),
(3, 3456789012345678, 18),
(4, 4567890123456789, 19);
GO

INSERT INTO imagen_prop (idPropiedad, URL)
VALUES (1, 'https://images.unsplash.com/photo-1493809842364-78817add7ffb?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(2, 'https://images.unsplash.com/photo-1560185009-dddeb820c7b7?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(3, 'https://images.unsplash.com/photo-1560185007-c5ca9d2c014d?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(4, 'https://images.unsplash.com/photo-1560184897-0e5d96d86acd?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(5, 'https://images.unsplash.com/photo-1697462247996-51fdc8a1fe0a?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(6, 'https://plus.unsplash.com/premium_photo-1673014202349-38687dd47f94?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(7, 'https://plus.unsplash.com/premium_photo-1673014201324-2eccc35d8387?q=80&w=1489&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(8, 'https://images.unsplash.com/photo-1649769425621-e4a3af8e7c97?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(9, 'https://images.unsplash.com/photo-1680703486830-1b5af60635d7?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(10, 'https://plus.unsplash.com/premium_photo-1661963198655-a671a1f06d25?q=80&w=1631&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(11, 'https://images.unsplash.com/photo-1493809842364-78817add7ffb?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(12, 'https://images.unsplash.com/photo-1560185009-dddeb820c7b7?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(13, 'https://images.unsplash.com/photo-1560185007-c5ca9d2c014d?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(14, 'https://images.unsplash.com/photo-1560184897-0e5d96d86acd?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(15, 'https://images.unsplash.com/photo-1697462247996-51fdc8a1fe0a?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(16, 'https://plus.unsplash.com/premium_photo-1673014202349-38687dd47f94?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(17, 'https://plus.unsplash.com/premium_photo-1673014201324-2eccc35d8387?q=80&w=1489&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(18, 'https://images.unsplash.com/photo-1649769425621-e4a3af8e7c97?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(19, 'https://images.unsplash.com/photo-1680703486830-1b5af60635d7?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(20, 'https://plus.unsplash.com/premium_photo-1661963198655-a671a1f06d25?q=80&w=1631&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(21, 'https://images.unsplash.com/photo-1493809842364-78817add7ffb?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(22, 'https://images.unsplash.com/photo-1493809842364-78817add7ffb?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(23, 'https://images.unsplash.com/photo-1560185009-dddeb820c7b7?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(24, 'https://images.unsplash.com/photo-1560185007-c5ca9d2c014d?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(25, 'https://images.unsplash.com/photo-1560184897-0e5d96d86acd?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(26, 'https://images.unsplash.com/photo-1697462247996-51fdc8a1fe0a?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(27, 'https://plus.unsplash.com/premium_photo-1673014202349-38687dd47f94?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(28, 'https://plus.unsplash.com/premium_photo-1673014201324-2eccc35d8387?q=80&w=1489&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(29, 'https://images.unsplash.com/photo-1649769425621-e4a3af8e7c97?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(30, 'https://images.unsplash.com/photo-1680703486830-1b5af60635d7?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(31, 'https://plus.unsplash.com/premium_photo-1661963198655-a671a1f06d25?q=80&w=1631&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(32, 'https://images.unsplash.com/photo-1493809842364-78817add7ffb?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(33, 'https://images.unsplash.com/photo-1560185009-dddeb820c7b7?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(34, 'https://images.unsplash.com/photo-1560185007-c5ca9d2c014d?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(35, 'https://images.unsplash.com/photo-1560184897-0e5d96d86acd?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(36, 'https://images.unsplash.com/photo-1697462247996-51fdc8a1fe0a?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(37, 'https://plus.unsplash.com/premium_photo-1673014202349-38687dd47f94?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(38, 'https://plus.unsplash.com/premium_photo-1673014201324-2eccc35d8387?q=80&w=1489&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(39, 'https://images.unsplash.com/photo-1649769425621-e4a3af8e7c97?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(40, 'https://images.unsplash.com/photo-1680703486830-1b5af60635d7?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(41, 'https://plus.unsplash.com/premium_photo-1661963198655-a671a1f06d25?q=80&w=1631&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(42, 'https://images.unsplash.com/photo-1493809842364-78817add7ffb?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(43, 'https://images.unsplash.com/photo-1560185007-c5ca9d2c014d?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(44, 'https://images.unsplash.com/photo-1560184897-0e5d96d86acd?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(45, 'https://images.unsplash.com/photo-1697462247996-51fdc8a1fe0a?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(46, 'https://plus.unsplash.com/premium_photo-1673014202349-38687dd47f94?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(47, 'https://plus.unsplash.com/premium_photo-1673014201324-2eccc35d8387?q=80&w=1489&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(48, 'https://images.unsplash.com/photo-1560185007-c5ca9d2c014d?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(49, 'https://images.unsplash.com/photo-1560184897-0e5d96d86acd?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
(50, 'https://images.unsplash.com/photo-1697462247996-51fdc8a1fe0a?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');

GO

INSERT INTO inquilino (idInquilino, mascotas, empresa_trabaja, cantidad_integrantes, ingresos, idPersona)
VALUES (1, 1, 'Microsoft', '3', 50000, 1),
(2, 0, 'Apple', '2', 60000, 2),
(3, 1, 'Nvidia', '4', 70000, 3),
(4, 0, 'AMD', '1', 80000, 4),
(5, 1, 'Goole', '5', 90000, 5),
(6, 0, 'Facebook', '3', 100000, 6),
(7, 1, 'Mercado Libre', '2', 110000, 7),
(8, 0, 'Tesla', '4', 120000, 8),
(9, 1, 'Tecro', '1', 130000, 9),
(10, 0, 'Oracle', '5', 140000, 10);
GO

INSERT INTO martillero (idMartillero, nro_matricula, idPersona)
VALUES (1, 1001, 20),
(2, 1002, 21),
(3, 1003, 22),
(4, 1004, 23),
(5, 1005, 24);
GO

-- Índices para tablas volcadas
--
-- Indices de la tabla comercial
--
ALTER TABLE comercial
  ADD PRIMARY KEY (idComercial,idPropiedad),
  ADD KEY fk_Comercial_Propiedad1 (idPropiedad);
GO
--
-- Indices de la tabla contrato
--
ALTER TABLE contrato
  ADD PRIMARY KEY (nro_contrato),
  ADD KEY fk_Contrato_Propiedad1_idx (idPropiedad),
  ADD KEY fk_Contrato_Inquilino1_idx (idPersona),
  ADD KEY fk_Contrato_Martillero1_idx (idMartillero);
GO
--
-- Indices de la tabla estado
--
ALTER TABLE estado
  ADD PRIMARY KEY (idEstado),
  ADD UNIQUE KEY idEstado_UNIQUE (idEstado);
GO
--
-- Indices de la tabla estadocontrato
--
ALTER TABLE estadocontrato
  ADD PRIMARY KEY (nro_contrato,idEstado),
  ADD KEY fk_Contrato_has_Estado_Estado1_idx (idEstado),
  ADD KEY fk_Contrato_has_Estado_Contrato1_idx (nro_contrato);
GO
--
-- Indices de la tabla familiar
--
ALTER TABLE familiar
  ADD PRIMARY KEY (idFamiliar,idPropiedad),
  ADD KEY fk_Familiar_Propiedad1 (idPropiedad);
GO
--
-- Indices de la tabla firma
--
ALTER TABLE firma
  ADD PRIMARY KEY (nro_contrato,idGarante),
  ADD KEY fk_Contrato_has_Garante_Garante1_idx (idGarante);
GO
--
-- Indices de la tabla garante
--
ALTER TABLE garante
  ADD PRIMARY KEY (idGarante,idPersona),
  ADD KEY fk_Garante_Persona1_idx (idPersona);
GO
--
-- Indices de la tabla imagen_prop
--
ALTER TABLE imagen_prop
  ADD KEY idPropiedad (idPropiedad);
GO
--
-- Indices de la tabla inquilino
--
ALTER TABLE inquilino
  ADD PRIMARY KEY (idInquilino,idPersona),
  ADD KEY fk_Inquilino_Persona1 (idPersona);
GO
--
-- Indices de la tabla martillero
--
ALTER TABLE martillero
  ADD PRIMARY KEY (idMartillero,idPersona),
  ADD KEY fk_Martillero_Persona1_idx (idPersona);
GO
--
-- Indices de la tabla persona
--
ALTER TABLE persona
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY id_UNIQUE (id),
  ADD UNIQUE KEY dni_UNIQUE (dni);
GO
--
-- Indices de la tabla propiedad
--
ALTER TABLE propiedad
  ADD PRIMARY KEY (idPropiedad),
  ADD UNIQUE KEY idPropiedad_UNIQUE (idPropiedad),
  ADD KEY fk_Propiedad_Propietario1_idx (idPropietario);
GO
--
-- Indices de la tabla propietario
--
ALTER TABLE propietario
  ADD PRIMARY KEY (idPropietario,idPersona),
  ADD KEY fk_Propietario_Persona1_idx (idPersona);
GO
--
-- IDENTITY(1,1) de las tablas volcadas
--

--
-- IDENTITY(1,1) de la tabla contrato
--
ALTER TABLE contrato
  MODIFY nro_contrato int NOT NULL IDENTITY(1,1);
GO
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla comercial
--
ALTER TABLE comercial
  ADD CONSTRAINT fk_Comercial_Propiedad1 FOREIGN KEY (idPropiedad) REFERENCES propiedad (idPropiedad);
GO
--
-- Filtros para la tabla contrato
--
ALTER TABLE contrato
  ADD CONSTRAINT fk_Contrato_Inquilino1 FOREIGN KEY (idPersona) REFERENCES inquilino (idInquilino),
  ADD CONSTRAINT fk_Contrato_Martillero1 FOREIGN KEY (idMartillero) REFERENCES martillero (idMartillero),
  ADD CONSTRAINT fk_Contrato_Propiedad1 FOREIGN KEY (idPropiedad) REFERENCES propiedad (idPropiedad);
GO
--
-- Filtros para la tabla estadocontrato
--
ALTER TABLE estadocontrato
  ADD CONSTRAINT fk_Contrato_has_Estado_Contrato1 FOREIGN KEY (nro_contrato) REFERENCES contrato (nro_contrato),
  ADD CONSTRAINT fk_Contrato_has_Estado_Estado1 FOREIGN KEY (idEstado) REFERENCES estado (idEstado);
GO
--
-- Filtros para la tabla familiar
--
ALTER TABLE familiar
  ADD CONSTRAINT fk_Familiar_Propiedad1 FOREIGN KEY (idPropiedad) REFERENCES propiedad (idPropiedad);
GO
--
-- Filtros para la tabla firma
--
ALTER TABLE firma
  ADD CONSTRAINT fk_Contrato_has_Garante_Contrato1 FOREIGN KEY (nro_contrato) REFERENCES contrato (nro_contrato),
  ADD CONSTRAINT fk_Contrato_has_Garante_Garante1 FOREIGN KEY (idGarante) REFERENCES garante (idGarante);
GO
--
-- Filtros para la tabla garante
--
ALTER TABLE garante
  ADD CONSTRAINT fk_Garante_Persona1 FOREIGN KEY (idPersona) REFERENCES persona (id);
GO
--
-- Filtros para la tabla imagen_prop
--
ALTER TABLE imagen_prop
  ADD CONSTRAINT imagen_prop_ibfk_1 FOREIGN KEY (idPropiedad) REFERENCES propiedad (idPropiedad);
GO
--
-- Filtros para la tabla inquilino
--
ALTER TABLE inquilino
  ADD CONSTRAINT fk_Inquilino_Persona1 FOREIGN KEY (idPersona) REFERENCES persona (id);
GO
--
-- Filtros para la tabla martillero
--
ALTER TABLE martillero
  ADD CONSTRAINT fk_Martillero_Persona1 FOREIGN KEY (idPersona) REFERENCES persona (id);
GO
--
-- Filtros para la tabla propiedad
--
ALTER TABLE propiedad
  ADD CONSTRAINT fk_Propiedad_Propietario1 FOREIGN KEY (idPropietario) REFERENCES propietario (idPropietario);
GO
--
-- Filtros para la tabla propietario
--
ALTER TABLE propietario
  ADD CONSTRAINT fk_Propietario_Persona1 FOREIGN KEY (idPersona) REFERENCES persona (id);
GO
COMMIT;
GO

USE [examen3stevenCamachoAlvarez]
GO
/****** Object:  Table [dbo].[encuesta]    Script Date: 18/12/2023 20:08:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[encuesta](
	[NumeroEncuesta] [int] IDENTITY(1,1) NOT NULL,
	[NombreDelParticipante] [nvarchar](50) NOT NULL,
	[EdadDeNacimiento] [int] NOT NULL,
	[CorreoElectronico] [nvarchar](100) NOT NULL,
	[PartidoPoliticoID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NumeroEncuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[partidos]    Script Date: 18/12/2023 20:08:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[partidos](
	[PartidoID] [int] NOT NULL,
	[NombrePartido] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PartidoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[encuesta]  WITH CHECK ADD CHECK  (([EdadDeNacimiento]>=(18) AND [EdadDeNacimiento]<=(50)))
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarEncuesta]    Script Date: 18/12/2023 20:08:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_AgregarEncuesta]
    @Nombre NVARCHAR(50),
    @Edad INT,
    @CorreoElectronico NVARCHAR(100),
    @PartidoPoliticoID INT
AS
BEGIN
    -- Verificar que la edad esté dentro del rango permitido
    IF @Edad < 18 OR @Edad > 50
    BEGIN
        THROW 51000, 'La edad debe estar entre 18 y 50 años.', 1;
        RETURN;
    END

    -- Verificar que el correo electrónico sea válido
    IF NOT EXISTS (SELECT 1 FROM [dbo].[encuesta] WHERE [CorreoElectronico] = @CorreoElectronico)
    BEGIN
        -- Insertar la encuesta si el correo no existe previamente
        INSERT INTO [dbo].[encuesta] ([NombreDelParticipante], [EdadDeNacimiento], [CorreoElectronico], [PartidoPoliticoID])
        VALUES (@Nombre, @Edad, @CorreoElectronico, @PartidoPoliticoID);
        PRINT 'Encuesta agregada exitosamente.';
    END
    ELSE
    BEGIN
        THROW 51000, 'El correo electrónico ya existe en la base de datos.', 1;
    END
END
GO

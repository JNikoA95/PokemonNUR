Use [Master]
GO 

IF  NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'PokeNUR_DB')
	RAISERROR('La base de datos ''PokeNUR_DB'' no existe. Cree la base de datos primero',16,127)
GO

USE [PokeNUR_DB]
GO

PRINT 'Actualizando a la version 1.7.0'

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_VERSION_GetVersion]') AND type in (N'P', N'PC'))
BEGIN

	RAISERROR('La base de datos no esta inicializada',16,127)
	RETURN;

END


DECLARE @intVersionMayor int
DECLARE @intVersionMenor int
DECLARE @intPatch int

EXECUTE [dbo].[usp_VERSION_GetVersion] 
   @intVersionMayor OUTPUT
  ,@intVersionMenor OUTPUT
  ,@intPatch OUTPUT

IF @intVersionMayor IS NULL OR @intVersionMenor IS NULL OR @intPatch IS NULL
BEGIN
	
	RAISERROR('La base de datos no esta inicializada',16,127)
	RETURN;

END


IF @intVersionMayor IS NULL OR @intVersionMenor IS NULL OR NOT (@intVersionMayor = 1 AND @intVersionMenor = 7 AND @intPatch = 1)
BEGIN
	
	RAISERROR('La base de datos no esta en la version 1.7.1. Este script solamente se aplica a la version 1.7.1',16,127)
	RETURN;

END
ELSE
BEGIN
	
	PRINT 'Version OK'

END
GO

ALTER TABLE tblUsuario
	ADD dinero INT DEFAULT 0;
	
ALTER TABLE tblAtaques
	ADD poderAtaque int NOT NULL;
	
ALTER TABLE tblPokemon
	ADD nivel INT DEFAULT 1;
	
ALTER TABLE tblPokemons
	ADD experiencia INT NOT NULL;
	
ALTER TABLE tblPokemons
	ADD experiencia INT NOT NULL;
	
ALTER TABLE tblPokemons
	ADD experiencia INT NOT NULL;
	
USE [PokeNUR_DB]
GO

/****** Object:  Table [dbo].[tblBatallas]    Script Date: 11/02/2017 21:31:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [PokeNUR_DB]
GO

/****** Object:  Table [dbo].[tblBatallas]    Script Date: 11/02/2017 21:34:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblBatallas](
	[codio_id] [int] IDENTITY(1,1) NOT NULL,
	[jugador_1] [int] NOT NULL,
	[jugador_2] [int] NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_tblBatallas] PRIMARY KEY CLUSTERED 
(
	[codio_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblBatallas]  WITH CHECK ADD  CONSTRAINT [FK_tblBatallas_tblUsuario] FOREIGN KEY([jugador_1])
REFERENCES [dbo].[tblUsuario] ([codigo_id])
GO

ALTER TABLE [dbo].[tblBatallas] CHECK CONSTRAINT [FK_tblBatallas_tblUsuario]
GO

ALTER TABLE [dbo].[tblBatallas]  WITH CHECK ADD  CONSTRAINT [FK_tblBatallas_tblUsuario1] FOREIGN KEY([jugador_2])
REFERENCES [dbo].[tblUsuario] ([codigo_id])
GO

ALTER TABLE [dbo].[tblBatallas] CHECK CONSTRAINT [FK_tblBatallas_tblUsuario1]
GO



DELETE FROM tbl_Version
GO

INSERT INTO [dbo].[tbl_Version]
           ([versionMayor]
           ,[versionMenor]
           ,[patch])
     VALUES
           (1
           ,8
           ,0)
GO



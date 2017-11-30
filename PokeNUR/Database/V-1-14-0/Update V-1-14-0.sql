Use [Master]
GO 

IF  NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'PokeNUR_DB')
	RAISERROR('La base de datos ''PokeNUR_DB'' no existe. Cree la base de datos primero',16,127)
GO

USE [PokeNUR_DB]
GO

PRINT 'Actualizando a la version 1.14.0'

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



IF @intVersionMayor IS NULL OR @intVersionMenor IS NULL OR NOT (@intVersionMayor = 1 AND @intVersionMenor = 13 AND @intPatch = 0)
BEGIN
	
	RAISERROR('La base de datos no esta en la version 1.13.0. Este script solamente se aplica a la version 1.13.0',16,127)
	RETURN;

END
ELSE
BEGIN
	
	PRINT 'Version OK'

END
GO

USE [PokeNUR_DB]
GO

DROP TABLE tblPokemonAtaque;

USE [PokeNUR_DB]
GO

/****** Object:  Table [dbo].[TblPokemonAtaque]    Script Date: 11/30/2017 12:01:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TblPokemonAtaque](
	[codigo_id] [int] IDENTITY(1,1) NOT NULL,
	[ataque_id] [int] NOT NULL,
	[pokemon_id] [int] NOT NULL,
	[usuario_id] [int] NOT NULL,
 CONSTRAINT [PK_TblPokemonAtaque] PRIMARY KEY CLUSTERED 
(
	[codigo_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[TblPokemonAtaque]  WITH CHECK ADD  CONSTRAINT [FK_TblPokemonAtaque_tblAtaques] FOREIGN KEY([ataque_id])
REFERENCES [dbo].[tblAtaques] ([codigo_id])
GO

ALTER TABLE [dbo].[TblPokemonAtaque] CHECK CONSTRAINT [FK_TblPokemonAtaque_tblAtaques]
GO

ALTER TABLE [dbo].[TblPokemonAtaque]  WITH CHECK ADD  CONSTRAINT [FK_TblPokemonAtaque_tblPokemons] FOREIGN KEY([pokemon_id])
REFERENCES [dbo].[tblPokemons] ([codigo_id])
GO

ALTER TABLE [dbo].[TblPokemonAtaque] CHECK CONSTRAINT [FK_TblPokemonAtaque_tblPokemons]
GO

ALTER TABLE [dbo].[TblPokemonAtaque]  WITH CHECK ADD  CONSTRAINT [FK_TblPokemonAtaque_tblUsuario] FOREIGN KEY([usuario_id])
REFERENCES [dbo].[tblUsuario] ([codigo_id])
GO

ALTER TABLE [dbo].[TblPokemonAtaque] CHECK CONSTRAINT [FK_TblPokemonAtaque_tblUsuario]
GO


CREATE PROCEDURE [dbo].[mk_tblPokemonAtaque]
	@prmPokemon_id int,
	@ataque_id int,
	@jugador_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	
	INSERT INTO [PokeNUR_DB].[dbo].[tblPokemonAtaque]
           ([ataque_id]
           ,[pokemon_id]
           ,[usuario_id])
     VALUES
           (@ataque_id
           ,@prmPokemon_id
           ,@jugador_id)

END


DELETE FROM tbl_Version

INSERT INTO [dbo].[tbl_Version]
           ([versionMayor]
           ,[versionMenor]
           ,[patch])
     VALUES
           (1
           ,14
           ,0)
GO
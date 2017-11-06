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


IF @intVersionMayor IS NULL OR @intVersionMenor IS NULL OR NOT (@intVersionMayor = 1 AND @intVersionMenor = 8 AND @intPatch = 1)
BEGIN
	
	RAISERROR('La base de datos no esta en la version 1.8.1. Este script solamente se aplica a la version 1.8.1',16,127)
	RETURN;

END
ELSE
BEGIN
	
	PRINT 'Version OK'

END
GO


DBCC CHECKIDENT (tblPokemons, RESEED, 0)

ALTER TABLE tblPokemons
	ADD DEFAULT 0 FOR experiencia;
	
ALTER TABLE tblPokemons
	ADD ant_Pokemon INT;

DELETE FROM [PokeNUR_DB].[dbo].[tblPokemons]
GO

INSERT INTO [dbo].[tblPokemons]
           ([nombre])
     VALUES
           ('Charmander')
GO

INSERT INTO [dbo].[tblPokemons]
           ([nombre])
     VALUES
           ('Bulbasaur')
GO

INSERT INTO [dbo].[tblPokemons]
           ([nombre])
     VALUES
           ('Squirtle')
GO


-- =============================================
-- Author:		Alejandra Sapiain
-- Create date: 10/09/2017
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[mk_tblBatallas]
	@jugador1 INT,
	@jugador2 INT,
	@id INT OUTPUT
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [PokeNUR_DB].[dbo].[tblBatallas]
           ([jugador_1]
           ,[jugador_2]
           ,[estado])
     VALUES
           (@jugador1
           ,@jugador2
           ,0);
          
     SET @id = SCOPE_IDENTITY();
END
GO

DELETE FROM tbl_Version

INSERT INTO [PokeNUR_DB].[dbo].[tbl_Version]
           ([versionMayor]
           ,[versionMenor]
           ,[patch])
     VALUES
           (1
           ,8
           ,1)
GO

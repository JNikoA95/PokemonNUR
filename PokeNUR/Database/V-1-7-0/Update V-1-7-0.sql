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


IF @intVersionMayor IS NULL OR @intVersionMenor IS NULL OR NOT (@intVersionMayor = 1 AND @intVersionMenor = 6 AND @intPatch = 1)
BEGIN
	
	RAISERROR('La base de datos no esta en la version 1.6.1. Este script solamente se aplica a la version 1.6.1',16,127)
	RETURN;

END
ELSE
BEGIN
	
	PRINT 'Version OK'

END
GO

-- =============================================
-- Author:		Marcelo Arrazola
-- Create date: /09/2017
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get_PokemonByUser] 
	-- Add the parameters for the stored procedure here
	@pNick varchar(100),
	@pPass varchar (50)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	
	SELECT  U.[nickName],
			U.[correo],
			P.nombre
	FROM  [dbo].[tblUsuario] U, tblPokemonUsuario PU, tblPokemons P
	WHERE U.[nickName]=@pNick
	AND    U.[password]=@pPass
	AND	   P.codigo_id = PU.pokemon_id
	AND	   U.codigo_id = PU.user_id;
	
	
END
GO

DELETE FROM [dbo].[tbl_Version]
GO

INSERT INTO [dbo].[tbl_Version]
           ([versionMayor]
           ,[versionMenor]
           ,[patch])
     VALUES
           (1
           ,7
           ,0)
GO
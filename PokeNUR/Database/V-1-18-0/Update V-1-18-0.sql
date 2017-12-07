Use [Master]
GO 

IF  NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'PokeNUR_DB')
	RAISERROR('La base de datos ''PokeNUR_DB'' no existe. Cree la base de datos primero',16,127)
GO

USE [PokeNUR_DB]
GO

PRINT 'Actualizando a la version 1.16.0'

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

IF @intVersionMayor IS NULL OR @intVersionMenor IS NULL
BEGIN
	
	RAISERROR('La base de datos no esta inicializada',16,127)
	RETURN;

END


IF @intVersionMayor IS NULL OR @intVersionMenor IS NULL OR NOT (@intVersionMayor = 1 AND @intVersionMenor = 18 AND @intPatch = 0)
BEGIN
	
	RAISERROR('La base de datos no esta en la version 1.18. Este script solamente se aplica a la version 1.18',16,127)
	RETURN;

END
ELSE
BEGIN
	
	PRINT 'Version OK'

END
GO

--update Dinero --

CREATE PROCEDURE upd_dinero
	@Jugador_id int,
	@CantDinero int
	
AS
BEGIN

	SET NOCOUNT ON;

    UPDATE tblUsuario
	   SET dinero = (dinero + @CantDinero)
	 WHERE codigo_id = @Jugador_id

END

-- Update experiencia --

CREATE PROCEDURE upd_experiencia
	@PokemonUserId int,
	@CantExperiencia int
	
AS
BEGIN

	SET NOCOUNT ON;

    UPDATE tblPokemonUsuario
	   SET experiencia = (experiencia + @CantExperiencia)
	 WHERE idPkUser = @PokemonUserId

END

CREATE PROCEDURE get_tblUsuariosSinElLocal
	@idUsuario int
AS
BEGIN

	SET NOCOUNT ON;

    SELECT * FROM tblUsuario where codigo_id <> @idUsuario
    
END

DELETE FROM [dbo].[tbl_Version]
GO

INSERT INTO [dbo].[tbl_Version]
           ([versionMayor]
           ,[versionMenor]
           ,[patch])
     VALUES
           (1
           ,18
           ,1)
GO
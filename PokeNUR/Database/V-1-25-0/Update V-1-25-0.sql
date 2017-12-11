Use [Master]
GO 

IF  NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'PokeNUR_DB')
	RAISERROR('La base de datos ''PokeNUR_DB'' no existe. Cree la base de datos primero',16,127)
GO

USE [PokeNUR_DB]
GO

<<<<<<< HEAD
PRINT 'Actualizando a la version 1.24.0'
=======
PRINT 'Actualizando a la version 1.1.0'
>>>>>>> origin/master

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


IF @intVersionMayor IS NULL OR @intVersionMenor IS NULL OR NOT (@intVersionMayor = 1 AND @intVersionMenor = 24 AND @intPatch = 0)
BEGIN
	
	RAISERROR('La base de datos no esta en la version 1.24.0. Este script solamente se aplica a la version 1.24.0',16,127)

	RETURN;

END
ELSE
BEGIN
	
	PRINT 'Version OK'

END
GO

<<<<<<< HEAD


ALTER TABLE tblBatallas ADD acabo INT NULL;
GO

ALTER PROCEDURE [dbo].[mk_tblBatallas]
	@jugador1 INT,
	@jugador2 INT,
	@id INT OUTPUT
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [dbo].[tblBatallas]
           ([jugador_1]
           ,[jugador_2]
           ,[estado]
           ,[acabo])
     VALUES
           (@jugador1
           ,@jugador2
           ,0
           ,0);
          
     SET @id = SCOPE_IDENTITY();
END
GO


CREATE PROCEDURE [dbo].[upd_tblBatallaEstado]
	@id INT
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	UPDATE [PokeNUR_DB].[dbo].[tblBatallas]
   SET [estado] = 1
 WHERE @id = codio_id
    
END
GO

ALTER PROCEDURE [dbo].[upd_getDatosUsBatalla]
	-- Add the parameters for the stored procedure here
	@idJugador int,
	@estado varchar(5),
	@acabo int
	
	
=======
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE get_pokemonByUsuario
	-- Add the parameters for the stored procedure here
	@idUsuario int,
	@idPokemon int
>>>>>>> origin/master
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
<<<<<<< HEAD
    
	
	
	select U.codigo_id as jugador2, U.nickName as NickName2, U.correo as Correo2, b.codio_id as idBatalla, 
	(select us.codigo_id from tblUsuario us where us.codigo_id = b.jugador_1) as jugador1,
	(select us.nickName from tblUsuario us where us.codigo_id = b.jugador_1) as NickName1,
	(select us.correo from tblUsuario us where us.codigo_id = b.jugador_1) as Correo1
	FROM tblBatallas B JOIN tblUsuario U on B.jugador_2 = u.codigo_id
	where b.estado = @estado and B.jugador_2 = @idJugador and @acabo = 0;
	
	
END


DELETE FROM tbl_Version
=======
	SELECT *
	FROM tblPokemonUsuario
	where user_id = @idUsuario and pokemon_id = @idPokemon
		
END


DELETE FROM [dbo].[tbl_Version]
GO
>>>>>>> origin/master

INSERT INTO [dbo].[tbl_Version]
           ([versionMayor]
           ,[versionMenor]
           ,[patch])
     VALUES
           (1
           ,25
           ,0);

GO

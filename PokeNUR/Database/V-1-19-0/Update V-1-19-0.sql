Use [Master]
GO 

IF  NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'PokeNUR_DB')
  RAISERROR('La base de datos ''PokeNUR_DB'' no existe. Cree la base de datos primero',16,127)
GO

USE [PokeNUR_DB]
GO

PRINT 'Actualizando a la version 1.19.0'

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

ALTER PROCEDURE [dbo].[mk_tblUsuarios]
	@prmNombre varchar(200),
	@prmNickName varchar(100),
	@prmCorreo varchar(150),
	@prmPassword varchar(50),
	@prmDinero int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [dbo].[tblUsuario]
           ([nombre]
           ,[nickName]
           ,[correo]
           ,[password]
           ,[dinero])
     VALUES
           (@prmNombre
           ,@prmNickName
           ,@prmCorreo
           ,@prmPassword
           ,@prmDinero)
END


ALTER PROCEDURE [dbo].[upd_tblUsuarios]
  @prmCodigo_id int,
  @prmNombre varchar(200),
  @prmNickName varchar(100),
  @prmCorreo varchar(150),
  @prmPassword varchar(50),
  @prmDinero int  
AS
BEGIN
  -- SET NOCOUNT ON added to prevent extra result sets from
  -- interfering with SELECT statements.
  SET NOCOUNT ON;

    UPDATE [PokeNUR_DB].[dbo].[tblUsuario]
     SET [nombre] = @prmNombre
      ,[nickName] = @prmNickName
      ,[correo] = @prmCorreo
      ,[password] = @prmPassword
      ,[dinero] = @prmDinero
   WHERE codigo_id = @prmCodigo_id
END

DELETE FROM [dbo].[tbl_Version]
GO

INSERT INTO [dbo].[tbl_Version]
           ([versionMayor]
           ,[versionMenor]
           ,[patch])
     VALUES
           (1
           ,19
           ,0)
GO
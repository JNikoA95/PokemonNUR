Use [Master]
GO 

IF  NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'PokeNUR_DB')
	RAISERROR('La base de datos ''PokeNUR_DB'' no existe. Cree la base de datos primero',16,127)
GO

USE [PokeNUR_DB]
GO

PRINT 'Actualizando a la version 1.4.0'

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


IF @intVersionMayor IS NULL OR @intVersionMenor IS NULL OR NOT (@intVersionMayor = 1 AND @intVersionMenor = 3)
BEGIN
	
	RAISERROR('La base de datos no esta en la version 1.3. Este script solamente se apllica a la version 1.3',16,127)
	RETURN;

END
ELSE
BEGIN
	
	PRINT 'Version OK'

END
GO

-- =============================================
-- Author:		Alejandra Sapiain
-- Create date: 16/09/2017
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getExistCorreo_tblUsuarios]

	@prmCorreo varchar(150),
	@prmExiste int OUTPUT 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT @prmExiste = COUNT(*)
    FROM tblUsuario U
    WHERE U.correo = @prmCorreo;
END
GO

-- =============================================
-- Author:		Alejandra Sapiain
-- Create date: 16/09/2017
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getExistCodigo_tblUsuarios]

	@prmCorreo varchar(150),
	@prmCodigo varchar(150),
	@prmExiste int OUTPUT 
AS
DECLARE
	@prmIdUsuario int;
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT @prmIdUsuario = U.codigo_id
    FROM tblUsuario U
    WHERE U.correo = @prmCorreo;
    
    SELECT @prmExiste = COUNT(*)
    FROM tblCodigoRecuperacion CR
    WHERE CR.codigoRecuperacion = @prmCodigo
    AND CR.usuario_id = @prmIdUsuario;    
    
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
           ,4
           ,0)
GO